import 'dart:io';
import 'dart:isolate';

import 'package:basic_utils/basic_utils.dart' show AsymmetricKeyPair;
import 'package:intl/intl.dart' show DateFormat;

import '../generated/autogram.swagger.dart';
import 'autogram_authenticator.dart';
import 'device_keys_store.dart';
import 'iautogram_service.dart';
import 'keys.dart';
import 'response_functions.dart';

export 'device_keys_store.dart';
export 'iautogram_service.dart';

/// Implements [IAutogramService] using [Autogram] instance REST API client.
class AutogramService implements IAutogramService {
  static final Uri _defaultBaseUrl =
      Uri.parse("https://autogram.slovensko.digital/api/v1");

  final Autogram _autogram;
  final DeviceKeysStore _deviceKeysStore;

  AutogramService._(this._autogram, this._deviceKeysStore);

  /// Constructs new [AutogramService] instance.
  factory AutogramService({
    Uri? baseUrl,
    required String Function() encryptionKeySource,
    required DeviceKeysStore deviceKeysStore,
  }) {
    final authenticator = AutogramAuthenticator(
      encryptionKeySource: encryptionKeySource,
      deviceKeySource: () =>
          // _getDeviceKeys needs to be static so that deviceKeysStore can be used
          _getDeviceKeys(deviceKeysStore).then((keyPair) => keyPair.privateKey),
    );
    final autogram = Autogram.create(
      baseUrl: baseUrl ?? _defaultBaseUrl,
      interceptors: [authenticator],
    );

    return AutogramService._(autogram, deviceKeysStore);
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
    return _autogram.documentsGuidValidationGet(guid: documentId).then(unwrap);
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
  Future<String> registerDevice({
    required String registrationId,
    required String displayName,
  }) async {
    final keyPair = await _getDeviceKeys(_deviceKeysStore);
    final publicKey = keyPair.publicKey.getEncoded();
    final body = PostDeviceRequestBody(
      platform: Platform.operatingSystem,
      registrationId: registrationId,
      displayName: displayName,
      publicKey: publicKey,
    );

    return _autogram
        .devicesPost(body: body)
        .then(unwrap)
        .then((value) => value.guid ?? '');
  }

  @override
  Future<void> registerDeviceIntegration(
    String integrationPairingToken,
  ) {
    final body = PostDeviceIntegrationsRequestBody(
      integrationPairingToken: integrationPairingToken,
    );

    return _autogram.deviceIntegrationsPost(body: body).then(unwrap);
  }

  @override
  Future<GetDeviceIntegrationsResponseBody> listIntegrations() {
    return _autogram.deviceIntegrationsGet().then(unwrap);
  }

  @override
  Future<void> deleteIntegration(String integrationId) {
    return _autogram
        .deviceIntegrationsIntegrationIdDelete(integrationId: integrationId)
        .then(unwrap);
  }

  /// Gets the [AsymmetricKeyPair] for this device.
  /// New value is generated and saved when it was initially empty.
  static Future<AsymmetricKeyPair> _getDeviceKeys(
    DeviceKeysStore deviceKeysStore,
  ) async {
    var value = await deviceKeysStore.load();

    if (value == null) {
      value = await Isolate.run(generateAsymmetricKeyPair);

      deviceKeysStore.save(value!);
    }

    return value;
  }
}

extension _DateTimeExtensions on DateTime {
  static final _imfFixDateFormat =
      DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", 'en_US');

  /// Returns this date formatted as "IMF-fixdate".
  ///
  /// See: <https://datatracker.ietf.org/doc/html/rfc7231#section-7.1.1.1>
  String toImfFixDateString() {
    return _imfFixDateFormat.format(toUtc());
  }
}
