import 'package:intl/intl.dart';

import '../generated/autogram.swagger.dart';
import 'autogram_authenticator.dart';
import 'iautogram_service.dart';
import 'response_functions.dart';

export 'iautogram_service.dart';

/// Implements [IAutogramService] using [Autogram] instance REST API client.
class AutogramService implements IAutogramService {
  final Autogram _autogram;

  AutogramService({
    required Uri baseUrl,
    required String encryptionKey,
  }) : _autogram = Autogram.create(
          baseUrl: baseUrl,
          interceptors: [
            AutogramAuthenticator(
              encryptionKey: encryptionKey,
            ),
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
  Future<PostDeviceResponse> registerDevice(PostDeviceRequestBody body) {
    return _autogram.devicesPost(body: body).then(unwrap);
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
