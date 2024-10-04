import '../generated/autogram.swagger.dart';

/// Provides operations to call Autogram service.
abstract class IAutogramService {
  /// Creates new Document.
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Desktop2App%20-%20Extension/post_documents>
  Future<String> createDocument(
    DocumentPostRequestBody body,
  );

  /// Gets the signature parameters of the document.
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Desktop2App%20-%20Client/get_documents__guid__parameters>
  Future<SigningParameters> getDocumentParameters(
    String documentId,
  );

  /// Deletes existing Document by its [documentId].
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Desktop2App%20-%20Extension/delete_documents__guid_>
  Future<void> deleteDocument(
    String documentId,
  );

  /// Requests encrypted document to visualize it.
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Mobile2App/get_documents__guid__visualization>
  Future<DocumentVisualizationResponseBody> getDocumentVisualization(
    String documentId,
  );

  /// Requests a signature validation report of the document.
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Mobile2App/get_documents__guid__validate>
  Future<DocumentValidationResponseBody> getDocumentValidation(
    String documentId,
  );

  /// Sets data to sign.
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Mobile2App/post_documents__guid__datatosign>
  Future<DataToSignStructure> setDataToSign(
    String documentId,
    DataToSignRequestBody body,
  );

  /// Sings the Document.
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Mobile2App/post_documents__guid__sign>
  Future<SignDocumentResponseBody> signDocument(
    String documentId,
    SignRequestBody body, [
    bool returnSignedDocument = true,
  ]);

  /// Gets the signed Document.
  ///
  /// See <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Desktop2App%20-%20Extension/get_documents__guid_>
  Future<GetDocumentResponseBody> getDocument(
    String documentId, [
    DateTime? ifModifiedSince,
  ]);

  /// Registers itself at the server.
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Minimal%20Integration/post_devices>
  Future<PostDeviceResponse> registerDevice({
    required String registrationId,
    required String displayName,
  });

  /// Registers itself for receiving sign requests (push notification) from given integration
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Minimal%20Integration/post_device_integrations>
  Future<void> registerDeviceIntegration(
    String integrationPairingToken,
  );

  /// Retrieves a list of paired integrations.
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Integration/get_device_integrations>
  Future<GetDeviceIntegrationsResponseBody> listIntegrations();

  /// Deletes integration from its paired integrations.
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Integration/delete_device_integrations__integration_id_>
  Future<void> deleteIntegration(String integrationId);
}
