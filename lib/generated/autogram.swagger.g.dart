// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autogram.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentPostRequestBody _$DocumentPostRequestBodyFromJson(
        Map<String, dynamic> json) =>
    DocumentPostRequestBody(
      document: Document.fromJson(json['document'] as Map<String, dynamic>),
      parameters: SigningParameters.fromJson(
          json['parameters'] as Map<String, dynamic>),
      payloadMimeType: json['payloadMimeType'] as String,
    );

Map<String, dynamic> _$DocumentPostRequestBodyToJson(
        DocumentPostRequestBody instance) =>
    <String, dynamic>{
      'document': instance.document.toJson(),
      'parameters': instance.parameters.toJson(),
      'payloadMimeType': instance.payloadMimeType,
    };

DataToSignStructure _$DataToSignStructureFromJson(Map<String, dynamic> json) =>
    DataToSignStructure(
      dataToSign: json['dataToSign'] as String,
      signingTime: json['signingTime'] as int,
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

SignDocumentResponse _$SignDocumentResponseFromJson(
        Map<String, dynamic> json) =>
    SignDocumentResponse(
      filename: json['filename'] as String,
      mimeType: signDocumentResponseMimeTypeFromJson(json['mimeType']),
      content: json['content'] as String,
      signedBy: json['signedBy'] as String,
      issuedBy: json['issuedBy'] as String,
    );

Map<String, dynamic> _$SignDocumentResponseToJson(
        SignDocumentResponse instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'mimeType': signDocumentResponseMimeTypeToJson(instance.mimeType),
      'content': instance.content,
      'signedBy': instance.signedBy,
      'issuedBy': instance.issuedBy,
    };

GetDocumentResponse _$GetDocumentResponseFromJson(Map<String, dynamic> json) =>
    GetDocumentResponse(
      filename: json['filename'] as String,
      mimeType: getDocumentResponseMimeTypeFromJson(json['mimeType']),
      content: json['content'] as String,
      signers: (json['signers'] as List<dynamic>?)
          ?.map((e) => GetDocumentResponse$Signers$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDocumentResponseToJson(
        GetDocumentResponse instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'mimeType': getDocumentResponseMimeTypeToJson(instance.mimeType),
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

SigningParameters _$SigningParametersFromJson(Map<String, dynamic> json) =>
    SigningParameters(
      level: signingParametersLevelFromJson(json['level']),
      container: signingParametersContainerNullableFromJson(json['container']),
    );

Map<String, dynamic> _$SigningParametersToJson(SigningParameters instance) =>
    <String, dynamic>{
      'level': signingParametersLevelToJson(instance.level),
      'container': signingParametersContainerNullableToJson(instance.container),
    };

DocumentsGuidDatatosignPost$RequestBody
    _$DocumentsGuidDatatosignPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        DocumentsGuidDatatosignPost$RequestBody(
          signingCertificate: json['signingCertificate'] as String,
        );

Map<String, dynamic> _$DocumentsGuidDatatosignPost$RequestBodyToJson(
        DocumentsGuidDatatosignPost$RequestBody instance) =>
    <String, dynamic>{
      'signingCertificate': instance.signingCertificate,
    };

DocumentsPost$Response _$DocumentsPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    DocumentsPost$Response(
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$DocumentsPost$ResponseToJson(
        DocumentsPost$Response instance) =>
    <String, dynamic>{
      'guid': instance.guid,
    };

DocumentsGuidVisualizationGet$Response
    _$DocumentsGuidVisualizationGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        DocumentsGuidVisualizationGet$Response(
          mimeType: documentsGuidVisualizationGet$ResponseMimeTypeFromJson(
              json['mimeType']),
          filename: json['filename'] as String?,
          content: json['content'] as String,
        );

Map<String, dynamic> _$DocumentsGuidVisualizationGet$ResponseToJson(
        DocumentsGuidVisualizationGet$Response instance) =>
    <String, dynamic>{
      'mimeType': documentsGuidVisualizationGet$ResponseMimeTypeToJson(
          instance.mimeType),
      'filename': instance.filename,
      'content': instance.content,
    };

GetDocumentResponse$Signers$Item _$GetDocumentResponse$Signers$ItemFromJson(
        Map<String, dynamic> json) =>
    GetDocumentResponse$Signers$Item(
      signedBy: json['signedBy'] as String?,
      issuedBy: json['issuedBy'] as String?,
    );

Map<String, dynamic> _$GetDocumentResponse$Signers$ItemToJson(
        GetDocumentResponse$Signers$Item instance) =>
    <String, dynamic>{
      'signedBy': instance.signedBy,
      'issuedBy': instance.issuedBy,
    };
