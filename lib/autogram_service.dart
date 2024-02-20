import 'autogram_authenticator.dart';
import 'generated/autogram.swagger.dart';
import 'iautogram_service.dart';
import 'response_functions.dart';

export 'iautogram_service.dart';

/// Implements [IAutogramService] using [Autogram] instance.
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
    String id,
  ) {
    return _autogram.documentsGuidDelete(guid: id).then(unwrap);
  }

  @override
  Future<DocumentsGuidVisualizationGet$Response> getDocumentVisualization(
    String id,
  ) {
    return _autogram.documentsGuidVisualizationGet(guid: id).then(unwrap);
  }

  @override
  Future<DataToSignStructure> setDataToSign(
    String id,
    DocumentsGuidDatatosignPost$RequestBody body,
  ) {
    return _autogram
        .documentsGuidDatatosignPost(guid: id, body: body)
        .then(unwrap);
  }

  @override
  Future<void> signDocument(
    String id,
    SignRequestBody body, [
    bool returnSignedDocument = true,
  ]) {
    return _autogram
        .documentsGuidSignPost(
          guid: id,
          body: body,
          returnSignedDocument: returnSignedDocument,
        )
        .then(unwrap);
  }
}
