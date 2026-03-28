import '../generated/autogram.swagger.dart';

/// Provides operations to call Autogram service.
abstract class IAutogramService {
  /// Creates new Document.
  ///
  /// Returns: GUID of the posted document.
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

  /// Integration registers itself at the server.
  ///
  /// Params:
  ///  - [displayName] Human-readable name of the integration.
  ///
  /// Returns: Assigned identifier.
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Minimal%20Integration/post_integrations>
  Future<String> registerIntegration({
    required String displayName,
  });

  /// Registers itself at the server.
  ///
  /// Params:
  ///  - [registrationId] Identifier of the app instance registration entry in the notification service (APNS or GCM)
  ///  - [displayName] Human-readable name of the device
  ///
  /// Returns: Assigned identifier.
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Minimal%20Integration/post_devices>
  Future<String> registerDevice({
    required String registrationId,
    required String displayName,
  });

  /// Registers itself for receiving sign requests (push notification) from given integration.
  ///
  /// Params:
  ///  - [deviceId] The Device ID value.
  ///  - [integrationPairingToken] JWT token provided by integration on pairing. The token must contain aud: "device" claim.
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Minimal%20Integration/post_device_integrations>
  Future<void> registerDeviceIntegration({
    required String deviceId,
    required String integrationPairingToken,
  });

  /// Retrieves a list of paired integrations.
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Integration/get_device_integrations>
  Future<GetDeviceIntegrationsResponseBody> listIntegrations();

  /// Deletes integration from its paired integrations.
  ///
  /// Params:
  ///  - [integrationId] Identifier of the integration
  ///
  /// See: <https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml#/Integration/delete_device_integrations__integration_id_>
  Future<void> deleteIntegration(String integrationId);
}
