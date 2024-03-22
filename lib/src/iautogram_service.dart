import '../generated/autogram.swagger.dart';

abstract class IAutogramService {
  Future<String> createDocument(
    DocumentPostRequestBody body,
  );

  Future<void> deleteDocument(
    String documentId,
  );

  Future<DocumentVisualizationResponseBody> getDocumentVisualization(
    String documentId,
  );

  Future<DataToSignStructure> setDataToSign(
    String documentId,
    DataToSignRequestBody body,
  );

  Future<SignDocumentResponseBody> signDocument(
    String documentId,
    SignRequestBody body, [
    bool returnSignedDocument = true,
  ]);

  Future<GetDocumentResponseBody> getDocument(
    String documentId, [
    DateTime? ifModifiedSince,
  ]);
}
