import 'dart:io';

import 'package:intl/intl.dart';

import '../generated/autogram.swagger.dart';
import 'autogram_authenticator.dart';
import 'iautogram_service.dart';
import 'response_functions.dart';

export 'iautogram_service.dart';

/// Implements [IAutogramService] using [Autogram] instance REST API client.
class AutogramService implements IAutogramService {
  static final Uri _defaultBaseUrl =
      Uri.parse("https://autogram.slovensko.digital/api/v1");

  final Autogram _autogram;

  /// Constructs new [AutogramService] instance.
  AutogramService({
    Uri? baseUrl,
    required String Function() encryptionKeySource,
  }) : _autogram = Autogram.create(
          baseUrl: baseUrl ?? _defaultBaseUrl,
          interceptors: [
            AutogramAuthenticator(encryptionKeySource),
          ],
        );

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
  Future<DocumentValidationResponseBody?> getDocumentValidation(
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
  Future<PostDeviceResponse> registerDevice({
    required String registrationId,
    required String displayName,
  }) {
    // TODO Get public key
    final body = PostDeviceRequestBody(
      platform: Platform.operatingSystem,
      registrationId: registrationId,
      displayName: displayName,
      publicKey: "",
      pushkey: "",
    );

    return _autogram.devicesPost(body: body).then(unwrap);
  }

  @override
  Future<void> registerDeviceIntegration(
    String integrationPairingToken,
  ) {
    // TODO Set JWT in header
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
