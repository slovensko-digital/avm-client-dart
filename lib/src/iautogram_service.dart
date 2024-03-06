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
    String id,
    DocumentsGuidDatatosignPost$RequestBody body,
  );

  // TODO Use proper return type
  Future<void> signDocument(
    String id,
    SignRequestBody body, [
    bool returnSignedDocument = true,
  ]);

  Future<GetDocumentResponse> getDocument(String id,
      [DateTime? ifModifiedSince]);
}
