import '../generated/autogram.swagger.dart';

abstract class IAutogramService {
  Future<String> createDocument(
    DocumentPostRequestBody body,
  );

  Future<void> deleteDocument(
    String documentId,
  );

  Future<VisualizationResponse> getDocumentVisualization(
    String documentId,
  );

  Future<DataToSignStructure> setDataToSign(
    String documentId,
    DocumentsGuidDatatosignPost$RequestBody body,
  );

  Future<SignDocumentResponse> signDocument(
    String documentId,
    SignRequestBody body, [
    bool returnSignedDocument = true,
  ]);

  Future<GetDocumentResponse> getDocument(
    String documentId, [
    DateTime? ifModifiedSince,
  ]);
}
