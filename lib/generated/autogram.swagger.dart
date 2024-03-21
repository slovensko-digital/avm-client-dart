// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'autogram.enums.swagger.dart' as enums;
export 'autogram.enums.swagger.dart';

part 'autogram.swagger.chopper.dart';
part 'autogram.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Autogram extends ChopperService {
  static Autogram create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Autogram(client);
    }

    final newClient = ChopperClient(
        services: [_$Autogram()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Autogram(newClient);
  }

  ///
  ///@param Accept
  Future<chopper.Response<DocumentsPost$Response>> documentsPost({
    String? accept,
    required DocumentPostRequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
        DocumentsPost$Response, () => DocumentsPost$Response.fromJsonFactory);

    return _documentsPost(accept: accept?.toString(), body: body);
  }

  ///
  ///@param Accept
  @Post(
    path: '/documents',
    optionalBody: true,
  )
  Future<chopper.Response<DocumentsPost$Response>> _documentsPost({
    @Header('Accept') String? accept,
    @Body() required DocumentPostRequestBody? body,
  });

  ///
  ///@param guid
  ///@param If-Modified-Since
  ///@param Accept
  Future<chopper.Response<GetDocumentResponse>> documentsGuidGet({
    required String? guid,
    String? ifModifiedSince,
    String? accept,
  }) {
    generatedMapping.putIfAbsent(
        GetDocumentResponse, () => GetDocumentResponse.fromJsonFactory);

    return _documentsGuidGet(
        guid: guid,
        ifModifiedSince: ifModifiedSince?.toString(),
        accept: accept?.toString());
  }

  ///
  ///@param guid
  ///@param If-Modified-Since
  ///@param Accept
  @Get(path: '/documents/{guid}')
  Future<chopper.Response<GetDocumentResponse>> _documentsGuidGet({
    @Path('guid') required String? guid,
    @Header('If-Modified-Since') String? ifModifiedSince,
    @Header('Accept') String? accept,
  });

  ///
  ///@param guid
  Future<chopper.Response> documentsGuidDelete({required String? guid}) {
    return _documentsGuidDelete(guid: guid);
  }

  ///
  ///@param guid
  @Delete(path: '/documents/{guid}')
  Future<chopper.Response> _documentsGuidDelete(
      {@Path('guid') required String? guid});

  ///
  ///@param guid
  ///@param Accept
  Future<chopper.Response<VisualizationResponse>>
      documentsGuidVisualizationGet({
    required String? guid,
    String? accept,
  }) {
    generatedMapping.putIfAbsent(
        VisualizationResponse, () => VisualizationResponse.fromJsonFactory);

    return _documentsGuidVisualizationGet(
        guid: guid, accept: accept?.toString());
  }

  ///
  ///@param guid
  ///@param Accept
  @Get(path: '/documents/{guid}/visualization')
  Future<chopper.Response<VisualizationResponse>>
      _documentsGuidVisualizationGet({
    @Path('guid') required String? guid,
    @Header('Accept') String? accept,
  });

  ///
  ///@param guid
  ///@param Accept
  Future<chopper.Response<DataToSignStructure>> documentsGuidDatatosignPost({
    required String? guid,
    String? accept,
    required DocumentsGuidDatatosignPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
        DataToSignStructure, () => DataToSignStructure.fromJsonFactory);

    return _documentsGuidDatatosignPost(
        guid: guid, accept: accept?.toString(), body: body);
  }

  ///
  ///@param guid
  ///@param Accept
  @Post(
    path: '/documents/{guid}/datatosign',
    optionalBody: true,
  )
  Future<chopper.Response<DataToSignStructure>> _documentsGuidDatatosignPost({
    @Path('guid') required String? guid,
    @Header('Accept') String? accept,
    @Body() required DocumentsGuidDatatosignPost$RequestBody? body,
  });

  ///
  ///@param guid
  ///@param returnSignedDocument Inidcation whether to return signed document in the response. Default to true. Is useful when signing document for external system.
  ///@param Accept
  Future<chopper.Response<SignDocumentResponse>> documentsGuidSignPost({
    required String? guid,
    bool? returnSignedDocument,
    String? accept,
    required SignRequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
        SignDocumentResponse, () => SignDocumentResponse.fromJsonFactory);

    return _documentsGuidSignPost(
        guid: guid,
        returnSignedDocument: returnSignedDocument,
        accept: accept?.toString(),
        body: body);
  }

  ///
  ///@param guid
  ///@param returnSignedDocument Inidcation whether to return signed document in the response. Default to true. Is useful when signing document for external system.
  ///@param Accept
  @Post(
    path: '/documents/{guid}/sign',
    optionalBody: true,
  )
  Future<chopper.Response<SignDocumentResponse>> _documentsGuidSignPost({
    @Path('guid') required String? guid,
    @Query('returnSignedDocument') bool? returnSignedDocument,
    @Header('Accept') String? accept,
    @Body() required SignRequestBody? body,
  });
}

@JsonSerializable(explicitToJson: true)
class DocumentPostRequestBody {
  const DocumentPostRequestBody({
    required this.document,
    required this.parameters,
    required this.payloadMimeType,
  });

  factory DocumentPostRequestBody.fromJson(Map<String, dynamic> json) =>
      _$DocumentPostRequestBodyFromJson(json);

  static const toJsonFactory = _$DocumentPostRequestBodyToJson;
  Map<String, dynamic> toJson() => _$DocumentPostRequestBodyToJson(this);

  @JsonKey(name: 'document')
  final Document document;
  @JsonKey(name: 'parameters')
  final SigningParameters parameters;
  @JsonKey(name: 'payloadMimeType')
  final String payloadMimeType;
  static const fromJsonFactory = _$DocumentPostRequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentPostRequestBody &&
            (identical(other.document, document) ||
                const DeepCollectionEquality()
                    .equals(other.document, document)) &&
            (identical(other.parameters, parameters) ||
                const DeepCollectionEquality()
                    .equals(other.parameters, parameters)) &&
            (identical(other.payloadMimeType, payloadMimeType) ||
                const DeepCollectionEquality()
                    .equals(other.payloadMimeType, payloadMimeType)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(document) ^
      const DeepCollectionEquality().hash(parameters) ^
      const DeepCollectionEquality().hash(payloadMimeType) ^
      runtimeType.hashCode;
}

extension $DocumentPostRequestBodyExtension on DocumentPostRequestBody {
  DocumentPostRequestBody copyWith(
      {Document? document,
      SigningParameters? parameters,
      String? payloadMimeType}) {
    return DocumentPostRequestBody(
        document: document ?? this.document,
        parameters: parameters ?? this.parameters,
        payloadMimeType: payloadMimeType ?? this.payloadMimeType);
  }

  DocumentPostRequestBody copyWithWrapped(
      {Wrapped<Document>? document,
      Wrapped<SigningParameters>? parameters,
      Wrapped<String>? payloadMimeType}) {
    return DocumentPostRequestBody(
        document: (document != null ? document.value : this.document),
        parameters: (parameters != null ? parameters.value : this.parameters),
        payloadMimeType: (payloadMimeType != null
            ? payloadMimeType.value
            : this.payloadMimeType));
  }
}

@JsonSerializable(explicitToJson: true)
class DataToSignStructure {
  const DataToSignStructure({
    required this.dataToSign,
    required this.signingTime,
    required this.signingCertificate,
  });

  factory DataToSignStructure.fromJson(Map<String, dynamic> json) =>
      _$DataToSignStructureFromJson(json);

  static const toJsonFactory = _$DataToSignStructureToJson;
  Map<String, dynamic> toJson() => _$DataToSignStructureToJson(this);

  @JsonKey(name: 'dataToSign')
  final String dataToSign;
  @JsonKey(name: 'signingTime')
  final int signingTime;
  @JsonKey(name: 'signingCertificate')
  final String signingCertificate;
  static const fromJsonFactory = _$DataToSignStructureFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DataToSignStructure &&
            (identical(other.dataToSign, dataToSign) ||
                const DeepCollectionEquality()
                    .equals(other.dataToSign, dataToSign)) &&
            (identical(other.signingTime, signingTime) ||
                const DeepCollectionEquality()
                    .equals(other.signingTime, signingTime)) &&
            (identical(other.signingCertificate, signingCertificate) ||
                const DeepCollectionEquality()
                    .equals(other.signingCertificate, signingCertificate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(dataToSign) ^
      const DeepCollectionEquality().hash(signingTime) ^
      const DeepCollectionEquality().hash(signingCertificate) ^
      runtimeType.hashCode;
}

extension $DataToSignStructureExtension on DataToSignStructure {
  DataToSignStructure copyWith(
      {String? dataToSign, int? signingTime, String? signingCertificate}) {
    return DataToSignStructure(
        dataToSign: dataToSign ?? this.dataToSign,
        signingTime: signingTime ?? this.signingTime,
        signingCertificate: signingCertificate ?? this.signingCertificate);
  }

  DataToSignStructure copyWithWrapped(
      {Wrapped<String>? dataToSign,
      Wrapped<int>? signingTime,
      Wrapped<String>? signingCertificate}) {
    return DataToSignStructure(
        dataToSign: (dataToSign != null ? dataToSign.value : this.dataToSign),
        signingTime:
            (signingTime != null ? signingTime.value : this.signingTime),
        signingCertificate: (signingCertificate != null
            ? signingCertificate.value
            : this.signingCertificate));
  }
}

@JsonSerializable(explicitToJson: true)
class SignRequestBody {
  const SignRequestBody({
    required this.signedData,
    required this.dataToSignStructure,
  });

  factory SignRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignRequestBodyFromJson(json);

  static const toJsonFactory = _$SignRequestBodyToJson;
  Map<String, dynamic> toJson() => _$SignRequestBodyToJson(this);

  @JsonKey(name: 'signedData')
  final String signedData;
  @JsonKey(name: 'dataToSignStructure')
  final DataToSignStructure dataToSignStructure;
  static const fromJsonFactory = _$SignRequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SignRequestBody &&
            (identical(other.signedData, signedData) ||
                const DeepCollectionEquality()
                    .equals(other.signedData, signedData)) &&
            (identical(other.dataToSignStructure, dataToSignStructure) ||
                const DeepCollectionEquality()
                    .equals(other.dataToSignStructure, dataToSignStructure)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(signedData) ^
      const DeepCollectionEquality().hash(dataToSignStructure) ^
      runtimeType.hashCode;
}

extension $SignRequestBodyExtension on SignRequestBody {
  SignRequestBody copyWith(
      {String? signedData, DataToSignStructure? dataToSignStructure}) {
    return SignRequestBody(
        signedData: signedData ?? this.signedData,
        dataToSignStructure: dataToSignStructure ?? this.dataToSignStructure);
  }

  SignRequestBody copyWithWrapped(
      {Wrapped<String>? signedData,
      Wrapped<DataToSignStructure>? dataToSignStructure}) {
    return SignRequestBody(
        signedData: (signedData != null ? signedData.value : this.signedData),
        dataToSignStructure: (dataToSignStructure != null
            ? dataToSignStructure.value
            : this.dataToSignStructure));
  }
}

@JsonSerializable(explicitToJson: true)
class SignDocumentResponse {
  const SignDocumentResponse({
    required this.filename,
    required this.mimeType,
    required this.content,
    required this.signedBy,
    required this.issuedBy,
  });

  factory SignDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$SignDocumentResponseFromJson(json);

  static const toJsonFactory = _$SignDocumentResponseToJson;
  Map<String, dynamic> toJson() => _$SignDocumentResponseToJson(this);

  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(
    name: 'mimeType',
    toJson: signDocumentResponseMimeTypeToJson,
    fromJson: signDocumentResponseMimeTypeFromJson,
  )
  final enums.SignDocumentResponseMimeType mimeType;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'signedBy')
  final String signedBy;
  @JsonKey(name: 'issuedBy')
  final String issuedBy;
  static const fromJsonFactory = _$SignDocumentResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SignDocumentResponse &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality()
                    .equals(other.filename, filename)) &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.signedBy, signedBy) ||
                const DeepCollectionEquality()
                    .equals(other.signedBy, signedBy)) &&
            (identical(other.issuedBy, issuedBy) ||
                const DeepCollectionEquality()
                    .equals(other.issuedBy, issuedBy)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(signedBy) ^
      const DeepCollectionEquality().hash(issuedBy) ^
      runtimeType.hashCode;
}

extension $SignDocumentResponseExtension on SignDocumentResponse {
  SignDocumentResponse copyWith(
      {String? filename,
      enums.SignDocumentResponseMimeType? mimeType,
      String? content,
      String? signedBy,
      String? issuedBy}) {
    return SignDocumentResponse(
        filename: filename ?? this.filename,
        mimeType: mimeType ?? this.mimeType,
        content: content ?? this.content,
        signedBy: signedBy ?? this.signedBy,
        issuedBy: issuedBy ?? this.issuedBy);
  }

  SignDocumentResponse copyWithWrapped(
      {Wrapped<String>? filename,
      Wrapped<enums.SignDocumentResponseMimeType>? mimeType,
      Wrapped<String>? content,
      Wrapped<String>? signedBy,
      Wrapped<String>? issuedBy}) {
    return SignDocumentResponse(
        filename: (filename != null ? filename.value : this.filename),
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        content: (content != null ? content.value : this.content),
        signedBy: (signedBy != null ? signedBy.value : this.signedBy),
        issuedBy: (issuedBy != null ? issuedBy.value : this.issuedBy));
  }
}

@JsonSerializable(explicitToJson: true)
class GetDocumentResponse {
  const GetDocumentResponse({
    required this.filename,
    required this.mimeType,
    required this.content,
    this.signers,
  });

  factory GetDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDocumentResponseFromJson(json);

  static const toJsonFactory = _$GetDocumentResponseToJson;
  Map<String, dynamic> toJson() => _$GetDocumentResponseToJson(this);

  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(
    name: 'mimeType',
    toJson: getDocumentResponseMimeTypeToJson,
    fromJson: getDocumentResponseMimeTypeFromJson,
  )
  final enums.GetDocumentResponseMimeType mimeType;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'signers')
  final List<GetDocumentResponse$Signers$Item>? signers;
  static const fromJsonFactory = _$GetDocumentResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetDocumentResponse &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality()
                    .equals(other.filename, filename)) &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.signers, signers) ||
                const DeepCollectionEquality().equals(other.signers, signers)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(signers) ^
      runtimeType.hashCode;
}

extension $GetDocumentResponseExtension on GetDocumentResponse {
  GetDocumentResponse copyWith(
      {String? filename,
      enums.GetDocumentResponseMimeType? mimeType,
      String? content,
      List<GetDocumentResponse$Signers$Item>? signers}) {
    return GetDocumentResponse(
        filename: filename ?? this.filename,
        mimeType: mimeType ?? this.mimeType,
        content: content ?? this.content,
        signers: signers ?? this.signers);
  }

  GetDocumentResponse copyWithWrapped(
      {Wrapped<String>? filename,
      Wrapped<enums.GetDocumentResponseMimeType>? mimeType,
      Wrapped<String>? content,
      Wrapped<List<GetDocumentResponse$Signers$Item>?>? signers}) {
    return GetDocumentResponse(
        filename: (filename != null ? filename.value : this.filename),
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        content: (content != null ? content.value : this.content),
        signers: (signers != null ? signers.value : this.signers));
  }
}

@JsonSerializable(explicitToJson: true)
class Document {
  const Document({
    required this.filename,
    required this.content,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  static const toJsonFactory = _$DocumentToJson;
  Map<String, dynamic> toJson() => _$DocumentToJson(this);

  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(name: 'content')
  final String content;
  static const fromJsonFactory = _$DocumentFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Document &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality()
                    .equals(other.filename, filename)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $DocumentExtension on Document {
  Document copyWith({String? filename, String? content}) {
    return Document(
        filename: filename ?? this.filename, content: content ?? this.content);
  }

  Document copyWithWrapped(
      {Wrapped<String>? filename, Wrapped<String>? content}) {
    return Document(
        filename: (filename != null ? filename.value : this.filename),
        content: (content != null ? content.value : this.content));
  }
}

@JsonSerializable(explicitToJson: true)
class SigningParameters {
  const SigningParameters({
    required this.level,
    this.container,
  });

  factory SigningParameters.fromJson(Map<String, dynamic> json) =>
      _$SigningParametersFromJson(json);

  static const toJsonFactory = _$SigningParametersToJson;
  Map<String, dynamic> toJson() => _$SigningParametersToJson(this);

  @JsonKey(
    name: 'level',
    toJson: signingParametersLevelToJson,
    fromJson: signingParametersLevelFromJson,
  )
  final enums.SigningParametersLevel level;
  @JsonKey(
    name: 'container',
    toJson: signingParametersContainerNullableToJson,
    fromJson: signingParametersContainerNullableFromJson,
  )
  final enums.SigningParametersContainer? container;
  static const fromJsonFactory = _$SigningParametersFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SigningParameters &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.container, container) ||
                const DeepCollectionEquality()
                    .equals(other.container, container)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(container) ^
      runtimeType.hashCode;
}

extension $SigningParametersExtension on SigningParameters {
  SigningParameters copyWith(
      {enums.SigningParametersLevel? level,
      enums.SigningParametersContainer? container}) {
    return SigningParameters(
        level: level ?? this.level, container: container ?? this.container);
  }

  SigningParameters copyWithWrapped(
      {Wrapped<enums.SigningParametersLevel>? level,
      Wrapped<enums.SigningParametersContainer?>? container}) {
    return SigningParameters(
        level: (level != null ? level.value : this.level),
        container: (container != null ? container.value : this.container));
  }
}

@JsonSerializable(explicitToJson: true)
class VisualizationResponse {
  const VisualizationResponse({
    required this.mimeType,
    required this.filename,
    required this.content,
    this.signers,
  });

  factory VisualizationResponse.fromJson(Map<String, dynamic> json) =>
      _$VisualizationResponseFromJson(json);

  static const toJsonFactory = _$VisualizationResponseToJson;
  Map<String, dynamic> toJson() => _$VisualizationResponseToJson(this);

  @JsonKey(name: 'mimeType')
  final String mimeType;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'signers')
  final List<VisualizationResponse$Signers$Item>? signers;
  static const fromJsonFactory = _$VisualizationResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VisualizationResponse &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality()
                    .equals(other.filename, filename)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.signers, signers) ||
                const DeepCollectionEquality().equals(other.signers, signers)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(signers) ^
      runtimeType.hashCode;
}

extension $VisualizationResponseExtension on VisualizationResponse {
  VisualizationResponse copyWith(
      {String? mimeType,
      String? filename,
      String? content,
      List<VisualizationResponse$Signers$Item>? signers}) {
    return VisualizationResponse(
        mimeType: mimeType ?? this.mimeType,
        filename: filename ?? this.filename,
        content: content ?? this.content,
        signers: signers ?? this.signers);
  }

  VisualizationResponse copyWithWrapped(
      {Wrapped<String>? mimeType,
      Wrapped<String>? filename,
      Wrapped<String>? content,
      Wrapped<List<VisualizationResponse$Signers$Item>?>? signers}) {
    return VisualizationResponse(
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        filename: (filename != null ? filename.value : this.filename),
        content: (content != null ? content.value : this.content),
        signers: (signers != null ? signers.value : this.signers));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentsGuidDatatosignPost$RequestBody {
  const DocumentsGuidDatatosignPost$RequestBody({
    required this.signingCertificate,
    this.addTimestamp,
  });

  factory DocumentsGuidDatatosignPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentsGuidDatatosignPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$DocumentsGuidDatatosignPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentsGuidDatatosignPost$RequestBodyToJson(this);

  @JsonKey(name: 'signingCertificate')
  final String signingCertificate;
  @JsonKey(name: 'addTimestamp', defaultValue: false)
  final bool? addTimestamp;
  static const fromJsonFactory =
      _$DocumentsGuidDatatosignPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentsGuidDatatosignPost$RequestBody &&
            (identical(other.signingCertificate, signingCertificate) ||
                const DeepCollectionEquality()
                    .equals(other.signingCertificate, signingCertificate)) &&
            (identical(other.addTimestamp, addTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.addTimestamp, addTimestamp)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(signingCertificate) ^
      const DeepCollectionEquality().hash(addTimestamp) ^
      runtimeType.hashCode;
}

extension $DocumentsGuidDatatosignPost$RequestBodyExtension
    on DocumentsGuidDatatosignPost$RequestBody {
  DocumentsGuidDatatosignPost$RequestBody copyWith(
      {String? signingCertificate, bool? addTimestamp}) {
    return DocumentsGuidDatatosignPost$RequestBody(
        signingCertificate: signingCertificate ?? this.signingCertificate,
        addTimestamp: addTimestamp ?? this.addTimestamp);
  }

  DocumentsGuidDatatosignPost$RequestBody copyWithWrapped(
      {Wrapped<String>? signingCertificate, Wrapped<bool?>? addTimestamp}) {
    return DocumentsGuidDatatosignPost$RequestBody(
        signingCertificate: (signingCertificate != null
            ? signingCertificate.value
            : this.signingCertificate),
        addTimestamp:
            (addTimestamp != null ? addTimestamp.value : this.addTimestamp));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentsPost$Response {
  const DocumentsPost$Response({
    required this.guid,
  });

  factory DocumentsPost$Response.fromJson(Map<String, dynamic> json) =>
      _$DocumentsPost$ResponseFromJson(json);

  static const toJsonFactory = _$DocumentsPost$ResponseToJson;
  Map<String, dynamic> toJson() => _$DocumentsPost$ResponseToJson(this);

  @JsonKey(name: 'guid')
  final String guid;
  static const fromJsonFactory = _$DocumentsPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentsPost$Response &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^ runtimeType.hashCode;
}

extension $DocumentsPost$ResponseExtension on DocumentsPost$Response {
  DocumentsPost$Response copyWith({String? guid}) {
    return DocumentsPost$Response(guid: guid ?? this.guid);
  }

  DocumentsPost$Response copyWithWrapped({Wrapped<String>? guid}) {
    return DocumentsPost$Response(
        guid: (guid != null ? guid.value : this.guid));
  }
}

@JsonSerializable(explicitToJson: true)
class GetDocumentResponse$Signers$Item {
  const GetDocumentResponse$Signers$Item({
    this.signedBy,
    this.issuedBy,
  });

  factory GetDocumentResponse$Signers$Item.fromJson(
          Map<String, dynamic> json) =>
      _$GetDocumentResponse$Signers$ItemFromJson(json);

  static const toJsonFactory = _$GetDocumentResponse$Signers$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$GetDocumentResponse$Signers$ItemToJson(this);

  @JsonKey(name: 'signedBy')
  final String? signedBy;
  @JsonKey(name: 'issuedBy')
  final String? issuedBy;
  static const fromJsonFactory = _$GetDocumentResponse$Signers$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetDocumentResponse$Signers$Item &&
            (identical(other.signedBy, signedBy) ||
                const DeepCollectionEquality()
                    .equals(other.signedBy, signedBy)) &&
            (identical(other.issuedBy, issuedBy) ||
                const DeepCollectionEquality()
                    .equals(other.issuedBy, issuedBy)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(signedBy) ^
      const DeepCollectionEquality().hash(issuedBy) ^
      runtimeType.hashCode;
}

extension $GetDocumentResponse$Signers$ItemExtension
    on GetDocumentResponse$Signers$Item {
  GetDocumentResponse$Signers$Item copyWith(
      {String? signedBy, String? issuedBy}) {
    return GetDocumentResponse$Signers$Item(
        signedBy: signedBy ?? this.signedBy,
        issuedBy: issuedBy ?? this.issuedBy);
  }

  GetDocumentResponse$Signers$Item copyWithWrapped(
      {Wrapped<String?>? signedBy, Wrapped<String?>? issuedBy}) {
    return GetDocumentResponse$Signers$Item(
        signedBy: (signedBy != null ? signedBy.value : this.signedBy),
        issuedBy: (issuedBy != null ? issuedBy.value : this.issuedBy));
  }
}

@JsonSerializable(explicitToJson: true)
class VisualizationResponse$Signers$Item {
  const VisualizationResponse$Signers$Item({
    this.signedBy,
    this.issuedBy,
  });

  factory VisualizationResponse$Signers$Item.fromJson(
          Map<String, dynamic> json) =>
      _$VisualizationResponse$Signers$ItemFromJson(json);

  static const toJsonFactory = _$VisualizationResponse$Signers$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$VisualizationResponse$Signers$ItemToJson(this);

  @JsonKey(name: 'signedBy')
  final String? signedBy;
  @JsonKey(name: 'issuedBy')
  final String? issuedBy;
  static const fromJsonFactory = _$VisualizationResponse$Signers$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is VisualizationResponse$Signers$Item &&
            (identical(other.signedBy, signedBy) ||
                const DeepCollectionEquality()
                    .equals(other.signedBy, signedBy)) &&
            (identical(other.issuedBy, issuedBy) ||
                const DeepCollectionEquality()
                    .equals(other.issuedBy, issuedBy)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(signedBy) ^
      const DeepCollectionEquality().hash(issuedBy) ^
      runtimeType.hashCode;
}

extension $VisualizationResponse$Signers$ItemExtension
    on VisualizationResponse$Signers$Item {
  VisualizationResponse$Signers$Item copyWith(
      {String? signedBy, String? issuedBy}) {
    return VisualizationResponse$Signers$Item(
        signedBy: signedBy ?? this.signedBy,
        issuedBy: issuedBy ?? this.issuedBy);
  }

  VisualizationResponse$Signers$Item copyWithWrapped(
      {Wrapped<String?>? signedBy, Wrapped<String?>? issuedBy}) {
    return VisualizationResponse$Signers$Item(
        signedBy: (signedBy != null ? signedBy.value : this.signedBy),
        issuedBy: (issuedBy != null ? issuedBy.value : this.issuedBy));
  }
}

String? signDocumentResponseMimeTypeNullableToJson(
    enums.SignDocumentResponseMimeType? signDocumentResponseMimeType) {
  return signDocumentResponseMimeType?.value;
}

String? signDocumentResponseMimeTypeToJson(
    enums.SignDocumentResponseMimeType signDocumentResponseMimeType) {
  return signDocumentResponseMimeType.value;
}

enums.SignDocumentResponseMimeType signDocumentResponseMimeTypeFromJson(
  Object? signDocumentResponseMimeType, [
  enums.SignDocumentResponseMimeType? defaultValue,
]) {
  return enums.SignDocumentResponseMimeType.values
          .firstWhereOrNull((e) => e.value == signDocumentResponseMimeType) ??
      defaultValue ??
      enums.SignDocumentResponseMimeType.swaggerGeneratedUnknown;
}

enums.SignDocumentResponseMimeType?
    signDocumentResponseMimeTypeNullableFromJson(
  Object? signDocumentResponseMimeType, [
  enums.SignDocumentResponseMimeType? defaultValue,
]) {
  if (signDocumentResponseMimeType == null) {
    return null;
  }
  return enums.SignDocumentResponseMimeType.values
          .firstWhereOrNull((e) => e.value == signDocumentResponseMimeType) ??
      defaultValue;
}

String signDocumentResponseMimeTypeExplodedListToJson(
    List<enums.SignDocumentResponseMimeType>? signDocumentResponseMimeType) {
  return signDocumentResponseMimeType?.map((e) => e.value!).join(',') ?? '';
}

List<String> signDocumentResponseMimeTypeListToJson(
    List<enums.SignDocumentResponseMimeType>? signDocumentResponseMimeType) {
  if (signDocumentResponseMimeType == null) {
    return [];
  }

  return signDocumentResponseMimeType.map((e) => e.value!).toList();
}

List<enums.SignDocumentResponseMimeType>
    signDocumentResponseMimeTypeListFromJson(
  List? signDocumentResponseMimeType, [
  List<enums.SignDocumentResponseMimeType>? defaultValue,
]) {
  if (signDocumentResponseMimeType == null) {
    return defaultValue ?? [];
  }

  return signDocumentResponseMimeType
      .map((e) => signDocumentResponseMimeTypeFromJson(e.toString()))
      .toList();
}

List<enums.SignDocumentResponseMimeType>?
    signDocumentResponseMimeTypeNullableListFromJson(
  List? signDocumentResponseMimeType, [
  List<enums.SignDocumentResponseMimeType>? defaultValue,
]) {
  if (signDocumentResponseMimeType == null) {
    return defaultValue;
  }

  return signDocumentResponseMimeType
      .map((e) => signDocumentResponseMimeTypeFromJson(e.toString()))
      .toList();
}

String? getDocumentResponseMimeTypeNullableToJson(
    enums.GetDocumentResponseMimeType? getDocumentResponseMimeType) {
  return getDocumentResponseMimeType?.value;
}

String? getDocumentResponseMimeTypeToJson(
    enums.GetDocumentResponseMimeType getDocumentResponseMimeType) {
  return getDocumentResponseMimeType.value;
}

enums.GetDocumentResponseMimeType getDocumentResponseMimeTypeFromJson(
  Object? getDocumentResponseMimeType, [
  enums.GetDocumentResponseMimeType? defaultValue,
]) {
  return enums.GetDocumentResponseMimeType.values
          .firstWhereOrNull((e) => e.value == getDocumentResponseMimeType) ??
      defaultValue ??
      enums.GetDocumentResponseMimeType.swaggerGeneratedUnknown;
}

enums.GetDocumentResponseMimeType? getDocumentResponseMimeTypeNullableFromJson(
  Object? getDocumentResponseMimeType, [
  enums.GetDocumentResponseMimeType? defaultValue,
]) {
  if (getDocumentResponseMimeType == null) {
    return null;
  }
  return enums.GetDocumentResponseMimeType.values
          .firstWhereOrNull((e) => e.value == getDocumentResponseMimeType) ??
      defaultValue;
}

String getDocumentResponseMimeTypeExplodedListToJson(
    List<enums.GetDocumentResponseMimeType>? getDocumentResponseMimeType) {
  return getDocumentResponseMimeType?.map((e) => e.value!).join(',') ?? '';
}

List<String> getDocumentResponseMimeTypeListToJson(
    List<enums.GetDocumentResponseMimeType>? getDocumentResponseMimeType) {
  if (getDocumentResponseMimeType == null) {
    return [];
  }

  return getDocumentResponseMimeType.map((e) => e.value!).toList();
}

List<enums.GetDocumentResponseMimeType> getDocumentResponseMimeTypeListFromJson(
  List? getDocumentResponseMimeType, [
  List<enums.GetDocumentResponseMimeType>? defaultValue,
]) {
  if (getDocumentResponseMimeType == null) {
    return defaultValue ?? [];
  }

  return getDocumentResponseMimeType
      .map((e) => getDocumentResponseMimeTypeFromJson(e.toString()))
      .toList();
}

List<enums.GetDocumentResponseMimeType>?
    getDocumentResponseMimeTypeNullableListFromJson(
  List? getDocumentResponseMimeType, [
  List<enums.GetDocumentResponseMimeType>? defaultValue,
]) {
  if (getDocumentResponseMimeType == null) {
    return defaultValue;
  }

  return getDocumentResponseMimeType
      .map((e) => getDocumentResponseMimeTypeFromJson(e.toString()))
      .toList();
}

String? signingParametersLevelNullableToJson(
    enums.SigningParametersLevel? signingParametersLevel) {
  return signingParametersLevel?.value;
}

String? signingParametersLevelToJson(
    enums.SigningParametersLevel signingParametersLevel) {
  return signingParametersLevel.value;
}

enums.SigningParametersLevel signingParametersLevelFromJson(
  Object? signingParametersLevel, [
  enums.SigningParametersLevel? defaultValue,
]) {
  return enums.SigningParametersLevel.values
          .firstWhereOrNull((e) => e.value == signingParametersLevel) ??
      defaultValue ??
      enums.SigningParametersLevel.swaggerGeneratedUnknown;
}

enums.SigningParametersLevel? signingParametersLevelNullableFromJson(
  Object? signingParametersLevel, [
  enums.SigningParametersLevel? defaultValue,
]) {
  if (signingParametersLevel == null) {
    return null;
  }
  return enums.SigningParametersLevel.values
          .firstWhereOrNull((e) => e.value == signingParametersLevel) ??
      defaultValue;
}

String signingParametersLevelExplodedListToJson(
    List<enums.SigningParametersLevel>? signingParametersLevel) {
  return signingParametersLevel?.map((e) => e.value!).join(',') ?? '';
}

List<String> signingParametersLevelListToJson(
    List<enums.SigningParametersLevel>? signingParametersLevel) {
  if (signingParametersLevel == null) {
    return [];
  }

  return signingParametersLevel.map((e) => e.value!).toList();
}

List<enums.SigningParametersLevel> signingParametersLevelListFromJson(
  List? signingParametersLevel, [
  List<enums.SigningParametersLevel>? defaultValue,
]) {
  if (signingParametersLevel == null) {
    return defaultValue ?? [];
  }

  return signingParametersLevel
      .map((e) => signingParametersLevelFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersLevel>? signingParametersLevelNullableListFromJson(
  List? signingParametersLevel, [
  List<enums.SigningParametersLevel>? defaultValue,
]) {
  if (signingParametersLevel == null) {
    return defaultValue;
  }

  return signingParametersLevel
      .map((e) => signingParametersLevelFromJson(e.toString()))
      .toList();
}

String? signingParametersContainerNullableToJson(
    enums.SigningParametersContainer? signingParametersContainer) {
  return signingParametersContainer?.value;
}

String? signingParametersContainerToJson(
    enums.SigningParametersContainer signingParametersContainer) {
  return signingParametersContainer.value;
}

enums.SigningParametersContainer signingParametersContainerFromJson(
  Object? signingParametersContainer, [
  enums.SigningParametersContainer? defaultValue,
]) {
  return enums.SigningParametersContainer.values
          .firstWhereOrNull((e) => e.value == signingParametersContainer) ??
      defaultValue ??
      enums.SigningParametersContainer.swaggerGeneratedUnknown;
}

enums.SigningParametersContainer? signingParametersContainerNullableFromJson(
  Object? signingParametersContainer, [
  enums.SigningParametersContainer? defaultValue,
]) {
  if (signingParametersContainer == null) {
    return null;
  }
  return enums.SigningParametersContainer.values
          .firstWhereOrNull((e) => e.value == signingParametersContainer) ??
      defaultValue;
}

String signingParametersContainerExplodedListToJson(
    List<enums.SigningParametersContainer>? signingParametersContainer) {
  return signingParametersContainer?.map((e) => e.value!).join(',') ?? '';
}

List<String> signingParametersContainerListToJson(
    List<enums.SigningParametersContainer>? signingParametersContainer) {
  if (signingParametersContainer == null) {
    return [];
  }

  return signingParametersContainer.map((e) => e.value!).toList();
}

List<enums.SigningParametersContainer> signingParametersContainerListFromJson(
  List? signingParametersContainer, [
  List<enums.SigningParametersContainer>? defaultValue,
]) {
  if (signingParametersContainer == null) {
    return defaultValue ?? [];
  }

  return signingParametersContainer
      .map((e) => signingParametersContainerFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersContainer>?
    signingParametersContainerNullableListFromJson(
  List? signingParametersContainer, [
  List<enums.SigningParametersContainer>? defaultValue,
]) {
  if (signingParametersContainer == null) {
    return defaultValue;
  }

  return signingParametersContainer
      .map((e) => signingParametersContainerFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
