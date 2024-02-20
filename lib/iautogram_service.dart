import 'generated/autogram.swagger.dart';

abstract class IAutogramService {
  Future<String> createDocument(
    DocumentPostRequestBody body,
  );

  Future<void> deleteDocument(
    String id,
  );

  Future<DocumentsGuidVisualizationGet$Response> getDocumentVisualization(
    String id,
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
}
