import 'dart:io';

import 'package:basic_utils/basic_utils.dart' show AsymmetricKeyPair;
import 'package:chopper/chopper.dart' show Request;
import 'package:intl/intl.dart' show DateFormat;

import '../generated/autogram.swagger.dart';
import 'autogram_authenticator.dart';
import 'deep_link_action.dart';
import 'device_keys_store.dart';
import 'iautogram_service.dart';
import 'jwt.dart';
import 'keys.dart';
import 'response_functions.dart';

export 'device_keys_store.dart';
export 'iautogram_service.dart';

/// Implements [IAutogramService] using [Autogram] instance REST API client.
class AutogramService implements IAutogramService {
  static final Uri _defaultBaseUrl =
      Uri.parse("https://autogram.slovensko.digital/api/v1");

  final String _authority;
  final Autogram _autogram;
  final DeviceKeysStore _deviceKeysStore;

  AutogramService._(this._authority, this._autogram, this._deviceKeysStore);

  /// Constructs new [AutogramService] instance.
  ///
  /// Params:
  ///  - [baseUrl] - REST API address
  ///  - [encryptionKeySource] - function that returns "Encryption key" value
  ///  - [deviceKeysStore] - secure store for device private/public keys
  factory AutogramService({
    Uri? baseUrl,
    required String Function() encryptionKeySource,
    required DeviceKeysStore deviceKeysStore,
  }) {
    final authenticator = AutogramAuthenticator(
      encryptionKeySource: encryptionKeySource,
    );
    final finalBaseUrl = baseUrl ?? _defaultBaseUrl;
    final autogram = Autogram.create(
      baseUrl: finalBaseUrl,
      interceptors: [authenticator],
    );

    return AutogramService._(finalBaseUrl.authority, autogram, deviceKeysStore);
  }

  @override
  DeepLinkAction parseDeepLink(
    Uri uri, {
    Set<String> customSchemes = const {},
  }) {
    return DeepLinkAction.parse(
      uri,
      authority: _authority,
      customSchemes: customSchemes,
    );
  }

  @override
  Future<String> createDocument(
    DocumentPostRequestBody body,
  ) {
    return _autogram
        .documentsPost(body: body)
        .then(unwrap)
        .then((value) => value.guid);
  }

  @override
  Future<SigningParameters> getDocumentParameters(
    String documentId,
  ) {
    return _autogram.documentsGuidParametersGet(guid: documentId).then(unwrap);
  }

  @override
  Future<void> deleteDocument(
    String documentId,
  ) {
    return _autogram.documentsGuidDelete(guid: documentId).then(unwrap);
  }

  @override
  Future<DocumentVisualizationResponseBody> getDocumentVisualization(
    String documentId,
  ) {
    return _autogram
        .documentsGuidVisualizationGet(guid: documentId)
        .then(unwrap);
  }

  @override
  Future<DocumentValidationResponseBody> getDocumentValidation(
    String documentId,
  ) {
    return _autogram.documentsGuidValidateGet(guid: documentId).then(unwrap);
  }

  @override
  Future<DataToSignStructure> setDataToSign(
    String documentId,
    DataToSignRequestBody body,
  ) {
    return _autogram
        .documentsGuidDatatosignPost(guid: documentId, body: body)
        .then(unwrap);
  }

  @override
  Future<SignDocumentResponseBody> signDocument(
    String documentId,
    SignRequestBody body, [
    bool returnSignedDocument = true,
  ]) {
    return _autogram
        .documentsGuidSignPost(
          guid: documentId,
          body: body,
          returnSignedDocument: returnSignedDocument,
        )
        .then(unwrap);
  }

  @override
  Future<GetDocumentResponseBody> getDocument(
    String documentId, [
    DateTime? ifModifiedSince,
  ]) {
    return _autogram
        .documentsGuidGet(
          guid: documentId,
          ifModifiedSince: ifModifiedSince?.toImfFixDateString(),
        )
        .then(unwrap);
  }

  @override
  Future<String> registerIntegration({
    required String displayName,
  }) async {
    final keyPair = await _getDeviceKeys();
    final publicKey = keyPair.publicKey.getEncoded();
    final body = PostIntegrationRequestBody(
      platform: "extension",
      displayName: displayName,
      publicKey: publicKey,
    );

    final response = await _autogram.integrationsPost(body: body);

    return unwrap(response).guid;
  }

  @override
  Future<String> registerDevice({
    required String registrationId,
    required String displayName,
  }) async {
    final keyPair = await _getDeviceKeys();
    final publicKey = keyPair.publicKey.getEncoded();
    // TODO Set pushkey base64(AES256 key)
    final pushKey = "R/rfN+z129w1H2iftbr1GOKXdC3OxSJU9PZeHs+W7ts=";
    final body = PostDeviceRequestBody(
      platform: Platform.operatingSystem,
      registrationId: registrationId,
      displayName: displayName,
      publicKey: publicKey,
      pushkey: pushKey,
    );

    final response = await _autogram.devicesPost(body: body);

    return unwrap(response).guid ?? '';
  }

  @override
  Future<void> registerDeviceIntegration({
    required String deviceId,
    required String integrationPairingToken,
  }) async {
    final body = PostDeviceIntegrationsRequestBody(
      integrationPairingToken: integrationPairingToken,
    );

    // return _autogram.deviceIntegrationsPost(body: body).then(unwrap);

    // Need to set Authorization header based on function param, therefore
    // cannot call function above directly!

    final privateKey = await _getDeviceKeys().then((value) => value.privateKey);
    final token = signedJwt(
      subject: deviceId,
      privateKey: privateKey,
      expiresIn: const Duration(minutes: 15),
    );
    final url = Uri.parse('/device-integrations');
    final baseUri = _autogram.client.baseUrl;
    final headers = {
      'Authorization': 'Bearer: $token',
    };
    final request = Request('POST', url, baseUri, body: body, headers: headers);
    final response = await _autogram.client.send<dynamic, dynamic>(request);

    return unwrap(response);
  }

  @override
  Future<GetDeviceIntegrationsResponseBody> listIntegrations() async {
    // TODO Authenticate by _getDeviceKeys()

    final response = await _autogram.deviceIntegrationsGet();

    return unwrap(response);
  }

  @override
  Future<void> deleteIntegration(String integrationId) async {
    // TODO Authenticate by _getDeviceKeys()

    final response = await _autogram.deviceIntegrationsIntegrationIdDelete(
      integrationId: integrationId,
    );

    return unwrap(response);
  }

  /// Gets the [AsymmetricKeyPair] for this device from the [DeviceKeysStore].
  ///
  /// New value is generated and saved when it was initially empty.
  Future<AsymmetricKeyPair> _getDeviceKeys() {
    return _deviceKeysStore.loadOrCreate(generateAsymmetricKeyPair);
  }
}

extension on DateTime {
  static final _imfFixDateFormat =
      DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", 'en_US');

  /// Returns this date formatted as "IMF-fixdate".
  ///
  /// See: <https://datatracker.ietf.org/doc/html/rfc7231#section-7.1.1.1>
  String toImfFixDateString() {
    return _imfFixDateFormat.format(toUtc());
  }
}
