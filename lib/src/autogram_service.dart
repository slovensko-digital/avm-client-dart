import 'package:intl/intl.dart';

import '../generated/autogram.swagger.dart';
import 'autogram_authenticator.dart';
import 'iautogram_service.dart';
import 'response_functions.dart';

export 'iautogram_service.dart';

/// Implements [IAutogramService] using [Autogram] instance.
class AutogramService implements IAutogramService {
  static final _rfcDateFormat =
      DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", 'en_US');

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
  Future<VisualizationResponse> getDocumentVisualization(
    String documentId,
  ) {
    return _autogram
        .documentsGuidVisualizationGet(guid: documentId)
        .then(unwrap);
  }

  @override
  Future<DataToSignStructure> setDataToSign(
    String documentId,
    DocumentsGuidDatatosignPost$RequestBody body,
  ) {
    return _autogram
        .documentsGuidDatatosignPost(guid: documentId, body: body)
        .then(unwrap);
  }

  @override
  Future<SignDocumentResponse> signDocument(
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
  Future<GetDocumentResponse> getDocument(
    String documentId, [
    DateTime? ifModifiedSince,
  ]) {
    return _autogram
        .documentsGuidGet(
          guid: documentId,
          ifModifiedSince: ifModifiedSince != null
              // TODO Extract as extension fun with reasonable name
              // https://datatracker.ietf.org/doc/html/rfc7231#section-7.1.1.1
              ? _rfcDateFormat.format(ifModifiedSince.toUtc())
              : null,
        )
        .then(unwrap);
  }
}
