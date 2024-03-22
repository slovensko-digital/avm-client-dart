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
  Future<chopper.Response<CreateDocumentResponseBody>> documentsPost({
    String? accept,
    required DocumentPostRequestBody? body,
  }) {
    generatedMapping.putIfAbsent(CreateDocumentResponseBody,
        () => CreateDocumentResponseBody.fromJsonFactory);

    return _documentsPost(accept: accept?.toString(), body: body);
  }

  ///
  ///@param Accept
  @Post(
    path: '/documents',
    optionalBody: true,
  )
  Future<chopper.Response<CreateDocumentResponseBody>> _documentsPost({
    @Header('Accept') String? accept,
    @Body() required DocumentPostRequestBody? body,
  });

  ///
  ///@param guid
  ///@param If-Modified-Since
  ///@param Accept
  Future<chopper.Response<GetDocumentResponseBody>> documentsGuidGet({
    required String? guid,
    String? ifModifiedSince,
    String? accept,
  }) {
    generatedMapping.putIfAbsent(
        GetDocumentResponseBody, () => GetDocumentResponseBody.fromJsonFactory);

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
  Future<chopper.Response<GetDocumentResponseBody>> _documentsGuidGet({
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
  Future<chopper.Response<DocumentVisualizationResponseBody>>
      documentsGuidVisualizationGet({
    required String? guid,
    String? accept,
  }) {
    generatedMapping.putIfAbsent(DocumentVisualizationResponseBody,
        () => DocumentVisualizationResponseBody.fromJsonFactory);

    return _documentsGuidVisualizationGet(
        guid: guid, accept: accept?.toString());
  }

  ///
  ///@param guid
  ///@param Accept
  @Get(path: '/documents/{guid}/visualization')
  Future<chopper.Response<DocumentVisualizationResponseBody>>
      _documentsGuidVisualizationGet({
    @Path('guid') required String? guid,
    @Header('Accept') String? accept,
  });

  ///
  ///@param guid
  ///@param Accept
  Future<chopper.Response<DocumentValidationResponseBody>>
      documentsGuidValidationGet({
    required String? guid,
    String? accept,
  }) {
    generatedMapping.putIfAbsent(DocumentValidationResponseBody,
        () => DocumentValidationResponseBody.fromJsonFactory);

    return _documentsGuidValidationGet(guid: guid, accept: accept?.toString());
  }

  ///
  ///@param guid
  ///@param Accept
  @Get(path: '/documents/{guid}/validation')
  Future<chopper.Response<DocumentValidationResponseBody>>
      _documentsGuidValidationGet({
    @Path('guid') required String? guid,
    @Header('Accept') String? accept,
  });

  ///
  ///@param guid
  ///@param Accept
  Future<chopper.Response<DataToSignStructure>> documentsGuidDatatosignPost({
    required String? guid,
    String? accept,
    required DataToSignRequestBody? body,
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
    @Body() required DataToSignRequestBody? body,
  });

  ///
  ///@param guid
  ///@param returnSignedDocument Inidcation whether to return signed document in the response. Default to true. Is useful when signing document for external system.
  ///@param Accept
  Future<chopper.Response<SignDocumentResponseBody>> documentsGuidSignPost({
    required String? guid,
    bool? returnSignedDocument,
    String? accept,
    required SignRequestBody? body,
  }) {
    generatedMapping.putIfAbsent(SignDocumentResponseBody,
        () => SignDocumentResponseBody.fromJsonFactory);

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
  Future<chopper.Response<SignDocumentResponseBody>> _documentsGuidSignPost({
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
    this.payloadMimeType,
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
  final String? payloadMimeType;
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
      Wrapped<String?>? payloadMimeType}) {
    return DocumentPostRequestBody(
        document: (document != null ? document.value : this.document),
        parameters: (parameters != null ? parameters.value : this.parameters),
        payloadMimeType: (payloadMimeType != null
            ? payloadMimeType.value
            : this.payloadMimeType));
  }
}

@JsonSerializable(explicitToJson: true)
class DataToSignRequestBody {
  const DataToSignRequestBody({
    required this.signingCertificate,
    this.addTimestamp,
  });

  factory DataToSignRequestBody.fromJson(Map<String, dynamic> json) =>
      _$DataToSignRequestBodyFromJson(json);

  static const toJsonFactory = _$DataToSignRequestBodyToJson;
  Map<String, dynamic> toJson() => _$DataToSignRequestBodyToJson(this);

  @JsonKey(name: 'signingCertificate')
  final String signingCertificate;
  @JsonKey(name: 'addTimestamp', defaultValue: false)
  final bool? addTimestamp;
  static const fromJsonFactory = _$DataToSignRequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DataToSignRequestBody &&
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

extension $DataToSignRequestBodyExtension on DataToSignRequestBody {
  DataToSignRequestBody copyWith(
      {String? signingCertificate, bool? addTimestamp}) {
    return DataToSignRequestBody(
        signingCertificate: signingCertificate ?? this.signingCertificate,
        addTimestamp: addTimestamp ?? this.addTimestamp);
  }

  DataToSignRequestBody copyWithWrapped(
      {Wrapped<String>? signingCertificate, Wrapped<bool?>? addTimestamp}) {
    return DataToSignRequestBody(
        signingCertificate: (signingCertificate != null
            ? signingCertificate.value
            : this.signingCertificate),
        addTimestamp:
            (addTimestamp != null ? addTimestamp.value : this.addTimestamp));
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
class SignDocumentResponseBody {
  const SignDocumentResponseBody({
    required this.filename,
    required this.mimeType,
    required this.content,
    required this.signedBy,
    required this.issuedBy,
  });

  factory SignDocumentResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignDocumentResponseBodyFromJson(json);

  static const toJsonFactory = _$SignDocumentResponseBodyToJson;
  Map<String, dynamic> toJson() => _$SignDocumentResponseBodyToJson(this);

  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(
    name: 'mimeType',
    toJson: signDocumentResponseBodyMimeTypeToJson,
    fromJson: signDocumentResponseBodyMimeTypeFromJson,
  )
  final enums.SignDocumentResponseBodyMimeType mimeType;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'signedBy')
  final String signedBy;
  @JsonKey(name: 'issuedBy')
  final String issuedBy;
  static const fromJsonFactory = _$SignDocumentResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SignDocumentResponseBody &&
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

extension $SignDocumentResponseBodyExtension on SignDocumentResponseBody {
  SignDocumentResponseBody copyWith(
      {String? filename,
      enums.SignDocumentResponseBodyMimeType? mimeType,
      String? content,
      String? signedBy,
      String? issuedBy}) {
    return SignDocumentResponseBody(
        filename: filename ?? this.filename,
        mimeType: mimeType ?? this.mimeType,
        content: content ?? this.content,
        signedBy: signedBy ?? this.signedBy,
        issuedBy: issuedBy ?? this.issuedBy);
  }

  SignDocumentResponseBody copyWithWrapped(
      {Wrapped<String>? filename,
      Wrapped<enums.SignDocumentResponseBodyMimeType>? mimeType,
      Wrapped<String>? content,
      Wrapped<String>? signedBy,
      Wrapped<String>? issuedBy}) {
    return SignDocumentResponseBody(
        filename: (filename != null ? filename.value : this.filename),
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        content: (content != null ? content.value : this.content),
        signedBy: (signedBy != null ? signedBy.value : this.signedBy),
        issuedBy: (issuedBy != null ? issuedBy.value : this.issuedBy));
  }
}

@JsonSerializable(explicitToJson: true)
class GetDocumentResponseBody {
  const GetDocumentResponseBody({
    required this.filename,
    required this.mimeType,
    required this.content,
    this.signers,
  });

  factory GetDocumentResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetDocumentResponseBodyFromJson(json);

  static const toJsonFactory = _$GetDocumentResponseBodyToJson;
  Map<String, dynamic> toJson() => _$GetDocumentResponseBodyToJson(this);

  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(
    name: 'mimeType',
    toJson: getDocumentResponseBodyMimeTypeToJson,
    fromJson: getDocumentResponseBodyMimeTypeFromJson,
  )
  final enums.GetDocumentResponseBodyMimeType mimeType;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'signers')
  final List<GetDocumentResponseBody$Signers$Item>? signers;
  static const fromJsonFactory = _$GetDocumentResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetDocumentResponseBody &&
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

extension $GetDocumentResponseBodyExtension on GetDocumentResponseBody {
  GetDocumentResponseBody copyWith(
      {String? filename,
      enums.GetDocumentResponseBodyMimeType? mimeType,
      String? content,
      List<GetDocumentResponseBody$Signers$Item>? signers}) {
    return GetDocumentResponseBody(
        filename: filename ?? this.filename,
        mimeType: mimeType ?? this.mimeType,
        content: content ?? this.content,
        signers: signers ?? this.signers);
  }

  GetDocumentResponseBody copyWithWrapped(
      {Wrapped<String>? filename,
      Wrapped<enums.GetDocumentResponseBodyMimeType>? mimeType,
      Wrapped<String>? content,
      Wrapped<List<GetDocumentResponseBody$Signers$Item>?>? signers}) {
    return GetDocumentResponseBody(
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
class CreateDocumentResponseBody {
  const CreateDocumentResponseBody({
    required this.guid,
  });

  factory CreateDocumentResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CreateDocumentResponseBodyFromJson(json);

  static const toJsonFactory = _$CreateDocumentResponseBodyToJson;
  Map<String, dynamic> toJson() => _$CreateDocumentResponseBodyToJson(this);

  @JsonKey(name: 'guid')
  final String guid;
  static const fromJsonFactory = _$CreateDocumentResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CreateDocumentResponseBody &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^ runtimeType.hashCode;
}

extension $CreateDocumentResponseBodyExtension on CreateDocumentResponseBody {
  CreateDocumentResponseBody copyWith({String? guid}) {
    return CreateDocumentResponseBody(guid: guid ?? this.guid);
  }

  CreateDocumentResponseBody copyWithWrapped({Wrapped<String>? guid}) {
    return CreateDocumentResponseBody(
        guid: (guid != null ? guid.value : this.guid));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentVisualizationResponseBody {
  const DocumentVisualizationResponseBody({
    required this.mimeType,
    this.filename,
    required this.content,
  });

  factory DocumentVisualizationResponseBody.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentVisualizationResponseBodyFromJson(json);

  static const toJsonFactory = _$DocumentVisualizationResponseBodyToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentVisualizationResponseBodyToJson(this);

  @JsonKey(name: 'mimeType')
  final String mimeType;
  @JsonKey(name: 'filename')
  final String? filename;
  @JsonKey(name: 'content')
  final String content;
  static const fromJsonFactory = _$DocumentVisualizationResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentVisualizationResponseBody &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
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
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(filename) ^
      const DeepCollectionEquality().hash(content) ^
      runtimeType.hashCode;
}

extension $DocumentVisualizationResponseBodyExtension
    on DocumentVisualizationResponseBody {
  DocumentVisualizationResponseBody copyWith(
      {String? mimeType, String? filename, String? content}) {
    return DocumentVisualizationResponseBody(
        mimeType: mimeType ?? this.mimeType,
        filename: filename ?? this.filename,
        content: content ?? this.content);
  }

  DocumentVisualizationResponseBody copyWithWrapped(
      {Wrapped<String>? mimeType,
      Wrapped<String?>? filename,
      Wrapped<String>? content}) {
    return DocumentVisualizationResponseBody(
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        filename: (filename != null ? filename.value : this.filename),
        content: (content != null ? content.value : this.content));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody {
  const DocumentValidationResponseBody({
    required this.fileFormat,
    this.signatures,
    this.signedObjects,
    this.unsignedObjects,
  });

  factory DocumentValidationResponseBody.fromJson(Map<String, dynamic> json) =>
      _$DocumentValidationResponseBodyFromJson(json);

  static const toJsonFactory = _$DocumentValidationResponseBodyToJson;
  Map<String, dynamic> toJson() => _$DocumentValidationResponseBodyToJson(this);

  @JsonKey(
    name: 'fileFormat',
    toJson: documentValidationResponseBodyFileFormatToJson,
    fromJson: documentValidationResponseBodyFileFormatFromJson,
  )
  final enums.DocumentValidationResponseBodyFileFormat fileFormat;
  @JsonKey(name: 'signatures')
  final List<DocumentValidationResponseBody$Signatures$Item>? signatures;
  @JsonKey(name: 'signedObjects')
  final List<DocumentValidationResponseBody$SignedObjects$Item>? signedObjects;
  @JsonKey(name: 'unsignedObjects')
  final List<DocumentValidationResponseBody$UnsignedObjects$Item>?
      unsignedObjects;
  static const fromJsonFactory = _$DocumentValidationResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody &&
            (identical(other.fileFormat, fileFormat) ||
                const DeepCollectionEquality()
                    .equals(other.fileFormat, fileFormat)) &&
            (identical(other.signatures, signatures) ||
                const DeepCollectionEquality()
                    .equals(other.signatures, signatures)) &&
            (identical(other.signedObjects, signedObjects) ||
                const DeepCollectionEquality()
                    .equals(other.signedObjects, signedObjects)) &&
            (identical(other.unsignedObjects, unsignedObjects) ||
                const DeepCollectionEquality()
                    .equals(other.unsignedObjects, unsignedObjects)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fileFormat) ^
      const DeepCollectionEquality().hash(signatures) ^
      const DeepCollectionEquality().hash(signedObjects) ^
      const DeepCollectionEquality().hash(unsignedObjects) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBodyExtension
    on DocumentValidationResponseBody {
  DocumentValidationResponseBody copyWith(
      {enums.DocumentValidationResponseBodyFileFormat? fileFormat,
      List<DocumentValidationResponseBody$Signatures$Item>? signatures,
      List<DocumentValidationResponseBody$SignedObjects$Item>? signedObjects,
      List<DocumentValidationResponseBody$UnsignedObjects$Item>?
          unsignedObjects}) {
    return DocumentValidationResponseBody(
        fileFormat: fileFormat ?? this.fileFormat,
        signatures: signatures ?? this.signatures,
        signedObjects: signedObjects ?? this.signedObjects,
        unsignedObjects: unsignedObjects ?? this.unsignedObjects);
  }

  DocumentValidationResponseBody copyWithWrapped(
      {Wrapped<enums.DocumentValidationResponseBodyFileFormat>? fileFormat,
      Wrapped<List<DocumentValidationResponseBody$Signatures$Item>?>?
          signatures,
      Wrapped<List<DocumentValidationResponseBody$SignedObjects$Item>?>?
          signedObjects,
      Wrapped<List<DocumentValidationResponseBody$UnsignedObjects$Item>?>?
          unsignedObjects}) {
    return DocumentValidationResponseBody(
        fileFormat: (fileFormat != null ? fileFormat.value : this.fileFormat),
        signatures: (signatures != null ? signatures.value : this.signatures),
        signedObjects:
            (signedObjects != null ? signedObjects.value : this.signedObjects),
        unsignedObjects: (unsignedObjects != null
            ? unsignedObjects.value
            : this.unsignedObjects));
  }
}

@JsonSerializable(explicitToJson: true)
class BadRequestErrorResponseBody {
  const BadRequestErrorResponseBody({
    required this.code,
    required this.message,
    this.details,
  });

  factory BadRequestErrorResponseBody.fromJson(Map<String, dynamic> json) =>
      _$BadRequestErrorResponseBodyFromJson(json);

  static const toJsonFactory = _$BadRequestErrorResponseBodyToJson;
  Map<String, dynamic> toJson() => _$BadRequestErrorResponseBodyToJson(this);

  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory = _$BadRequestErrorResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BadRequestErrorResponseBody &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $BadRequestErrorResponseBodyExtension on BadRequestErrorResponseBody {
  BadRequestErrorResponseBody copyWith(
      {String? code, String? message, String? details}) {
    return BadRequestErrorResponseBody(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details);
  }

  BadRequestErrorResponseBody copyWithWrapped(
      {Wrapped<String>? code,
      Wrapped<String>? message,
      Wrapped<String?>? details}) {
    return BadRequestErrorResponseBody(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message),
        details: (details != null ? details.value : this.details));
  }
}

@JsonSerializable(explicitToJson: true)
class ErrorResponseBody {
  const ErrorResponseBody({
    required this.code,
    required this.message,
    this.details,
  });

  factory ErrorResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseBodyFromJson(json);

  static const toJsonFactory = _$ErrorResponseBodyToJson;
  Map<String, dynamic> toJson() => _$ErrorResponseBodyToJson(this);

  @JsonKey(
    name: 'code',
    toJson: errorResponseBodyCodeToJson,
    fromJson: errorResponseBodyCodeFromJson,
  )
  final enums.ErrorResponseBodyCode code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory = _$ErrorResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ErrorResponseBody &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $ErrorResponseBodyExtension on ErrorResponseBody {
  ErrorResponseBody copyWith(
      {enums.ErrorResponseBodyCode? code, String? message, String? details}) {
    return ErrorResponseBody(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details);
  }

  ErrorResponseBody copyWithWrapped(
      {Wrapped<enums.ErrorResponseBodyCode>? code,
      Wrapped<String>? message,
      Wrapped<String?>? details}) {
    return ErrorResponseBody(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message),
        details: (details != null ? details.value : this.details));
  }
}

@JsonSerializable(explicitToJson: true)
class EncryptionKeyNotProvidedErrorResponseBody {
  const EncryptionKeyNotProvidedErrorResponseBody({
    required this.code,
    required this.message,
    this.details,
  });

  factory EncryptionKeyNotProvidedErrorResponseBody.fromJson(
          Map<String, dynamic> json) =>
      _$EncryptionKeyNotProvidedErrorResponseBodyFromJson(json);

  static const toJsonFactory =
      _$EncryptionKeyNotProvidedErrorResponseBodyToJson;
  Map<String, dynamic> toJson() =>
      _$EncryptionKeyNotProvidedErrorResponseBodyToJson(this);

  @JsonKey(
    name: 'code',
    toJson: encryptionKeyNotProvidedErrorResponseBodyCodeToJson,
    fromJson: encryptionKeyNotProvidedErrorResponseBodyCodeFromJson,
  )
  final enums.EncryptionKeyNotProvidedErrorResponseBodyCode code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory =
      _$EncryptionKeyNotProvidedErrorResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EncryptionKeyNotProvidedErrorResponseBody &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $EncryptionKeyNotProvidedErrorResponseBodyExtension
    on EncryptionKeyNotProvidedErrorResponseBody {
  EncryptionKeyNotProvidedErrorResponseBody copyWith(
      {enums.EncryptionKeyNotProvidedErrorResponseBodyCode? code,
      String? message,
      String? details}) {
    return EncryptionKeyNotProvidedErrorResponseBody(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details);
  }

  EncryptionKeyNotProvidedErrorResponseBody copyWithWrapped(
      {Wrapped<enums.EncryptionKeyNotProvidedErrorResponseBodyCode>? code,
      Wrapped<String>? message,
      Wrapped<String?>? details}) {
    return EncryptionKeyNotProvidedErrorResponseBody(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message),
        details: (details != null ? details.value : this.details));
  }
}

@JsonSerializable(explicitToJson: true)
class EncryptionKeyMismatchErrorResponseBody {
  const EncryptionKeyMismatchErrorResponseBody({
    required this.code,
    required this.message,
    this.details,
  });

  factory EncryptionKeyMismatchErrorResponseBody.fromJson(
          Map<String, dynamic> json) =>
      _$EncryptionKeyMismatchErrorResponseBodyFromJson(json);

  static const toJsonFactory = _$EncryptionKeyMismatchErrorResponseBodyToJson;
  Map<String, dynamic> toJson() =>
      _$EncryptionKeyMismatchErrorResponseBodyToJson(this);

  @JsonKey(
    name: 'code',
    toJson: encryptionKeyMismatchErrorResponseBodyCodeToJson,
    fromJson: encryptionKeyMismatchErrorResponseBodyCodeFromJson,
  )
  final enums.EncryptionKeyMismatchErrorResponseBodyCode code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory =
      _$EncryptionKeyMismatchErrorResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EncryptionKeyMismatchErrorResponseBody &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $EncryptionKeyMismatchErrorResponseBodyExtension
    on EncryptionKeyMismatchErrorResponseBody {
  EncryptionKeyMismatchErrorResponseBody copyWith(
      {enums.EncryptionKeyMismatchErrorResponseBodyCode? code,
      String? message,
      String? details}) {
    return EncryptionKeyMismatchErrorResponseBody(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details);
  }

  EncryptionKeyMismatchErrorResponseBody copyWithWrapped(
      {Wrapped<enums.EncryptionKeyMismatchErrorResponseBodyCode>? code,
      Wrapped<String>? message,
      Wrapped<String?>? details}) {
    return EncryptionKeyMismatchErrorResponseBody(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message),
        details: (details != null ? details.value : this.details));
  }
}

@JsonSerializable(explicitToJson: true)
class InternalErrorResponseBody {
  const InternalErrorResponseBody({
    required this.code,
    required this.message,
    this.details,
  });

  factory InternalErrorResponseBody.fromJson(Map<String, dynamic> json) =>
      _$InternalErrorResponseBodyFromJson(json);

  static const toJsonFactory = _$InternalErrorResponseBodyToJson;
  Map<String, dynamic> toJson() => _$InternalErrorResponseBodyToJson(this);

  @JsonKey(
    name: 'code',
    toJson: internalErrorResponseBodyCodeToJson,
    fromJson: internalErrorResponseBodyCodeFromJson,
  )
  final enums.InternalErrorResponseBodyCode code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory = _$InternalErrorResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is InternalErrorResponseBody &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $InternalErrorResponseBodyExtension on InternalErrorResponseBody {
  InternalErrorResponseBody copyWith(
      {enums.InternalErrorResponseBodyCode? code,
      String? message,
      String? details}) {
    return InternalErrorResponseBody(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details);
  }

  InternalErrorResponseBody copyWithWrapped(
      {Wrapped<enums.InternalErrorResponseBodyCode>? code,
      Wrapped<String>? message,
      Wrapped<String?>? details}) {
    return InternalErrorResponseBody(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message),
        details: (details != null ? details.value : this.details));
  }
}

@JsonSerializable(explicitToJson: true)
class BadGatewayErrorResponseBody {
  const BadGatewayErrorResponseBody({
    required this.code,
    required this.message,
    this.details,
  });

  factory BadGatewayErrorResponseBody.fromJson(Map<String, dynamic> json) =>
      _$BadGatewayErrorResponseBodyFromJson(json);

  static const toJsonFactory = _$BadGatewayErrorResponseBodyToJson;
  Map<String, dynamic> toJson() => _$BadGatewayErrorResponseBodyToJson(this);

  @JsonKey(
    name: 'code',
    toJson: badGatewayErrorResponseBodyCodeToJson,
    fromJson: badGatewayErrorResponseBodyCodeFromJson,
  )
  final enums.BadGatewayErrorResponseBodyCode code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory = _$BadGatewayErrorResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BadGatewayErrorResponseBody &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $BadGatewayErrorResponseBodyExtension on BadGatewayErrorResponseBody {
  BadGatewayErrorResponseBody copyWith(
      {enums.BadGatewayErrorResponseBodyCode? code,
      String? message,
      String? details}) {
    return BadGatewayErrorResponseBody(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details);
  }

  BadGatewayErrorResponseBody copyWithWrapped(
      {Wrapped<enums.BadGatewayErrorResponseBodyCode>? code,
      Wrapped<String>? message,
      Wrapped<String?>? details}) {
    return BadGatewayErrorResponseBody(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message),
        details: (details != null ? details.value : this.details));
  }
}

@JsonSerializable(explicitToJson: true)
class InvalidSignatureErrorResponseBody {
  const InvalidSignatureErrorResponseBody({
    required this.code,
    required this.message,
    this.details,
  });

  factory InvalidSignatureErrorResponseBody.fromJson(
          Map<String, dynamic> json) =>
      _$InvalidSignatureErrorResponseBodyFromJson(json);

  static const toJsonFactory = _$InvalidSignatureErrorResponseBodyToJson;
  Map<String, dynamic> toJson() =>
      _$InvalidSignatureErrorResponseBodyToJson(this);

  @JsonKey(
    name: 'code',
    toJson: invalidSignatureErrorResponseBodyCodeToJson,
    fromJson: invalidSignatureErrorResponseBodyCodeFromJson,
  )
  final enums.InvalidSignatureErrorResponseBodyCode code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory = _$InvalidSignatureErrorResponseBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is InvalidSignatureErrorResponseBody &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $InvalidSignatureErrorResponseBodyExtension
    on InvalidSignatureErrorResponseBody {
  InvalidSignatureErrorResponseBody copyWith(
      {enums.InvalidSignatureErrorResponseBodyCode? code,
      String? message,
      String? details}) {
    return InvalidSignatureErrorResponseBody(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details);
  }

  InvalidSignatureErrorResponseBody copyWithWrapped(
      {Wrapped<enums.InvalidSignatureErrorResponseBodyCode>? code,
      Wrapped<String>? message,
      Wrapped<String?>? details}) {
    return InvalidSignatureErrorResponseBody(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message),
        details: (details != null ? details.value : this.details));
  }
}

@JsonSerializable(explicitToJson: true)
class GetDocumentResponseBody$Signers$Item {
  const GetDocumentResponseBody$Signers$Item({
    this.signedBy,
    this.issuedBy,
  });

  factory GetDocumentResponseBody$Signers$Item.fromJson(
          Map<String, dynamic> json) =>
      _$GetDocumentResponseBody$Signers$ItemFromJson(json);

  static const toJsonFactory = _$GetDocumentResponseBody$Signers$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$GetDocumentResponseBody$Signers$ItemToJson(this);

  @JsonKey(name: 'signedBy')
  final String? signedBy;
  @JsonKey(name: 'issuedBy')
  final String? issuedBy;
  static const fromJsonFactory = _$GetDocumentResponseBody$Signers$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetDocumentResponseBody$Signers$Item &&
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

extension $GetDocumentResponseBody$Signers$ItemExtension
    on GetDocumentResponseBody$Signers$Item {
  GetDocumentResponseBody$Signers$Item copyWith(
      {String? signedBy, String? issuedBy}) {
    return GetDocumentResponseBody$Signers$Item(
        signedBy: signedBy ?? this.signedBy,
        issuedBy: issuedBy ?? this.issuedBy);
  }

  GetDocumentResponseBody$Signers$Item copyWithWrapped(
      {Wrapped<String?>? signedBy, Wrapped<String?>? issuedBy}) {
    return GetDocumentResponseBody$Signers$Item(
        signedBy: (signedBy != null ? signedBy.value : this.signedBy),
        issuedBy: (issuedBy != null ? issuedBy.value : this.issuedBy));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item {
  const DocumentValidationResponseBody$Signatures$Item({
    this.validationResult,
    this.signatureInfo,
  });

  factory DocumentValidationResponseBody$Signatures$Item.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$ItemFromJson(json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$ItemToJson(this);

  @JsonKey(name: 'validationResult')
  final DocumentValidationResponseBody$Signatures$Item$ValidationResult?
      validationResult;
  @JsonKey(name: 'signatureInfo')
  final DocumentValidationResponseBody$Signatures$Item$SignatureInfo?
      signatureInfo;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item &&
            (identical(other.validationResult, validationResult) ||
                const DeepCollectionEquality()
                    .equals(other.validationResult, validationResult)) &&
            (identical(other.signatureInfo, signatureInfo) ||
                const DeepCollectionEquality()
                    .equals(other.signatureInfo, signatureInfo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(validationResult) ^
      const DeepCollectionEquality().hash(signatureInfo) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$ItemExtension
    on DocumentValidationResponseBody$Signatures$Item {
  DocumentValidationResponseBody$Signatures$Item copyWith(
      {DocumentValidationResponseBody$Signatures$Item$ValidationResult?
          validationResult,
      DocumentValidationResponseBody$Signatures$Item$SignatureInfo?
          signatureInfo}) {
    return DocumentValidationResponseBody$Signatures$Item(
        validationResult: validationResult ?? this.validationResult,
        signatureInfo: signatureInfo ?? this.signatureInfo);
  }

  DocumentValidationResponseBody$Signatures$Item copyWithWrapped(
      {Wrapped<
              DocumentValidationResponseBody$Signatures$Item$ValidationResult?>?
          validationResult,
      Wrapped<DocumentValidationResponseBody$Signatures$Item$SignatureInfo?>?
          signatureInfo}) {
    return DocumentValidationResponseBody$Signatures$Item(
        validationResult: (validationResult != null
            ? validationResult.value
            : this.validationResult),
        signatureInfo:
            (signatureInfo != null ? signatureInfo.value : this.signatureInfo));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$SignedObjects$Item {
  const DocumentValidationResponseBody$SignedObjects$Item({
    this.id,
    this.mimeType,
    this.filename,
  });

  factory DocumentValidationResponseBody$SignedObjects$Item.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$SignedObjects$ItemFromJson(json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$SignedObjects$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$SignedObjects$ItemToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'mimeType')
  final String? mimeType;
  @JsonKey(name: 'filename')
  final String? filename;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$SignedObjects$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$SignedObjects$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality()
                    .equals(other.filename, filename)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(filename) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$SignedObjects$ItemExtension
    on DocumentValidationResponseBody$SignedObjects$Item {
  DocumentValidationResponseBody$SignedObjects$Item copyWith(
      {String? id, String? mimeType, String? filename}) {
    return DocumentValidationResponseBody$SignedObjects$Item(
        id: id ?? this.id,
        mimeType: mimeType ?? this.mimeType,
        filename: filename ?? this.filename);
  }

  DocumentValidationResponseBody$SignedObjects$Item copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? mimeType,
      Wrapped<String?>? filename}) {
    return DocumentValidationResponseBody$SignedObjects$Item(
        id: (id != null ? id.value : this.id),
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        filename: (filename != null ? filename.value : this.filename));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$UnsignedObjects$Item {
  const DocumentValidationResponseBody$UnsignedObjects$Item({
    this.mimeType,
    this.filename,
  });

  factory DocumentValidationResponseBody$UnsignedObjects$Item.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$UnsignedObjects$ItemFromJson(json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$UnsignedObjects$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$UnsignedObjects$ItemToJson(this);

  @JsonKey(name: 'mimeType')
  final String? mimeType;
  @JsonKey(name: 'filename')
  final String? filename;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$UnsignedObjects$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$UnsignedObjects$Item &&
            (identical(other.mimeType, mimeType) ||
                const DeepCollectionEquality()
                    .equals(other.mimeType, mimeType)) &&
            (identical(other.filename, filename) ||
                const DeepCollectionEquality()
                    .equals(other.filename, filename)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(mimeType) ^
      const DeepCollectionEquality().hash(filename) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$UnsignedObjects$ItemExtension
    on DocumentValidationResponseBody$UnsignedObjects$Item {
  DocumentValidationResponseBody$UnsignedObjects$Item copyWith(
      {String? mimeType, String? filename}) {
    return DocumentValidationResponseBody$UnsignedObjects$Item(
        mimeType: mimeType ?? this.mimeType,
        filename: filename ?? this.filename);
  }

  DocumentValidationResponseBody$UnsignedObjects$Item copyWithWrapped(
      {Wrapped<String?>? mimeType, Wrapped<String?>? filename}) {
    return DocumentValidationResponseBody$UnsignedObjects$Item(
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        filename: (filename != null ? filename.value : this.filename));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$ValidationResult {
  const DocumentValidationResponseBody$Signatures$Item$ValidationResult({
    this.code,
    this.description,
  });

  factory DocumentValidationResponseBody$Signatures$Item$ValidationResult.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$ValidationResultFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$ValidationResultToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$ValidationResultToJson(
          this);

  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(
    name: 'description',
    toJson:
        documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionNullableToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionNullableFromJson,
  )
  final enums
      .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription?
      description;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$ValidationResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$ValidationResult &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$ValidationResultExtension
    on DocumentValidationResponseBody$Signatures$Item$ValidationResult {
  DocumentValidationResponseBody$Signatures$Item$ValidationResult copyWith(
      {int? code,
      enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription?
          description}) {
    return DocumentValidationResponseBody$Signatures$Item$ValidationResult(
        code: code ?? this.code, description: description ?? this.description);
  }

  DocumentValidationResponseBody$Signatures$Item$ValidationResult copyWithWrapped(
      {Wrapped<int?>? code,
      Wrapped<
              enums
              .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription?>?
          description}) {
    return DocumentValidationResponseBody$Signatures$Item$ValidationResult(
        code: (code != null ? code.value : this.code),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$SignatureInfo {
  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo({
    this.claimedSigningTime,
    this.timestampSigningTime,
    this.level,
    this.signingCertificate,
    this.isTimestamped,
    this.timestamps,
    this.signedObjectsIds,
  });

  factory DocumentValidationResponseBody$Signatures$Item$SignatureInfo.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfoFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfoToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfoToJson(
          this);

  @JsonKey(name: 'claimedSigningTime')
  final String? claimedSigningTime;
  @JsonKey(name: 'timestampSigningTime')
  final String? timestampSigningTime;
  @JsonKey(
    name: 'level',
    toJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfoLevelNullableToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfoLevelNullableFromJson,
  )
  final enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel?
      level;
  @JsonKey(name: 'signingCertificate')
  final DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate?
      signingCertificate;
  @JsonKey(name: 'isTimestamped')
  final bool? isTimestamped;
  @JsonKey(name: 'timestamps')
  final List<
          DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item>?
      timestamps;
  @JsonKey(name: 'signedObjectsIds', defaultValue: <String>[])
  final List<String>? signedObjectsIds;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$SignatureInfo &&
            (identical(other.claimedSigningTime, claimedSigningTime) ||
                const DeepCollectionEquality()
                    .equals(other.claimedSigningTime, claimedSigningTime)) &&
            (identical(other.timestampSigningTime, timestampSigningTime) ||
                const DeepCollectionEquality().equals(
                    other.timestampSigningTime, timestampSigningTime)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.signingCertificate, signingCertificate) ||
                const DeepCollectionEquality()
                    .equals(other.signingCertificate, signingCertificate)) &&
            (identical(other.isTimestamped, isTimestamped) ||
                const DeepCollectionEquality()
                    .equals(other.isTimestamped, isTimestamped)) &&
            (identical(other.timestamps, timestamps) ||
                const DeepCollectionEquality()
                    .equals(other.timestamps, timestamps)) &&
            (identical(other.signedObjectsIds, signedObjectsIds) ||
                const DeepCollectionEquality()
                    .equals(other.signedObjectsIds, signedObjectsIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(claimedSigningTime) ^
      const DeepCollectionEquality().hash(timestampSigningTime) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(signingCertificate) ^
      const DeepCollectionEquality().hash(isTimestamped) ^
      const DeepCollectionEquality().hash(timestamps) ^
      const DeepCollectionEquality().hash(signedObjectsIds) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$SignatureInfoExtension
    on DocumentValidationResponseBody$Signatures$Item$SignatureInfo {
  DocumentValidationResponseBody$Signatures$Item$SignatureInfo copyWith(
      {String? claimedSigningTime,
      String? timestampSigningTime,
      enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel?
          level,
      DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate?
          signingCertificate,
      bool? isTimestamped,
      List<DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item>?
          timestamps,
      List<String>? signedObjectsIds}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo(
        claimedSigningTime: claimedSigningTime ?? this.claimedSigningTime,
        timestampSigningTime: timestampSigningTime ?? this.timestampSigningTime,
        level: level ?? this.level,
        signingCertificate: signingCertificate ?? this.signingCertificate,
        isTimestamped: isTimestamped ?? this.isTimestamped,
        timestamps: timestamps ?? this.timestamps,
        signedObjectsIds: signedObjectsIds ?? this.signedObjectsIds);
  }

  DocumentValidationResponseBody$Signatures$Item$SignatureInfo copyWithWrapped(
      {Wrapped<String?>? claimedSigningTime,
      Wrapped<String?>? timestampSigningTime,
      Wrapped<
              enums
              .DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel?>?
          level,
      Wrapped<DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate?>?
          signingCertificate,
      Wrapped<bool?>? isTimestamped,
      Wrapped<
              List<
                  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item>?>?
          timestamps,
      Wrapped<List<String>?>? signedObjectsIds}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo(
        claimedSigningTime: (claimedSigningTime != null
            ? claimedSigningTime.value
            : this.claimedSigningTime),
        timestampSigningTime: (timestampSigningTime != null
            ? timestampSigningTime.value
            : this.timestampSigningTime),
        level: (level != null ? level.value : this.level),
        signingCertificate: (signingCertificate != null
            ? signingCertificate.value
            : this.signingCertificate),
        isTimestamped:
            (isTimestamped != null ? isTimestamped.value : this.isTimestamped),
        timestamps: (timestamps != null ? timestamps.value : this.timestamps),
        signedObjectsIds: (signedObjectsIds != null
            ? signedObjectsIds.value
            : this.signedObjectsIds));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate {
  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate({
    this.issuerDN,
    this.subjectDN,
    this.serialNumber,
    this.productionTime,
    this.notBefore,
    this.notAfter,
    this.qualification,
  });

  factory DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificateFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificateToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificateToJson(
          this);

  @JsonKey(name: 'issuerDN')
  final String? issuerDN;
  @JsonKey(name: 'subjectDN')
  final String? subjectDN;
  @JsonKey(name: 'serialNumber')
  final String? serialNumber;
  @JsonKey(name: 'productionTime')
  final String? productionTime;
  @JsonKey(name: 'notBefore')
  final String? notBefore;
  @JsonKey(name: 'notAfter')
  final String? notAfter;
  @JsonKey(name: 'qualification')
  final DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification?
      qualification;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate &&
            (identical(other.issuerDN, issuerDN) ||
                const DeepCollectionEquality()
                    .equals(other.issuerDN, issuerDN)) &&
            (identical(other.subjectDN, subjectDN) ||
                const DeepCollectionEquality()
                    .equals(other.subjectDN, subjectDN)) &&
            (identical(other.serialNumber, serialNumber) ||
                const DeepCollectionEquality()
                    .equals(other.serialNumber, serialNumber)) &&
            (identical(other.productionTime, productionTime) ||
                const DeepCollectionEquality()
                    .equals(other.productionTime, productionTime)) &&
            (identical(other.notBefore, notBefore) ||
                const DeepCollectionEquality()
                    .equals(other.notBefore, notBefore)) &&
            (identical(other.notAfter, notAfter) ||
                const DeepCollectionEquality()
                    .equals(other.notAfter, notAfter)) &&
            (identical(other.qualification, qualification) ||
                const DeepCollectionEquality()
                    .equals(other.qualification, qualification)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(issuerDN) ^
      const DeepCollectionEquality().hash(subjectDN) ^
      const DeepCollectionEquality().hash(serialNumber) ^
      const DeepCollectionEquality().hash(productionTime) ^
      const DeepCollectionEquality().hash(notBefore) ^
      const DeepCollectionEquality().hash(notAfter) ^
      const DeepCollectionEquality().hash(qualification) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificateExtension
    on DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate {
  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate
      copyWith(
          {String? issuerDN,
          String? subjectDN,
          String? serialNumber,
          String? productionTime,
          String? notBefore,
          String? notAfter,
          DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification?
              qualification}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate(
        issuerDN: issuerDN ?? this.issuerDN,
        subjectDN: subjectDN ?? this.subjectDN,
        serialNumber: serialNumber ?? this.serialNumber,
        productionTime: productionTime ?? this.productionTime,
        notBefore: notBefore ?? this.notBefore,
        notAfter: notAfter ?? this.notAfter,
        qualification: qualification ?? this.qualification);
  }

  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate
      copyWithWrapped(
          {Wrapped<String?>? issuerDN,
          Wrapped<String?>? subjectDN,
          Wrapped<String?>? serialNumber,
          Wrapped<String?>? productionTime,
          Wrapped<String?>? notBefore,
          Wrapped<String?>? notAfter,
          Wrapped<DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification?>?
              qualification}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate(
        issuerDN: (issuerDN != null ? issuerDN.value : this.issuerDN),
        subjectDN: (subjectDN != null ? subjectDN.value : this.subjectDN),
        serialNumber:
            (serialNumber != null ? serialNumber.value : this.serialNumber),
        productionTime: (productionTime != null
            ? productionTime.value
            : this.productionTime),
        notBefore: (notBefore != null ? notBefore.value : this.notBefore),
        notAfter: (notAfter != null ? notAfter.value : this.notAfter),
        qualification:
            (qualification != null ? qualification.value : this.qualification));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item {
  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item({
    this.issuerDN,
    this.subjectDN,
    this.serialNumber,
    this.productionTime,
    this.notBefore,
    this.notAfter,
    this.qualification,
    this.timestampType,
  });

  factory DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemToJson(
          this);

  @JsonKey(name: 'issuerDN')
  final String? issuerDN;
  @JsonKey(name: 'subjectDN')
  final String? subjectDN;
  @JsonKey(name: 'serialNumber')
  final String? serialNumber;
  @JsonKey(name: 'productionTime')
  final String? productionTime;
  @JsonKey(name: 'notBefore')
  final String? notBefore;
  @JsonKey(name: 'notAfter')
  final String? notAfter;
  @JsonKey(name: 'qualification')
  final DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification?
      qualification;
  @JsonKey(
    name: 'timestampType',
    toJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeNullableToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeNullableFromJson,
  )
  final enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType?
      timestampType;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item &&
            (identical(other.issuerDN, issuerDN) ||
                const DeepCollectionEquality()
                    .equals(other.issuerDN, issuerDN)) &&
            (identical(other.subjectDN, subjectDN) ||
                const DeepCollectionEquality()
                    .equals(other.subjectDN, subjectDN)) &&
            (identical(other.serialNumber, serialNumber) ||
                const DeepCollectionEquality()
                    .equals(other.serialNumber, serialNumber)) &&
            (identical(other.productionTime, productionTime) ||
                const DeepCollectionEquality()
                    .equals(other.productionTime, productionTime)) &&
            (identical(other.notBefore, notBefore) ||
                const DeepCollectionEquality()
                    .equals(other.notBefore, notBefore)) &&
            (identical(other.notAfter, notAfter) ||
                const DeepCollectionEquality()
                    .equals(other.notAfter, notAfter)) &&
            (identical(other.qualification, qualification) ||
                const DeepCollectionEquality()
                    .equals(other.qualification, qualification)) &&
            (identical(other.timestampType, timestampType) ||
                const DeepCollectionEquality()
                    .equals(other.timestampType, timestampType)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(issuerDN) ^
      const DeepCollectionEquality().hash(subjectDN) ^
      const DeepCollectionEquality().hash(serialNumber) ^
      const DeepCollectionEquality().hash(productionTime) ^
      const DeepCollectionEquality().hash(notBefore) ^
      const DeepCollectionEquality().hash(notAfter) ^
      const DeepCollectionEquality().hash(qualification) ^
      const DeepCollectionEquality().hash(timestampType) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemExtension
    on DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item {
  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item copyWith(
      {String? issuerDN,
      String? subjectDN,
      String? serialNumber,
      String? productionTime,
      String? notBefore,
      String? notAfter,
      DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification?
          qualification,
      enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType?
          timestampType}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item(
        issuerDN: issuerDN ?? this.issuerDN,
        subjectDN: subjectDN ?? this.subjectDN,
        serialNumber: serialNumber ?? this.serialNumber,
        productionTime: productionTime ?? this.productionTime,
        notBefore: notBefore ?? this.notBefore,
        notAfter: notAfter ?? this.notAfter,
        qualification: qualification ?? this.qualification,
        timestampType: timestampType ?? this.timestampType);
  }

  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item
      copyWithWrapped(
          {Wrapped<String?>? issuerDN,
          Wrapped<String?>? subjectDN,
          Wrapped<String?>? serialNumber,
          Wrapped<String?>? productionTime,
          Wrapped<String?>? notBefore,
          Wrapped<String?>? notAfter,
          Wrapped<DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification?>?
              qualification,
          Wrapped<
                  enums
                  .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType?>?
              timestampType}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item(
        issuerDN: (issuerDN != null ? issuerDN.value : this.issuerDN),
        subjectDN: (subjectDN != null ? subjectDN.value : this.subjectDN),
        serialNumber:
            (serialNumber != null ? serialNumber.value : this.serialNumber),
        productionTime: (productionTime != null
            ? productionTime.value
            : this.productionTime),
        notBefore: (notBefore != null ? notBefore.value : this.notBefore),
        notAfter: (notAfter != null ? notAfter.value : this.notAfter),
        qualification:
            (qualification != null ? qualification.value : this.qualification),
        timestampType:
            (timestampType != null ? timestampType.value : this.timestampType));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification {
  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification({
    this.code,
    this.description,
  });

  factory DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationToJson(
          this);

  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(
    name: 'description',
    toJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionNullableToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionNullableFromJson,
  )
  final enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription?
      description;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationExtension
    on DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification {
  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification
      copyWith(
          {int? code,
          enums
              .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription?
              description}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification(
        code: code ?? this.code, description: description ?? this.description);
  }

  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification
      copyWithWrapped(
          {Wrapped<int?>? code,
          Wrapped<
                  enums
                  .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription?>?
              description}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$Qualification(
        code: (code != null ? code.value : this.code),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification {
  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification({
    this.code,
    this.description,
  });

  factory DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationToJson(
          this);

  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(
    name: 'description',
    toJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionNullableToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionNullableFromJson,
  )
  final enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription?
      description;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationExtension
    on DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification {
  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification
      copyWith(
          {int? code,
          enums
              .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription?
              description}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification(
        code: code ?? this.code, description: description ?? this.description);
  }

  DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification
      copyWithWrapped(
          {Wrapped<int?>? code,
          Wrapped<
                  enums
                  .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription?>?
              description}) {
    return DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$Qualification(
        code: (code != null ? code.value : this.code),
        description:
            (description != null ? description.value : this.description));
  }
}

String? signDocumentResponseBodyMimeTypeNullableToJson(
    enums.SignDocumentResponseBodyMimeType? signDocumentResponseBodyMimeType) {
  return signDocumentResponseBodyMimeType?.value;
}

String? signDocumentResponseBodyMimeTypeToJson(
    enums.SignDocumentResponseBodyMimeType signDocumentResponseBodyMimeType) {
  return signDocumentResponseBodyMimeType.value;
}

enums.SignDocumentResponseBodyMimeType signDocumentResponseBodyMimeTypeFromJson(
  Object? signDocumentResponseBodyMimeType, [
  enums.SignDocumentResponseBodyMimeType? defaultValue,
]) {
  return enums.SignDocumentResponseBodyMimeType.values.firstWhereOrNull(
          (e) => e.value == signDocumentResponseBodyMimeType) ??
      defaultValue ??
      enums.SignDocumentResponseBodyMimeType.swaggerGeneratedUnknown;
}

enums.SignDocumentResponseBodyMimeType?
    signDocumentResponseBodyMimeTypeNullableFromJson(
  Object? signDocumentResponseBodyMimeType, [
  enums.SignDocumentResponseBodyMimeType? defaultValue,
]) {
  if (signDocumentResponseBodyMimeType == null) {
    return null;
  }
  return enums.SignDocumentResponseBodyMimeType.values.firstWhereOrNull(
          (e) => e.value == signDocumentResponseBodyMimeType) ??
      defaultValue;
}

String signDocumentResponseBodyMimeTypeExplodedListToJson(
    List<enums.SignDocumentResponseBodyMimeType>?
        signDocumentResponseBodyMimeType) {
  return signDocumentResponseBodyMimeType?.map((e) => e.value!).join(',') ?? '';
}

List<String> signDocumentResponseBodyMimeTypeListToJson(
    List<enums.SignDocumentResponseBodyMimeType>?
        signDocumentResponseBodyMimeType) {
  if (signDocumentResponseBodyMimeType == null) {
    return [];
  }

  return signDocumentResponseBodyMimeType.map((e) => e.value!).toList();
}

List<enums.SignDocumentResponseBodyMimeType>
    signDocumentResponseBodyMimeTypeListFromJson(
  List? signDocumentResponseBodyMimeType, [
  List<enums.SignDocumentResponseBodyMimeType>? defaultValue,
]) {
  if (signDocumentResponseBodyMimeType == null) {
    return defaultValue ?? [];
  }

  return signDocumentResponseBodyMimeType
      .map((e) => signDocumentResponseBodyMimeTypeFromJson(e.toString()))
      .toList();
}

List<enums.SignDocumentResponseBodyMimeType>?
    signDocumentResponseBodyMimeTypeNullableListFromJson(
  List? signDocumentResponseBodyMimeType, [
  List<enums.SignDocumentResponseBodyMimeType>? defaultValue,
]) {
  if (signDocumentResponseBodyMimeType == null) {
    return defaultValue;
  }

  return signDocumentResponseBodyMimeType
      .map((e) => signDocumentResponseBodyMimeTypeFromJson(e.toString()))
      .toList();
}

String? getDocumentResponseBodyMimeTypeNullableToJson(
    enums.GetDocumentResponseBodyMimeType? getDocumentResponseBodyMimeType) {
  return getDocumentResponseBodyMimeType?.value;
}

String? getDocumentResponseBodyMimeTypeToJson(
    enums.GetDocumentResponseBodyMimeType getDocumentResponseBodyMimeType) {
  return getDocumentResponseBodyMimeType.value;
}

enums.GetDocumentResponseBodyMimeType getDocumentResponseBodyMimeTypeFromJson(
  Object? getDocumentResponseBodyMimeType, [
  enums.GetDocumentResponseBodyMimeType? defaultValue,
]) {
  return enums.GetDocumentResponseBodyMimeType.values.firstWhereOrNull(
          (e) => e.value == getDocumentResponseBodyMimeType) ??
      defaultValue ??
      enums.GetDocumentResponseBodyMimeType.swaggerGeneratedUnknown;
}

enums.GetDocumentResponseBodyMimeType?
    getDocumentResponseBodyMimeTypeNullableFromJson(
  Object? getDocumentResponseBodyMimeType, [
  enums.GetDocumentResponseBodyMimeType? defaultValue,
]) {
  if (getDocumentResponseBodyMimeType == null) {
    return null;
  }
  return enums.GetDocumentResponseBodyMimeType.values.firstWhereOrNull(
          (e) => e.value == getDocumentResponseBodyMimeType) ??
      defaultValue;
}

String getDocumentResponseBodyMimeTypeExplodedListToJson(
    List<enums.GetDocumentResponseBodyMimeType>?
        getDocumentResponseBodyMimeType) {
  return getDocumentResponseBodyMimeType?.map((e) => e.value!).join(',') ?? '';
}

List<String> getDocumentResponseBodyMimeTypeListToJson(
    List<enums.GetDocumentResponseBodyMimeType>?
        getDocumentResponseBodyMimeType) {
  if (getDocumentResponseBodyMimeType == null) {
    return [];
  }

  return getDocumentResponseBodyMimeType.map((e) => e.value!).toList();
}

List<enums.GetDocumentResponseBodyMimeType>
    getDocumentResponseBodyMimeTypeListFromJson(
  List? getDocumentResponseBodyMimeType, [
  List<enums.GetDocumentResponseBodyMimeType>? defaultValue,
]) {
  if (getDocumentResponseBodyMimeType == null) {
    return defaultValue ?? [];
  }

  return getDocumentResponseBodyMimeType
      .map((e) => getDocumentResponseBodyMimeTypeFromJson(e.toString()))
      .toList();
}

List<enums.GetDocumentResponseBodyMimeType>?
    getDocumentResponseBodyMimeTypeNullableListFromJson(
  List? getDocumentResponseBodyMimeType, [
  List<enums.GetDocumentResponseBodyMimeType>? defaultValue,
]) {
  if (getDocumentResponseBodyMimeType == null) {
    return defaultValue;
  }

  return getDocumentResponseBodyMimeType
      .map((e) => getDocumentResponseBodyMimeTypeFromJson(e.toString()))
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

String? documentValidationResponseBodyFileFormatNullableToJson(
    enums.DocumentValidationResponseBodyFileFormat?
        documentValidationResponseBodyFileFormat) {
  return documentValidationResponseBodyFileFormat?.value;
}

String? documentValidationResponseBodyFileFormatToJson(
    enums.DocumentValidationResponseBodyFileFormat
        documentValidationResponseBodyFileFormat) {
  return documentValidationResponseBodyFileFormat.value;
}

enums.DocumentValidationResponseBodyFileFormat
    documentValidationResponseBodyFileFormatFromJson(
  Object? documentValidationResponseBodyFileFormat, [
  enums.DocumentValidationResponseBodyFileFormat? defaultValue,
]) {
  return enums.DocumentValidationResponseBodyFileFormat.values.firstWhereOrNull(
          (e) => e.value == documentValidationResponseBodyFileFormat) ??
      defaultValue ??
      enums.DocumentValidationResponseBodyFileFormat.swaggerGeneratedUnknown;
}

enums.DocumentValidationResponseBodyFileFormat?
    documentValidationResponseBodyFileFormatNullableFromJson(
  Object? documentValidationResponseBodyFileFormat, [
  enums.DocumentValidationResponseBodyFileFormat? defaultValue,
]) {
  if (documentValidationResponseBodyFileFormat == null) {
    return null;
  }
  return enums.DocumentValidationResponseBodyFileFormat.values.firstWhereOrNull(
          (e) => e.value == documentValidationResponseBodyFileFormat) ??
      defaultValue;
}

String documentValidationResponseBodyFileFormatExplodedListToJson(
    List<enums.DocumentValidationResponseBodyFileFormat>?
        documentValidationResponseBodyFileFormat) {
  return documentValidationResponseBodyFileFormat
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> documentValidationResponseBodyFileFormatListToJson(
    List<enums.DocumentValidationResponseBodyFileFormat>?
        documentValidationResponseBodyFileFormat) {
  if (documentValidationResponseBodyFileFormat == null) {
    return [];
  }

  return documentValidationResponseBodyFileFormat.map((e) => e.value!).toList();
}

List<enums.DocumentValidationResponseBodyFileFormat>
    documentValidationResponseBodyFileFormatListFromJson(
  List? documentValidationResponseBodyFileFormat, [
  List<enums.DocumentValidationResponseBodyFileFormat>? defaultValue,
]) {
  if (documentValidationResponseBodyFileFormat == null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBodyFileFormat
      .map(
          (e) => documentValidationResponseBodyFileFormatFromJson(e.toString()))
      .toList();
}

List<enums.DocumentValidationResponseBodyFileFormat>?
    documentValidationResponseBodyFileFormatNullableListFromJson(
  List? documentValidationResponseBodyFileFormat, [
  List<enums.DocumentValidationResponseBodyFileFormat>? defaultValue,
]) {
  if (documentValidationResponseBodyFileFormat == null) {
    return defaultValue;
  }

  return documentValidationResponseBodyFileFormat
      .map(
          (e) => documentValidationResponseBodyFileFormatFromJson(e.toString()))
      .toList();
}

int? documentValidationResponseBody$Signatures$Item$ValidationResultCodeNullableToJson(
    enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode?
        documentValidationResponseBody$Signatures$Item$ValidationResultCode) {
  return documentValidationResponseBody$Signatures$Item$ValidationResultCode
      ?.value;
}

int? documentValidationResponseBody$Signatures$Item$ValidationResultCodeToJson(
    enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode
        documentValidationResponseBody$Signatures$Item$ValidationResultCode) {
  return documentValidationResponseBody$Signatures$Item$ValidationResultCode
      .value;
}

enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode
    documentValidationResponseBody$Signatures$Item$ValidationResultCodeFromJson(
  Object? documentValidationResponseBody$Signatures$Item$ValidationResultCode, [
  enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultCode
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$ValidationResultCode) ??
      defaultValue ??
      enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode
          .swaggerGeneratedUnknown;
}

enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode?
    documentValidationResponseBody$Signatures$Item$ValidationResultCodeNullableFromJson(
  Object? documentValidationResponseBody$Signatures$Item$ValidationResultCode, [
  enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultCode ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultCode
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$ValidationResultCode) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$ValidationResultCodeExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$ValidationResultCode>?
        documentValidationResponseBody$Signatures$Item$ValidationResultCode) {
  return documentValidationResponseBody$Signatures$Item$ValidationResultCode
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<int> documentValidationResponseBody$Signatures$Item$ValidationResultCodeListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$ValidationResultCode>?
        documentValidationResponseBody$Signatures$Item$ValidationResultCode) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultCode ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$ValidationResultCode
      .map((e) => e.value!)
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode>
    documentValidationResponseBody$Signatures$Item$ValidationResultCodeListFromJson(
  List? documentValidationResponseBody$Signatures$Item$ValidationResultCode, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultCode>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultCode ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$ValidationResultCode
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$ValidationResultCodeFromJson(
              e.toString()))
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultCode>?
    documentValidationResponseBody$Signatures$Item$ValidationResultCodeNullableListFromJson(
  List? documentValidationResponseBody$Signatures$Item$ValidationResultCode, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultCode>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultCode ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$ValidationResultCode
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$ValidationResultCodeFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription?
        documentValidationResponseBody$Signatures$Item$ValidationResultDescription) {
  return documentValidationResponseBody$Signatures$Item$ValidationResultDescription
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription
        documentValidationResponseBody$Signatures$Item$ValidationResultDescription) {
  return documentValidationResponseBody$Signatures$Item$ValidationResultDescription
      .value;
}

enums.DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription
    documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$ValidationResultDescription, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$ValidationResultDescription) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription?
    documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$ValidationResultDescription, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultDescription ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$ValidationResultDescription) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription>?
        documentValidationResponseBody$Signatures$Item$ValidationResultDescription) {
  return documentValidationResponseBody$Signatures$Item$ValidationResultDescription
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription>?
            documentValidationResponseBody$Signatures$Item$ValidationResultDescription) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultDescription ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$ValidationResultDescription
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription>
    documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$ValidationResultDescription, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultDescription ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$ValidationResultDescription
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription>?
    documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$ValidationResultDescription, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$ValidationResultDescription ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$ValidationResultDescription
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$ValidationResultDescriptionFromJson(
              e.toString()))
      .toList();
}

String?
    documentValidationResponseBody$Signatures$Item$SignatureInfoLevelNullableToJson(
        enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel?
            documentValidationResponseBody$Signatures$Item$SignatureInfoLevel) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfoLevel
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$SignatureInfoLevelToJson(
    enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel
        documentValidationResponseBody$Signatures$Item$SignatureInfoLevel) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfoLevel
      .value;
}

enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel
    documentValidationResponseBody$Signatures$Item$SignatureInfoLevelFromJson(
  Object? documentValidationResponseBody$Signatures$Item$SignatureInfoLevel, [
  enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel?
      defaultValue,
]) {
  return enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfoLevel) ??
      defaultValue ??
      enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel
          .swaggerGeneratedUnknown;
}

enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel?
    documentValidationResponseBody$Signatures$Item$SignatureInfoLevelNullableFromJson(
  Object? documentValidationResponseBody$Signatures$Item$SignatureInfoLevel, [
  enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfoLevel ==
      null) {
    return null;
  }
  return enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfoLevel) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$SignatureInfoLevelExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel>?
        documentValidationResponseBody$Signatures$Item$SignatureInfoLevel) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfoLevel
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$SignatureInfoLevelListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel>?
            documentValidationResponseBody$Signatures$Item$SignatureInfoLevel) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfoLevel ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfoLevel
      .map((e) => e.value!)
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel>
    documentValidationResponseBody$Signatures$Item$SignatureInfoLevelListFromJson(
  List? documentValidationResponseBody$Signatures$Item$SignatureInfoLevel, [
  List<enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfoLevel ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfoLevel
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfoLevelFromJson(
              e.toString()))
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel>?
    documentValidationResponseBody$Signatures$Item$SignatureInfoLevelNullableListFromJson(
  List? documentValidationResponseBody$Signatures$Item$SignatureInfoLevel, [
  List<enums.DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfoLevel ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfoLevel
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfoLevelFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
        documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
      .value;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
    documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription>?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription>?
            documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription>
    documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription>?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescriptionFromJson(
              e.toString()))
      .toList();
}

int? documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
      ?.value;
}

int? documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
      .value;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode>?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<int> documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode>?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode>
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode>?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCodeFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
      .value;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription>?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription>?
            documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription>
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription>?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescriptionFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
      .value;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType>?
        documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType) {
  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType>?
            documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType>
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType>?
    documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampTypeFromJson(
              e.toString()))
      .toList();
}

String? errorResponseBodyCodeNullableToJson(
    enums.ErrorResponseBodyCode? errorResponseBodyCode) {
  return errorResponseBodyCode?.value;
}

String? errorResponseBodyCodeToJson(
    enums.ErrorResponseBodyCode errorResponseBodyCode) {
  return errorResponseBodyCode.value;
}

enums.ErrorResponseBodyCode errorResponseBodyCodeFromJson(
  Object? errorResponseBodyCode, [
  enums.ErrorResponseBodyCode? defaultValue,
]) {
  return enums.ErrorResponseBodyCode.values
          .firstWhereOrNull((e) => e.value == errorResponseBodyCode) ??
      defaultValue ??
      enums.ErrorResponseBodyCode.swaggerGeneratedUnknown;
}

enums.ErrorResponseBodyCode? errorResponseBodyCodeNullableFromJson(
  Object? errorResponseBodyCode, [
  enums.ErrorResponseBodyCode? defaultValue,
]) {
  if (errorResponseBodyCode == null) {
    return null;
  }
  return enums.ErrorResponseBodyCode.values
          .firstWhereOrNull((e) => e.value == errorResponseBodyCode) ??
      defaultValue;
}

String errorResponseBodyCodeExplodedListToJson(
    List<enums.ErrorResponseBodyCode>? errorResponseBodyCode) {
  return errorResponseBodyCode?.map((e) => e.value!).join(',') ?? '';
}

List<String> errorResponseBodyCodeListToJson(
    List<enums.ErrorResponseBodyCode>? errorResponseBodyCode) {
  if (errorResponseBodyCode == null) {
    return [];
  }

  return errorResponseBodyCode.map((e) => e.value!).toList();
}

List<enums.ErrorResponseBodyCode> errorResponseBodyCodeListFromJson(
  List? errorResponseBodyCode, [
  List<enums.ErrorResponseBodyCode>? defaultValue,
]) {
  if (errorResponseBodyCode == null) {
    return defaultValue ?? [];
  }

  return errorResponseBodyCode
      .map((e) => errorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

List<enums.ErrorResponseBodyCode>? errorResponseBodyCodeNullableListFromJson(
  List? errorResponseBodyCode, [
  List<enums.ErrorResponseBodyCode>? defaultValue,
]) {
  if (errorResponseBodyCode == null) {
    return defaultValue;
  }

  return errorResponseBodyCode
      .map((e) => errorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

String? encryptionKeyNotProvidedErrorResponseBodyCodeNullableToJson(
    enums.EncryptionKeyNotProvidedErrorResponseBodyCode?
        encryptionKeyNotProvidedErrorResponseBodyCode) {
  return encryptionKeyNotProvidedErrorResponseBodyCode?.value;
}

String? encryptionKeyNotProvidedErrorResponseBodyCodeToJson(
    enums.EncryptionKeyNotProvidedErrorResponseBodyCode
        encryptionKeyNotProvidedErrorResponseBodyCode) {
  return encryptionKeyNotProvidedErrorResponseBodyCode.value;
}

enums.EncryptionKeyNotProvidedErrorResponseBodyCode
    encryptionKeyNotProvidedErrorResponseBodyCodeFromJson(
  Object? encryptionKeyNotProvidedErrorResponseBodyCode, [
  enums.EncryptionKeyNotProvidedErrorResponseBodyCode? defaultValue,
]) {
  return enums.EncryptionKeyNotProvidedErrorResponseBodyCode.values
          .firstWhereOrNull((e) =>
              e.value == encryptionKeyNotProvidedErrorResponseBodyCode) ??
      defaultValue ??
      enums.EncryptionKeyNotProvidedErrorResponseBodyCode
          .swaggerGeneratedUnknown;
}

enums.EncryptionKeyNotProvidedErrorResponseBodyCode?
    encryptionKeyNotProvidedErrorResponseBodyCodeNullableFromJson(
  Object? encryptionKeyNotProvidedErrorResponseBodyCode, [
  enums.EncryptionKeyNotProvidedErrorResponseBodyCode? defaultValue,
]) {
  if (encryptionKeyNotProvidedErrorResponseBodyCode == null) {
    return null;
  }
  return enums.EncryptionKeyNotProvidedErrorResponseBodyCode.values
          .firstWhereOrNull((e) =>
              e.value == encryptionKeyNotProvidedErrorResponseBodyCode) ??
      defaultValue;
}

String encryptionKeyNotProvidedErrorResponseBodyCodeExplodedListToJson(
    List<enums.EncryptionKeyNotProvidedErrorResponseBodyCode>?
        encryptionKeyNotProvidedErrorResponseBodyCode) {
  return encryptionKeyNotProvidedErrorResponseBodyCode
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> encryptionKeyNotProvidedErrorResponseBodyCodeListToJson(
    List<enums.EncryptionKeyNotProvidedErrorResponseBodyCode>?
        encryptionKeyNotProvidedErrorResponseBodyCode) {
  if (encryptionKeyNotProvidedErrorResponseBodyCode == null) {
    return [];
  }

  return encryptionKeyNotProvidedErrorResponseBodyCode
      .map((e) => e.value!)
      .toList();
}

List<enums.EncryptionKeyNotProvidedErrorResponseBodyCode>
    encryptionKeyNotProvidedErrorResponseBodyCodeListFromJson(
  List? encryptionKeyNotProvidedErrorResponseBodyCode, [
  List<enums.EncryptionKeyNotProvidedErrorResponseBodyCode>? defaultValue,
]) {
  if (encryptionKeyNotProvidedErrorResponseBodyCode == null) {
    return defaultValue ?? [];
  }

  return encryptionKeyNotProvidedErrorResponseBodyCode
      .map((e) =>
          encryptionKeyNotProvidedErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

List<enums.EncryptionKeyNotProvidedErrorResponseBodyCode>?
    encryptionKeyNotProvidedErrorResponseBodyCodeNullableListFromJson(
  List? encryptionKeyNotProvidedErrorResponseBodyCode, [
  List<enums.EncryptionKeyNotProvidedErrorResponseBodyCode>? defaultValue,
]) {
  if (encryptionKeyNotProvidedErrorResponseBodyCode == null) {
    return defaultValue;
  }

  return encryptionKeyNotProvidedErrorResponseBodyCode
      .map((e) =>
          encryptionKeyNotProvidedErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

String? encryptionKeyMismatchErrorResponseBodyCodeNullableToJson(
    enums.EncryptionKeyMismatchErrorResponseBodyCode?
        encryptionKeyMismatchErrorResponseBodyCode) {
  return encryptionKeyMismatchErrorResponseBodyCode?.value;
}

String? encryptionKeyMismatchErrorResponseBodyCodeToJson(
    enums.EncryptionKeyMismatchErrorResponseBodyCode
        encryptionKeyMismatchErrorResponseBodyCode) {
  return encryptionKeyMismatchErrorResponseBodyCode.value;
}

enums.EncryptionKeyMismatchErrorResponseBodyCode
    encryptionKeyMismatchErrorResponseBodyCodeFromJson(
  Object? encryptionKeyMismatchErrorResponseBodyCode, [
  enums.EncryptionKeyMismatchErrorResponseBodyCode? defaultValue,
]) {
  return enums.EncryptionKeyMismatchErrorResponseBodyCode.values
          .firstWhereOrNull(
              (e) => e.value == encryptionKeyMismatchErrorResponseBodyCode) ??
      defaultValue ??
      enums.EncryptionKeyMismatchErrorResponseBodyCode.swaggerGeneratedUnknown;
}

enums.EncryptionKeyMismatchErrorResponseBodyCode?
    encryptionKeyMismatchErrorResponseBodyCodeNullableFromJson(
  Object? encryptionKeyMismatchErrorResponseBodyCode, [
  enums.EncryptionKeyMismatchErrorResponseBodyCode? defaultValue,
]) {
  if (encryptionKeyMismatchErrorResponseBodyCode == null) {
    return null;
  }
  return enums.EncryptionKeyMismatchErrorResponseBodyCode.values
          .firstWhereOrNull(
              (e) => e.value == encryptionKeyMismatchErrorResponseBodyCode) ??
      defaultValue;
}

String encryptionKeyMismatchErrorResponseBodyCodeExplodedListToJson(
    List<enums.EncryptionKeyMismatchErrorResponseBodyCode>?
        encryptionKeyMismatchErrorResponseBodyCode) {
  return encryptionKeyMismatchErrorResponseBodyCode
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> encryptionKeyMismatchErrorResponseBodyCodeListToJson(
    List<enums.EncryptionKeyMismatchErrorResponseBodyCode>?
        encryptionKeyMismatchErrorResponseBodyCode) {
  if (encryptionKeyMismatchErrorResponseBodyCode == null) {
    return [];
  }

  return encryptionKeyMismatchErrorResponseBodyCode
      .map((e) => e.value!)
      .toList();
}

List<enums.EncryptionKeyMismatchErrorResponseBodyCode>
    encryptionKeyMismatchErrorResponseBodyCodeListFromJson(
  List? encryptionKeyMismatchErrorResponseBodyCode, [
  List<enums.EncryptionKeyMismatchErrorResponseBodyCode>? defaultValue,
]) {
  if (encryptionKeyMismatchErrorResponseBodyCode == null) {
    return defaultValue ?? [];
  }

  return encryptionKeyMismatchErrorResponseBodyCode
      .map((e) =>
          encryptionKeyMismatchErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

List<enums.EncryptionKeyMismatchErrorResponseBodyCode>?
    encryptionKeyMismatchErrorResponseBodyCodeNullableListFromJson(
  List? encryptionKeyMismatchErrorResponseBodyCode, [
  List<enums.EncryptionKeyMismatchErrorResponseBodyCode>? defaultValue,
]) {
  if (encryptionKeyMismatchErrorResponseBodyCode == null) {
    return defaultValue;
  }

  return encryptionKeyMismatchErrorResponseBodyCode
      .map((e) =>
          encryptionKeyMismatchErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

String? internalErrorResponseBodyCodeNullableToJson(
    enums.InternalErrorResponseBodyCode? internalErrorResponseBodyCode) {
  return internalErrorResponseBodyCode?.value;
}

String? internalErrorResponseBodyCodeToJson(
    enums.InternalErrorResponseBodyCode internalErrorResponseBodyCode) {
  return internalErrorResponseBodyCode.value;
}

enums.InternalErrorResponseBodyCode internalErrorResponseBodyCodeFromJson(
  Object? internalErrorResponseBodyCode, [
  enums.InternalErrorResponseBodyCode? defaultValue,
]) {
  return enums.InternalErrorResponseBodyCode.values
          .firstWhereOrNull((e) => e.value == internalErrorResponseBodyCode) ??
      defaultValue ??
      enums.InternalErrorResponseBodyCode.swaggerGeneratedUnknown;
}

enums.InternalErrorResponseBodyCode?
    internalErrorResponseBodyCodeNullableFromJson(
  Object? internalErrorResponseBodyCode, [
  enums.InternalErrorResponseBodyCode? defaultValue,
]) {
  if (internalErrorResponseBodyCode == null) {
    return null;
  }
  return enums.InternalErrorResponseBodyCode.values
          .firstWhereOrNull((e) => e.value == internalErrorResponseBodyCode) ??
      defaultValue;
}

String internalErrorResponseBodyCodeExplodedListToJson(
    List<enums.InternalErrorResponseBodyCode>? internalErrorResponseBodyCode) {
  return internalErrorResponseBodyCode?.map((e) => e.value!).join(',') ?? '';
}

List<String> internalErrorResponseBodyCodeListToJson(
    List<enums.InternalErrorResponseBodyCode>? internalErrorResponseBodyCode) {
  if (internalErrorResponseBodyCode == null) {
    return [];
  }

  return internalErrorResponseBodyCode.map((e) => e.value!).toList();
}

List<enums.InternalErrorResponseBodyCode>
    internalErrorResponseBodyCodeListFromJson(
  List? internalErrorResponseBodyCode, [
  List<enums.InternalErrorResponseBodyCode>? defaultValue,
]) {
  if (internalErrorResponseBodyCode == null) {
    return defaultValue ?? [];
  }

  return internalErrorResponseBodyCode
      .map((e) => internalErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

List<enums.InternalErrorResponseBodyCode>?
    internalErrorResponseBodyCodeNullableListFromJson(
  List? internalErrorResponseBodyCode, [
  List<enums.InternalErrorResponseBodyCode>? defaultValue,
]) {
  if (internalErrorResponseBodyCode == null) {
    return defaultValue;
  }

  return internalErrorResponseBodyCode
      .map((e) => internalErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

String? badGatewayErrorResponseBodyCodeNullableToJson(
    enums.BadGatewayErrorResponseBodyCode? badGatewayErrorResponseBodyCode) {
  return badGatewayErrorResponseBodyCode?.value;
}

String? badGatewayErrorResponseBodyCodeToJson(
    enums.BadGatewayErrorResponseBodyCode badGatewayErrorResponseBodyCode) {
  return badGatewayErrorResponseBodyCode.value;
}

enums.BadGatewayErrorResponseBodyCode badGatewayErrorResponseBodyCodeFromJson(
  Object? badGatewayErrorResponseBodyCode, [
  enums.BadGatewayErrorResponseBodyCode? defaultValue,
]) {
  return enums.BadGatewayErrorResponseBodyCode.values.firstWhereOrNull(
          (e) => e.value == badGatewayErrorResponseBodyCode) ??
      defaultValue ??
      enums.BadGatewayErrorResponseBodyCode.swaggerGeneratedUnknown;
}

enums.BadGatewayErrorResponseBodyCode?
    badGatewayErrorResponseBodyCodeNullableFromJson(
  Object? badGatewayErrorResponseBodyCode, [
  enums.BadGatewayErrorResponseBodyCode? defaultValue,
]) {
  if (badGatewayErrorResponseBodyCode == null) {
    return null;
  }
  return enums.BadGatewayErrorResponseBodyCode.values.firstWhereOrNull(
          (e) => e.value == badGatewayErrorResponseBodyCode) ??
      defaultValue;
}

String badGatewayErrorResponseBodyCodeExplodedListToJson(
    List<enums.BadGatewayErrorResponseBodyCode>?
        badGatewayErrorResponseBodyCode) {
  return badGatewayErrorResponseBodyCode?.map((e) => e.value!).join(',') ?? '';
}

List<String> badGatewayErrorResponseBodyCodeListToJson(
    List<enums.BadGatewayErrorResponseBodyCode>?
        badGatewayErrorResponseBodyCode) {
  if (badGatewayErrorResponseBodyCode == null) {
    return [];
  }

  return badGatewayErrorResponseBodyCode.map((e) => e.value!).toList();
}

List<enums.BadGatewayErrorResponseBodyCode>
    badGatewayErrorResponseBodyCodeListFromJson(
  List? badGatewayErrorResponseBodyCode, [
  List<enums.BadGatewayErrorResponseBodyCode>? defaultValue,
]) {
  if (badGatewayErrorResponseBodyCode == null) {
    return defaultValue ?? [];
  }

  return badGatewayErrorResponseBodyCode
      .map((e) => badGatewayErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

List<enums.BadGatewayErrorResponseBodyCode>?
    badGatewayErrorResponseBodyCodeNullableListFromJson(
  List? badGatewayErrorResponseBodyCode, [
  List<enums.BadGatewayErrorResponseBodyCode>? defaultValue,
]) {
  if (badGatewayErrorResponseBodyCode == null) {
    return defaultValue;
  }

  return badGatewayErrorResponseBodyCode
      .map((e) => badGatewayErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

String? invalidSignatureErrorResponseBodyCodeNullableToJson(
    enums.InvalidSignatureErrorResponseBodyCode?
        invalidSignatureErrorResponseBodyCode) {
  return invalidSignatureErrorResponseBodyCode?.value;
}

String? invalidSignatureErrorResponseBodyCodeToJson(
    enums.InvalidSignatureErrorResponseBodyCode
        invalidSignatureErrorResponseBodyCode) {
  return invalidSignatureErrorResponseBodyCode.value;
}

enums.InvalidSignatureErrorResponseBodyCode
    invalidSignatureErrorResponseBodyCodeFromJson(
  Object? invalidSignatureErrorResponseBodyCode, [
  enums.InvalidSignatureErrorResponseBodyCode? defaultValue,
]) {
  return enums.InvalidSignatureErrorResponseBodyCode.values.firstWhereOrNull(
          (e) => e.value == invalidSignatureErrorResponseBodyCode) ??
      defaultValue ??
      enums.InvalidSignatureErrorResponseBodyCode.swaggerGeneratedUnknown;
}

enums.InvalidSignatureErrorResponseBodyCode?
    invalidSignatureErrorResponseBodyCodeNullableFromJson(
  Object? invalidSignatureErrorResponseBodyCode, [
  enums.InvalidSignatureErrorResponseBodyCode? defaultValue,
]) {
  if (invalidSignatureErrorResponseBodyCode == null) {
    return null;
  }
  return enums.InvalidSignatureErrorResponseBodyCode.values.firstWhereOrNull(
          (e) => e.value == invalidSignatureErrorResponseBodyCode) ??
      defaultValue;
}

String invalidSignatureErrorResponseBodyCodeExplodedListToJson(
    List<enums.InvalidSignatureErrorResponseBodyCode>?
        invalidSignatureErrorResponseBodyCode) {
  return invalidSignatureErrorResponseBodyCode
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> invalidSignatureErrorResponseBodyCodeListToJson(
    List<enums.InvalidSignatureErrorResponseBodyCode>?
        invalidSignatureErrorResponseBodyCode) {
  if (invalidSignatureErrorResponseBodyCode == null) {
    return [];
  }

  return invalidSignatureErrorResponseBodyCode.map((e) => e.value!).toList();
}

List<enums.InvalidSignatureErrorResponseBodyCode>
    invalidSignatureErrorResponseBodyCodeListFromJson(
  List? invalidSignatureErrorResponseBodyCode, [
  List<enums.InvalidSignatureErrorResponseBodyCode>? defaultValue,
]) {
  if (invalidSignatureErrorResponseBodyCode == null) {
    return defaultValue ?? [];
  }

  return invalidSignatureErrorResponseBodyCode
      .map((e) => invalidSignatureErrorResponseBodyCodeFromJson(e.toString()))
      .toList();
}

List<enums.InvalidSignatureErrorResponseBodyCode>?
    invalidSignatureErrorResponseBodyCodeNullableListFromJson(
  List? invalidSignatureErrorResponseBodyCode, [
  List<enums.InvalidSignatureErrorResponseBodyCode>? defaultValue,
]) {
  if (invalidSignatureErrorResponseBodyCode == null) {
    return defaultValue;
  }

  return invalidSignatureErrorResponseBodyCode
      .map((e) => invalidSignatureErrorResponseBodyCodeFromJson(e.toString()))
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
