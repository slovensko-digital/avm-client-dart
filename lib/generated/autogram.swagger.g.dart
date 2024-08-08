// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autogram.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSignRequestBody _$PostSignRequestBodyFromJson(Map<String, dynamic> json) =>
    PostSignRequestBody(
      documentGuid: json['documentGuid'] as String,
      documentEncryptionKey: json['documentEncryptionKey'] as String,
    );

Map<String, dynamic> _$PostSignRequestBodyToJson(
        PostSignRequestBody instance) =>
    <String, dynamic>{
      'documentGuid': instance.documentGuid,
      'documentEncryptionKey': instance.documentEncryptionKey,
    };

PostIntegrationRequestBody _$PostIntegrationRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PostIntegrationRequestBody(
      platform: json['platform'] as String,
      displayName: json['displayName'] as String,
      publicKey: json['publicKey'] as String,
    );

Map<String, dynamic> _$PostIntegrationRequestBodyToJson(
        PostIntegrationRequestBody instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'displayName': instance.displayName,
      'publicKey': instance.publicKey,
    };

PostIntegrationResponse _$PostIntegrationResponseFromJson(
        Map<String, dynamic> json) =>
    PostIntegrationResponse(
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$PostIntegrationResponseToJson(
        PostIntegrationResponse instance) =>
    <String, dynamic>{
      'guid': instance.guid,
    };

PostDeviceRequestBody _$PostDeviceRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PostDeviceRequestBody(
      platform: json['platform'] as String,
      registrationId: json['registrationId'] as String,
      displayName: json['displayName'] as String,
      publicKey: json['publicKey'] as String,
      pushkey: json['pushkey'] as String,
    );

Map<String, dynamic> _$PostDeviceRequestBodyToJson(
        PostDeviceRequestBody instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'registrationId': instance.registrationId,
      'displayName': instance.displayName,
      'publicKey': instance.publicKey,
      'pushkey': instance.pushkey,
    };

PostDeviceResponse _$PostDeviceResponseFromJson(Map<String, dynamic> json) =>
    PostDeviceResponse(
      guid: json['guid'] as String?,
    );

Map<String, dynamic> _$PostDeviceResponseToJson(PostDeviceResponse instance) =>
    <String, dynamic>{
      'guid': instance.guid,
    };

GetDeviceIntegrationsResponseBody$Item
    _$GetDeviceIntegrationsResponseBody$ItemFromJson(
            Map<String, dynamic> json) =>
        GetDeviceIntegrationsResponseBody$Item(
          integrationId: json['integrationId'] as String,
          platform: json['platform'] as String,
          displayName: json['displayName'] as String,
        );

Map<String, dynamic> _$GetDeviceIntegrationsResponseBody$ItemToJson(
        GetDeviceIntegrationsResponseBody$Item instance) =>
    <String, dynamic>{
      'integrationId': instance.integrationId,
      'platform': instance.platform,
      'displayName': instance.displayName,
    };

GetIntegrationDevicesResponseBody$Item
    _$GetIntegrationDevicesResponseBody$ItemFromJson(
            Map<String, dynamic> json) =>
        GetIntegrationDevicesResponseBody$Item(
          deviceId: json['deviceId'] as String,
          platform: json['platform'] as String,
          displayName: json['displayName'] as String,
        );

Map<String, dynamic> _$GetIntegrationDevicesResponseBody$ItemToJson(
        GetIntegrationDevicesResponseBody$Item instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'platform': instance.platform,
      'displayName': instance.displayName,
    };

PostDeviceIntegrationsRequestBody _$PostDeviceIntegrationsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PostDeviceIntegrationsRequestBody(
      integrationPairingToken: json['integrationPairingToken'] as String,
    );

Map<String, dynamic> _$PostDeviceIntegrationsRequestBodyToJson(
        PostDeviceIntegrationsRequestBody instance) =>
    <String, dynamic>{
      'integrationPairingToken': instance.integrationPairingToken,
    };

DocumentPostRequestBody _$DocumentPostRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DocumentPostRequestBody(
      document: Document.fromJson(json['document'] as Map<String, dynamic>),
      parameters: json['parameters'] == null
          ? null
          : SigningParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      payloadMimeType: json['payloadMimeType'] as String?,
    );

Map<String, dynamic> _$DocumentPostRequestBodyToJson(
        DocumentPostRequestBody instance) =>
    <String, dynamic>{
      'document': instance.document.toJson(),
      'parameters': instance.parameters?.toJson(),
      'payloadMimeType': instance.payloadMimeType,
    };

DataToSignRequestBody _$DataToSignRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DataToSignRequestBody(
      signingCertificate: json['signingCertificate'] as String,
      addTimestamp: json['addTimestamp'] as bool? ?? false,
    );

Map<String, dynamic> _$DataToSignRequestBodyToJson(
        DataToSignRequestBody instance) =>
    <String, dynamic>{
      'signingCertificate': instance.signingCertificate,
      'addTimestamp': instance.addTimestamp,
    };

DataToSignStructure _$DataToSignStructureFromJson(Map<String, dynamic> json) =>
    DataToSignStructure(
      dataToSign: json['dataToSign'] as String,
      signingTime: (json['signingTime'] as num).toInt(),
      signingCertificate: json['signingCertificate'] as String,
    );

Map<String, dynamic> _$DataToSignStructureToJson(
        DataToSignStructure instance) =>
    <String, dynamic>{
      'dataToSign': instance.dataToSign,
      'signingTime': instance.signingTime,
      'signingCertificate': instance.signingCertificate,
    };

SignRequestBody _$SignRequestBodyFromJson(Map<String, dynamic> json) =>
    SignRequestBody(
      signedData: json['signedData'] as String,
      dataToSignStructure: DataToSignStructure.fromJson(
          json['dataToSignStructure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignRequestBodyToJson(SignRequestBody instance) =>
    <String, dynamic>{
      'signedData': instance.signedData,
      'dataToSignStructure': instance.dataToSignStructure.toJson(),
    };

SignDocumentResponseBody _$SignDocumentResponseBodyFromJson(
        Map<String, dynamic> json) =>
    SignDocumentResponseBody(
      filename: json['filename'] as String,
      mimeType: signDocumentResponseBodyMimeTypeFromJson(json['mimeType']),
      content: json['content'] as String,
      signedBy: json['signedBy'] as String,
      issuedBy: json['issuedBy'] as String,
    );

Map<String, dynamic> _$SignDocumentResponseBodyToJson(
        SignDocumentResponseBody instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'mimeType': signDocumentResponseBodyMimeTypeToJson(instance.mimeType),
      'content': instance.content,
      'signedBy': instance.signedBy,
      'issuedBy': instance.issuedBy,
    };

GetDocumentResponseBody _$GetDocumentResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GetDocumentResponseBody(
      filename: json['filename'] as String,
      mimeType: getDocumentResponseBodyMimeTypeFromJson(json['mimeType']),
      content: json['content'] as String,
      signers: (json['signers'] as List<dynamic>?)
          ?.map((e) => GetDocumentResponseBody$Signers$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDocumentResponseBodyToJson(
        GetDocumentResponseBody instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'mimeType': getDocumentResponseBodyMimeTypeToJson(instance.mimeType),
      'content': instance.content,
      'signers': instance.signers?.map((e) => e.toJson()).toList(),
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      filename: json['filename'] as String?,
      content: json['content'] as String,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'filename': instance.filename,
      'content': instance.content,
    };

SignatureLevelResponse _$SignatureLevelResponseFromJson(
        Map<String, dynamic> json) =>
    SignatureLevelResponse(
      level: signatureLevelResponseLevelNullableFromJson(json['level']),
    );

Map<String, dynamic> _$SignatureLevelResponseToJson(
        SignatureLevelResponse instance) =>
    <String, dynamic>{
      'level': signatureLevelResponseLevelNullableToJson(instance.level),
    };

SigningParameters _$SigningParametersFromJson(Map<String, dynamic> json) =>
    SigningParameters(
      checkPDFACompliance: json['checkPDFACompliance'] as bool? ?? false,
      autoLoadEform: json['autoLoadEform'] as bool? ?? false,
      level: signingParametersLevelNullableFromJson(json['level']),
      container: signingParametersContainerNullableFromJson(json['container']),
      containerXmlns: signingParametersContainerXmlnsNullableFromJson(
          json['containerXmlns']),
      embedUsedSchemas: json['embedUsedSchemas'] as bool?,
      identifier: json['identifier'] as String?,
      packaging:
          SigningParameters.signingParametersPackagingPackagingNullableFromJson(
              json['packaging']),
      digestAlgorithm: SigningParameters
          .signingParametersDigestAlgorithmDigestAlgorithmNullableFromJson(
              json['digestAlgorithm']),
      en319132: json['en319132'] as bool? ?? false,
      infoCanonicalization: SigningParameters
          .signingParametersInfoCanonicalizationInfoCanonicalizationNullableFromJson(
              json['infoCanonicalization']),
      propertiesCanonicalization: SigningParameters
          .signingParametersPropertiesCanonicalizationPropertiesCanonicalizationNullableFromJson(
              json['propertiesCanonicalization']),
      keyInfoCanonicalization: SigningParameters
          .signingParametersKeyInfoCanonicalizationKeyInfoCanonicalizationNullableFromJson(
              json['keyInfoCanonicalization']),
      schema: json['schema'] as String?,
      schemaIdentifier: json['schemaIdentifier'] as String?,
      transformation: json['transformation'] as String?,
      transformationIdentifier: json['transformationIdentifier'] as String?,
      transformationLanguage: json['transformationLanguage'] as String?,
      transformationMediaDestinationTypeDescription:
          signingParametersTransformationMediaDestinationTypeDescriptionNullableFromJson(
              json['transformationMediaDestinationTypeDescription']),
      transformationTargetEnvironment:
          json['transformationTargetEnvironment'] as String?,
    );

Map<String, dynamic> _$SigningParametersToJson(SigningParameters instance) =>
    <String, dynamic>{
      'checkPDFACompliance': instance.checkPDFACompliance,
      'autoLoadEform': instance.autoLoadEform,
      'level': signingParametersLevelNullableToJson(instance.level),
      'container': signingParametersContainerNullableToJson(instance.container),
      'containerXmlns': signingParametersContainerXmlnsNullableToJson(
          instance.containerXmlns),
      'embedUsedSchemas': instance.embedUsedSchemas,
      'identifier': instance.identifier,
      'packaging': signingParametersPackagingNullableToJson(instance.packaging),
      'digestAlgorithm': signingParametersDigestAlgorithmNullableToJson(
          instance.digestAlgorithm),
      'en319132': instance.en319132,
      'infoCanonicalization':
          signingParametersInfoCanonicalizationNullableToJson(
              instance.infoCanonicalization),
      'propertiesCanonicalization':
          signingParametersPropertiesCanonicalizationNullableToJson(
              instance.propertiesCanonicalization),
      'keyInfoCanonicalization':
          signingParametersKeyInfoCanonicalizationNullableToJson(
              instance.keyInfoCanonicalization),
      'schema': instance.schema,
      'schemaIdentifier': instance.schemaIdentifier,
      'transformation': instance.transformation,
      'transformationIdentifier': instance.transformationIdentifier,
      'transformationLanguage': instance.transformationLanguage,
      'transformationMediaDestinationTypeDescription':
          signingParametersTransformationMediaDestinationTypeDescriptionNullableToJson(
              instance.transformationMediaDestinationTypeDescription),
      'transformationTargetEnvironment':
          instance.transformationTargetEnvironment,
    };

CreateDocumentResponseBody _$CreateDocumentResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CreateDocumentResponseBody(
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$CreateDocumentResponseBodyToJson(
        CreateDocumentResponseBody instance) =>
    <String, dynamic>{
      'guid': instance.guid,
    };

DocumentVisualizationResponseBody _$DocumentVisualizationResponseBodyFromJson(
        Map<String, dynamic> json) =>
    DocumentVisualizationResponseBody(
      mimeType: json['mimeType'] as String,
      filename: json['filename'] as String?,
      content: json['content'] as String,
    );

Map<String, dynamic> _$DocumentVisualizationResponseBodyToJson(
        DocumentVisualizationResponseBody instance) =>
    <String, dynamic>{
      'mimeType': instance.mimeType,
      'filename': instance.filename,
      'content': instance.content,
    };

DocumentValidationResponseBody _$DocumentValidationResponseBodyFromJson(
        Map<String, dynamic> json) =>
    DocumentValidationResponseBody(
      containerType:
          documentValidationResponseBodyContainerTypeNullableFromJson(
              json['containerType']),
      signatureForm:
          documentValidationResponseBodySignatureFormNullableFromJson(
              json['signatureForm']),
      signatures: (json['signatures'] as List<dynamic>?)
          ?.map((e) => DocumentValidationResponseBody$Signatures$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      signedObjects: (json['signedObjects'] as List<dynamic>?)
          ?.map((e) =>
              DocumentValidationResponseBody$SignedObjects$Item.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      unsignedObjects: (json['unsignedObjects'] as List<dynamic>?)
          ?.map((e) =>
              DocumentValidationResponseBody$UnsignedObjects$Item.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocumentValidationResponseBodyToJson(
        DocumentValidationResponseBody instance) =>
    <String, dynamic>{
      'containerType':
          documentValidationResponseBodyContainerTypeNullableToJson(
              instance.containerType),
      'signatureForm':
          documentValidationResponseBodySignatureFormNullableToJson(
              instance.signatureForm),
      'signatures': instance.signatures?.map((e) => e.toJson()).toList(),
      'signedObjects': instance.signedObjects?.map((e) => e.toJson()).toList(),
      'unsignedObjects':
          instance.unsignedObjects?.map((e) => e.toJson()).toList(),
    };

BadRequestErrorResponseBody _$BadRequestErrorResponseBodyFromJson(
        Map<String, dynamic> json) =>
    BadRequestErrorResponseBody(
      code: json['code'] as String,
      message: json['message'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$BadRequestErrorResponseBodyToJson(
        BadRequestErrorResponseBody instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };

ErrorResponseBody _$ErrorResponseBodyFromJson(Map<String, dynamic> json) =>
    ErrorResponseBody(
      code: errorResponseBodyCodeFromJson(json['code']),
      message: json['message'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$ErrorResponseBodyToJson(ErrorResponseBody instance) =>
    <String, dynamic>{
      'code': errorResponseBodyCodeToJson(instance.code),
      'message': instance.message,
      'details': instance.details,
    };

EncryptionKeyNotProvidedErrorResponseBody
    _$EncryptionKeyNotProvidedErrorResponseBodyFromJson(
            Map<String, dynamic> json) =>
        EncryptionKeyNotProvidedErrorResponseBody(
          code: encryptionKeyNotProvidedErrorResponseBodyCodeFromJson(
              json['code']),
          message: json['message'] as String,
          details: json['details'] as String?,
        );

Map<String, dynamic> _$EncryptionKeyNotProvidedErrorResponseBodyToJson(
        EncryptionKeyNotProvidedErrorResponseBody instance) =>
    <String, dynamic>{
      'code':
          encryptionKeyNotProvidedErrorResponseBodyCodeToJson(instance.code),
      'message': instance.message,
      'details': instance.details,
    };

EncryptionKeyMismatchErrorResponseBody
    _$EncryptionKeyMismatchErrorResponseBodyFromJson(
            Map<String, dynamic> json) =>
        EncryptionKeyMismatchErrorResponseBody(
          code:
              encryptionKeyMismatchErrorResponseBodyCodeFromJson(json['code']),
          message: json['message'] as String,
          details: json['details'] as String?,
        );

Map<String, dynamic> _$EncryptionKeyMismatchErrorResponseBodyToJson(
        EncryptionKeyMismatchErrorResponseBody instance) =>
    <String, dynamic>{
      'code': encryptionKeyMismatchErrorResponseBodyCodeToJson(instance.code),
      'message': instance.message,
      'details': instance.details,
    };

InternalErrorResponseBody _$InternalErrorResponseBodyFromJson(
        Map<String, dynamic> json) =>
    InternalErrorResponseBody(
      code: internalErrorResponseBodyCodeFromJson(json['code']),
      message: json['message'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$InternalErrorResponseBodyToJson(
        InternalErrorResponseBody instance) =>
    <String, dynamic>{
      'code': internalErrorResponseBodyCodeToJson(instance.code),
      'message': instance.message,
      'details': instance.details,
    };

BadGatewayErrorResponseBody _$BadGatewayErrorResponseBodyFromJson(
        Map<String, dynamic> json) =>
    BadGatewayErrorResponseBody(
      code: badGatewayErrorResponseBodyCodeFromJson(json['code']),
      message: json['message'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$BadGatewayErrorResponseBodyToJson(
        BadGatewayErrorResponseBody instance) =>
    <String, dynamic>{
      'code': badGatewayErrorResponseBodyCodeToJson(instance.code),
      'message': instance.message,
      'details': instance.details,
    };

InvalidSignatureErrorResponseBody _$InvalidSignatureErrorResponseBodyFromJson(
        Map<String, dynamic> json) =>
    InvalidSignatureErrorResponseBody(
      code: invalidSignatureErrorResponseBodyCodeFromJson(json['code']),
      message: json['message'] as String,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$InvalidSignatureErrorResponseBodyToJson(
        InvalidSignatureErrorResponseBody instance) =>
    <String, dynamic>{
      'code': invalidSignatureErrorResponseBodyCodeToJson(instance.code),
      'message': instance.message,
      'details': instance.details,
    };

GetDocumentResponseBody$Signers$Item
    _$GetDocumentResponseBody$Signers$ItemFromJson(Map<String, dynamic> json) =>
        GetDocumentResponseBody$Signers$Item(
          signedBy: json['signedBy'] as String?,
          issuedBy: json['issuedBy'] as String?,
        );

Map<String, dynamic> _$GetDocumentResponseBody$Signers$ItemToJson(
        GetDocumentResponseBody$Signers$Item instance) =>
    <String, dynamic>{
      'signedBy': instance.signedBy,
      'issuedBy': instance.issuedBy,
    };

DocumentValidationResponseBody$Signatures$Item
    _$DocumentValidationResponseBody$Signatures$ItemFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$Signatures$Item(
          validationResult:
              DocumentValidationResponseBody$Signatures$Item$ValidationResult
                  .fromJson(json['validationResult'] as Map<String, dynamic>),
          level: documentValidationResponseBody$Signatures$ItemLevelFromJson(
              json['level']),
          claimedSigningTime: json['claimedSigningTime'] as String,
          bestSigningTime: json['bestSigningTime'] as String,
          signingCertificate:
              DocumentValidationResponseBody$Signatures$Item$SigningCertificate
                  .fromJson(json['signingCertificate'] as Map<String, dynamic>),
          areQualifiedTimestamps: json['areQualifiedTimestamps'] as bool,
          timestamps: (json['timestamps'] as List<dynamic>?)
              ?.map((e) =>
                  DocumentValidationResponseBody$Signatures$Item$Timestamps$Item
                      .fromJson(e as Map<String, dynamic>))
              .toList(),
          signedObjectsIds: (json['signedObjectsIds'] as List<dynamic>?)
                  ?.map((e) => e as Object)
                  .toList() ??
              [],
        );

Map<String, dynamic> _$DocumentValidationResponseBody$Signatures$ItemToJson(
        DocumentValidationResponseBody$Signatures$Item instance) =>
    <String, dynamic>{
      'validationResult': instance.validationResult.toJson(),
      'level': documentValidationResponseBody$Signatures$ItemLevelToJson(
          instance.level),
      'claimedSigningTime': instance.claimedSigningTime,
      'bestSigningTime': instance.bestSigningTime,
      'signingCertificate': instance.signingCertificate.toJson(),
      'areQualifiedTimestamps': instance.areQualifiedTimestamps,
      'timestamps': instance.timestamps?.map((e) => e.toJson()).toList(),
      'signedObjectsIds': instance.signedObjectsIds,
    };

DocumentValidationResponseBody$SignedObjects$Item
    _$DocumentValidationResponseBody$SignedObjects$ItemFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$SignedObjects$Item(
          id: json['id'] as String,
          mimeType: json['mimeType'] as String?,
          filename: json['filename'] as String,
        );

Map<String, dynamic> _$DocumentValidationResponseBody$SignedObjects$ItemToJson(
        DocumentValidationResponseBody$SignedObjects$Item instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mimeType': instance.mimeType,
      'filename': instance.filename,
    };

DocumentValidationResponseBody$UnsignedObjects$Item
    _$DocumentValidationResponseBody$UnsignedObjects$ItemFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$UnsignedObjects$Item(
          mimeType: json['mimeType'] as String?,
          filename: json['filename'] as String,
        );

Map<String, dynamic>
    _$DocumentValidationResponseBody$UnsignedObjects$ItemToJson(
            DocumentValidationResponseBody$UnsignedObjects$Item instance) =>
        <String, dynamic>{
          'mimeType': instance.mimeType,
          'filename': instance.filename,
        };

DocumentValidationResponseBody$Signatures$Item$ValidationResult
    _$DocumentValidationResponseBody$Signatures$Item$ValidationResultFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$Signatures$Item$ValidationResult(
          code: (json['code'] as num).toInt(),
          description:
              documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionFromJson(
                  json['description']),
        );

Map<String, dynamic>
    _$DocumentValidationResponseBody$Signatures$Item$ValidationResultToJson(
            DocumentValidationResponseBody$Signatures$Item$ValidationResult
                instance) =>
        <String, dynamic>{
          'code': instance.code,
          'description':
              documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionToJson(
                  instance.description),
        };

DocumentValidationResponseBody$Signatures$Item$SigningCertificate
    _$DocumentValidationResponseBody$Signatures$Item$SigningCertificateFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$Signatures$Item$SigningCertificate(
          qualification:
              DocumentValidationResponseBody$Signatures$Item$SigningCertificate$Qualification
                  .fromJson(json['qualification'] as Map<String, dynamic>),
          issuerDN: json['issuerDN'] as String,
          subjectDN: json['subjectDN'] as String,
          certificateDer: json['certificateDer'] as String,
        );

Map<String, dynamic>
    _$DocumentValidationResponseBody$Signatures$Item$SigningCertificateToJson(
            DocumentValidationResponseBody$Signatures$Item$SigningCertificate
                instance) =>
        <String, dynamic>{
          'qualification': instance.qualification.toJson(),
          'issuerDN': instance.issuerDN,
          'subjectDN': instance.subjectDN,
          'certificateDer': instance.certificateDer,
        };

DocumentValidationResponseBody$Signatures$Item$Timestamps$Item
    _$DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$Signatures$Item$Timestamps$Item(
          qualification:
              DocumentValidationResponseBody$Signatures$Item$Timestamps$Item$Qualification
                  .fromJson(json['qualification'] as Map<String, dynamic>),
          timestampType:
              documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeFromJson(
                  json['timestampType']),
          subjectDN: json['subjectDN'] as String,
          certificateDer: json['certificateDer'] as String,
          productionTime: json['productionTime'] as String,
        );

Map<String, dynamic>
    _$DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemToJson(
            DocumentValidationResponseBody$Signatures$Item$Timestamps$Item
                instance) =>
        <String, dynamic>{
          'qualification': instance.qualification.toJson(),
          'timestampType':
              documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeToJson(
                  instance.timestampType),
          'subjectDN': instance.subjectDN,
          'certificateDer': instance.certificateDer,
          'productionTime': instance.productionTime,
        };

DocumentValidationResponseBody$Signatures$Item$SigningCertificate$Qualification
    _$DocumentValidationResponseBody$Signatures$Item$SigningCertificate$QualificationFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$Signatures$Item$SigningCertificate$Qualification(
          code: (json['code'] as num).toInt(),
          description:
              documentValidationResponseBody$Signatures$Item$SigningCertificate$QualificationDescriptionFromJson(
                  json['description']),
        );

Map<String, dynamic>
    _$DocumentValidationResponseBody$Signatures$Item$SigningCertificate$QualificationToJson(
            DocumentValidationResponseBody$Signatures$Item$SigningCertificate$Qualification
                instance) =>
        <String, dynamic>{
          'code': instance.code,
          'description':
              documentValidationResponseBody$Signatures$Item$SigningCertificate$QualificationDescriptionToJson(
                  instance.description),
        };

DocumentValidationResponseBody$Signatures$Item$Timestamps$Item$Qualification
    _$DocumentValidationResponseBody$Signatures$Item$Timestamps$Item$QualificationFromJson(
            Map<String, dynamic> json) =>
        DocumentValidationResponseBody$Signatures$Item$Timestamps$Item$Qualification(
          code: (json['code'] as num).toInt(),
          description:
              documentValidationResponseBody$Signatures$Item$Timestamps$Item$QualificationDescriptionFromJson(
                  json['description']),
        );

Map<String, dynamic>
    _$DocumentValidationResponseBody$Signatures$Item$Timestamps$Item$QualificationToJson(
            DocumentValidationResponseBody$Signatures$Item$Timestamps$Item$Qualification
                instance) =>
        <String, dynamic>{
          'code': instance.code,
          'description':
              documentValidationResponseBody$Signatures$Item$Timestamps$Item$QualificationDescriptionToJson(
                  instance.description),
        };
