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

  ///Client app posts document along with some parameters to Server.
  ///@param Accept
  Future<chopper.Response<CreateDocumentResponseBody>> documentsPost({
    String? accept,
    required DocumentPostRequestBody? body,
  }) {
    generatedMapping.putIfAbsent(CreateDocumentResponseBody,
        () => CreateDocumentResponseBody.fromJsonFactory);

    return _documentsPost(accept: accept?.toString(), body: body);
  }

  ///Client app posts document along with some parameters to Server.
  ///@param Accept
  @Post(
    path: '/documents',
    optionalBody: true,
  )
  Future<chopper.Response<CreateDocumentResponseBody>> _documentsPost({
    @Header('Accept') String? accept,
    @Body() required DocumentPostRequestBody? body,
  });

  ///External system requests signed document at the end of the process.
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

  ///External system requests signed document at the end of the process.
  ///@param guid
  ///@param If-Modified-Since
  ///@param Accept
  @Get(path: '/documents/{guid}')
  Future<chopper.Response<GetDocumentResponseBody>> _documentsGuidGet({
    @Path('guid') required String? guid,
    @Header('If-Modified-Since') String? ifModifiedSince,
    @Header('Accept') String? accept,
  });

  ///External system requests signed document at the end of the process.
  ///@param guid
  Future<chopper.Response> documentsGuidDelete({required String? guid}) {
    return _documentsGuidDelete(guid: guid);
  }

  ///External system requests signed document at the end of the process.
  ///@param guid
  @Delete(path: '/documents/{guid}')
  Future<chopper.Response> _documentsGuidDelete(
      {@Path('guid') required String? guid});

  ///Client app requests encrypted document to visualize it.
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

  ///Client app requests encrypted document to visualize it.
  ///@param guid
  ///@param Accept
  @Get(path: '/documents/{guid}/visualization')
  Future<chopper.Response<DocumentVisualizationResponseBody>>
      _documentsGuidVisualizationGet({
    @Path('guid') required String? guid,
    @Header('Accept') String? accept,
  });

  ///Client app gets the signature parameters of the doucment
  ///@param guid
  ///@param Accept
  Future<chopper.Response<SigningParameters>> documentsGuidParametersGet({
    required String? guid,
    String? accept,
  }) {
    generatedMapping.putIfAbsent(
        SigningParameters, () => SigningParameters.fromJsonFactory);

    return _documentsGuidParametersGet(guid: guid, accept: accept?.toString());
  }

  ///Client app gets the signature parameters of the doucment
  ///@param guid
  ///@param Accept
  @Get(path: '/documents/{guid}/parameters')
  Future<chopper.Response<SigningParameters>> _documentsGuidParametersGet({
    @Path('guid') required String? guid,
    @Header('Accept') String? accept,
  });

  ///Client app requests a signature validation report of the document.
  ///@param guid
  ///@param Accept
  Future<chopper.Response<DocumentValidationResponseBody>>
      documentsGuidValidateGet({
    required String? guid,
    String? accept,
  }) {
    generatedMapping.putIfAbsent(DocumentValidationResponseBody,
        () => DocumentValidationResponseBody.fromJsonFactory);

    return _documentsGuidValidateGet(guid: guid, accept: accept?.toString());
  }

  ///Client app requests a signature validation report of the document.
  ///@param guid
  ///@param Accept
  @Get(path: '/documents/{guid}/validate')
  Future<chopper.Response<DocumentValidationResponseBody>>
      _documentsGuidValidateGet({
    @Path('guid') required String? guid,
    @Header('Accept') String? accept,
  });

  ///Client app gets datatosign based on provided signing certificate.
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

  ///Client app gets datatosign based on provided signing certificate.
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

  ///Create signed document using the SignedData obtained from client.
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

  ///Create signed document using the SignedData obtained from client.
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

  ///Integration registers itself at the server
  Future<chopper.Response<PostIntegrationResponse>> integrationsPost(
      {required PostIntegrationRequestBody? body}) {
    generatedMapping.putIfAbsent(
        PostIntegrationResponse, () => PostIntegrationResponse.fromJsonFactory);

    return _integrationsPost(body: body);
  }

  ///Integration registers itself at the server
  @Post(
    path: '/integrations',
    optionalBody: true,
  )
  Future<chopper.Response<PostIntegrationResponse>> _integrationsPost(
      {@Body() required PostIntegrationRequestBody? body});

  ///Device registers itself at the server
  Future<chopper.Response<PostDeviceResponse>> devicesPost(
      {required PostDeviceRequestBody? body}) {
    generatedMapping.putIfAbsent(
        PostDeviceResponse, () => PostDeviceResponse.fromJsonFactory);

    return _devicesPost(body: body);
  }

  ///Device registers itself at the server
  @Post(
    path: '/devices',
    optionalBody: true,
  )
  Future<chopper.Response<PostDeviceResponse>> _devicesPost(
      {@Body() required PostDeviceRequestBody? body});

  ///Device registers itself for receiving sign requests (push notification) from given integration
  Future<chopper.Response> deviceIntegrationsPost(
      {required PostDeviceIntegrationsRequestBody? body}) {
    return _deviceIntegrationsPost(body: body);
  }

  ///Device registers itself for receiving sign requests (push notification) from given integration
  @Post(
    path: '/device-integrations',
    optionalBody: true,
  )
  Future<chopper.Response> _deviceIntegrationsPost(
      {@Body() required PostDeviceIntegrationsRequestBody? body});

  ///Device retrieves a list of paired integrations
  Future<chopper.Response<GetDeviceIntegrationsResponseBody>>
      deviceIntegrationsGet() {
    generatedMapping.putIfAbsent(GetDeviceIntegrationsResponseBody$Item,
        () => GetDeviceIntegrationsResponseBody$Item.fromJsonFactory);

    return _deviceIntegrationsGet();
  }

  ///Device retrieves a list of paired integrations
  @Get(path: '/device-integrations')
  Future<chopper.Response<GetDeviceIntegrationsResponseBody>>
      _deviceIntegrationsGet();

  ///Device deletes integration from its paired integrations
  ///@param integration_id Identifier of the integration
  Future<chopper.Response> deviceIntegrationsIntegrationIdDelete(
      {required String? integrationId}) {
    return _deviceIntegrationsIntegrationIdDelete(integrationId: integrationId);
  }

  ///Device deletes integration from its paired integrations
  ///@param integration_id Identifier of the integration
  @Delete(path: '/device-integrations/{integration_id}')
  Future<chopper.Response> _deviceIntegrationsIntegrationIdDelete(
      {@Path('integration_id') required String? integrationId});

  ///Integration retrieves a list of paired devices
  Future<chopper.Response<GetIntegrationDevicesResponseBody>>
      integrationDevicesGet() {
    generatedMapping.putIfAbsent(GetIntegrationDevicesResponseBody$Item,
        () => GetIntegrationDevicesResponseBody$Item.fromJsonFactory);

    return _integrationDevicesGet();
  }

  ///Integration retrieves a list of paired devices
  @Get(path: '/integration-devices')
  Future<chopper.Response<GetIntegrationDevicesResponseBody>>
      _integrationDevicesGet();

  ///Integration deletes device from its paired devices
  ///@param device_id Identifier of the device
  Future<chopper.Response> integrationDevicesDeviceIdDelete(
      {required String? deviceId}) {
    return _integrationDevicesDeviceIdDelete(deviceId: deviceId);
  }

  ///Integration deletes device from its paired devices
  ///@param device_id Identifier of the device
  @Delete(path: '/integration-devices/{device_id}')
  Future<chopper.Response> _integrationDevicesDeviceIdDelete(
      {@Path('device_id') required String? deviceId});

  ///Integration sends a sign request (push notification) to all paired signing devices
  Future<chopper.Response> signRequestPost(
      {required PostSignRequestBody? body}) {
    return _signRequestPost(body: body);
  }

  ///Integration sends a sign request (push notification) to all paired signing devices
  @Post(
    path: '/sign-request',
    optionalBody: true,
  )
  Future<chopper.Response> _signRequestPost(
      {@Body() required PostSignRequestBody? body});

  ///URL format used by Autogram extenision and Autogram v mobile app
  ///@param guid GUID of a document
  ///@param key AES256 key in Base64 for the document
  ///@param integration JWT of source integration. Can be used to pair device with the integration. Must contain `aud: "device"` claim
  Future<chopper.Response> qrCodeGet({
    required String? guid,
    required String? key,
    String? integration,
  }) {
    return _qrCodeGet(guid: guid, key: key, integration: integration);
  }

  ///URL format used by Autogram extenision and Autogram v mobile app
  ///@param guid GUID of a document
  ///@param key AES256 key in Base64 for the document
  ///@param integration JWT of source integration. Can be used to pair device with the integration. Must contain `aud: "device"` claim
  @Get(path: '/qr-code')
  Future<chopper.Response> _qrCodeGet({
    @Query('guid') required String? guid,
    @Query('key') required String? key,
    @Query('integration') String? integration,
  });
}

@JsonSerializable(explicitToJson: true)
class PostSignRequestBody {
  const PostSignRequestBody({
    required this.documentGuid,
    required this.documentEncryptionKey,
  });

  factory PostSignRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PostSignRequestBodyFromJson(json);

  static const toJsonFactory = _$PostSignRequestBodyToJson;
  Map<String, dynamic> toJson() => _$PostSignRequestBodyToJson(this);

  @JsonKey(name: 'documentGuid')
  final String documentGuid;
  @JsonKey(name: 'documentEncryptionKey')
  final String documentEncryptionKey;
  static const fromJsonFactory = _$PostSignRequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostSignRequestBody &&
            (identical(other.documentGuid, documentGuid) ||
                const DeepCollectionEquality()
                    .equals(other.documentGuid, documentGuid)) &&
            (identical(other.documentEncryptionKey, documentEncryptionKey) ||
                const DeepCollectionEquality().equals(
                    other.documentEncryptionKey, documentEncryptionKey)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(documentGuid) ^
      const DeepCollectionEquality().hash(documentEncryptionKey) ^
      runtimeType.hashCode;
}

extension $PostSignRequestBodyExtension on PostSignRequestBody {
  PostSignRequestBody copyWith(
      {String? documentGuid, String? documentEncryptionKey}) {
    return PostSignRequestBody(
        documentGuid: documentGuid ?? this.documentGuid,
        documentEncryptionKey:
            documentEncryptionKey ?? this.documentEncryptionKey);
  }

  PostSignRequestBody copyWithWrapped(
      {Wrapped<String>? documentGuid, Wrapped<String>? documentEncryptionKey}) {
    return PostSignRequestBody(
        documentGuid:
            (documentGuid != null ? documentGuid.value : this.documentGuid),
        documentEncryptionKey: (documentEncryptionKey != null
            ? documentEncryptionKey.value
            : this.documentEncryptionKey));
  }
}

@JsonSerializable(explicitToJson: true)
class PostIntegrationRequestBody {
  const PostIntegrationRequestBody({
    required this.platform,
    required this.displayName,
    required this.publicKey,
  });

  factory PostIntegrationRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PostIntegrationRequestBodyFromJson(json);

  static const toJsonFactory = _$PostIntegrationRequestBodyToJson;
  Map<String, dynamic> toJson() => _$PostIntegrationRequestBodyToJson(this);

  @JsonKey(name: 'platform')
  final String platform;
  @JsonKey(name: 'displayName')
  final String displayName;
  @JsonKey(name: 'publicKey')
  final String publicKey;
  static const fromJsonFactory = _$PostIntegrationRequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostIntegrationRequestBody &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(publicKey) ^
      runtimeType.hashCode;
}

extension $PostIntegrationRequestBodyExtension on PostIntegrationRequestBody {
  PostIntegrationRequestBody copyWith(
      {String? platform, String? displayName, String? publicKey}) {
    return PostIntegrationRequestBody(
        platform: platform ?? this.platform,
        displayName: displayName ?? this.displayName,
        publicKey: publicKey ?? this.publicKey);
  }

  PostIntegrationRequestBody copyWithWrapped(
      {Wrapped<String>? platform,
      Wrapped<String>? displayName,
      Wrapped<String>? publicKey}) {
    return PostIntegrationRequestBody(
        platform: (platform != null ? platform.value : this.platform),
        displayName:
            (displayName != null ? displayName.value : this.displayName),
        publicKey: (publicKey != null ? publicKey.value : this.publicKey));
  }
}

@JsonSerializable(explicitToJson: true)
class PostIntegrationResponse {
  const PostIntegrationResponse({
    required this.guid,
  });

  factory PostIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$PostIntegrationResponseFromJson(json);

  static const toJsonFactory = _$PostIntegrationResponseToJson;
  Map<String, dynamic> toJson() => _$PostIntegrationResponseToJson(this);

  @JsonKey(name: 'guid')
  final String guid;
  static const fromJsonFactory = _$PostIntegrationResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostIntegrationResponse &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^ runtimeType.hashCode;
}

extension $PostIntegrationResponseExtension on PostIntegrationResponse {
  PostIntegrationResponse copyWith({String? guid}) {
    return PostIntegrationResponse(guid: guid ?? this.guid);
  }

  PostIntegrationResponse copyWithWrapped({Wrapped<String>? guid}) {
    return PostIntegrationResponse(
        guid: (guid != null ? guid.value : this.guid));
  }
}

@JsonSerializable(explicitToJson: true)
class PostDeviceRequestBody {
  const PostDeviceRequestBody({
    required this.platform,
    required this.registrationId,
    required this.displayName,
    required this.publicKey,
    required this.pushkey,
  });

  factory PostDeviceRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PostDeviceRequestBodyFromJson(json);

  static const toJsonFactory = _$PostDeviceRequestBodyToJson;
  Map<String, dynamic> toJson() => _$PostDeviceRequestBodyToJson(this);

  @JsonKey(name: 'platform')
  final String platform;
  @JsonKey(name: 'registrationId')
  final String registrationId;
  @JsonKey(name: 'displayName')
  final String displayName;
  @JsonKey(name: 'publicKey')
  final String publicKey;
  @JsonKey(name: 'pushkey')
  final String pushkey;
  static const fromJsonFactory = _$PostDeviceRequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostDeviceRequestBody &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.registrationId, registrationId) ||
                const DeepCollectionEquality()
                    .equals(other.registrationId, registrationId)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)) &&
            (identical(other.pushkey, pushkey) ||
                const DeepCollectionEquality().equals(other.pushkey, pushkey)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(registrationId) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(publicKey) ^
      const DeepCollectionEquality().hash(pushkey) ^
      runtimeType.hashCode;
}

extension $PostDeviceRequestBodyExtension on PostDeviceRequestBody {
  PostDeviceRequestBody copyWith(
      {String? platform,
      String? registrationId,
      String? displayName,
      String? publicKey,
      String? pushkey}) {
    return PostDeviceRequestBody(
        platform: platform ?? this.platform,
        registrationId: registrationId ?? this.registrationId,
        displayName: displayName ?? this.displayName,
        publicKey: publicKey ?? this.publicKey,
        pushkey: pushkey ?? this.pushkey);
  }

  PostDeviceRequestBody copyWithWrapped(
      {Wrapped<String>? platform,
      Wrapped<String>? registrationId,
      Wrapped<String>? displayName,
      Wrapped<String>? publicKey,
      Wrapped<String>? pushkey}) {
    return PostDeviceRequestBody(
        platform: (platform != null ? platform.value : this.platform),
        registrationId: (registrationId != null
            ? registrationId.value
            : this.registrationId),
        displayName:
            (displayName != null ? displayName.value : this.displayName),
        publicKey: (publicKey != null ? publicKey.value : this.publicKey),
        pushkey: (pushkey != null ? pushkey.value : this.pushkey));
  }
}

@JsonSerializable(explicitToJson: true)
class PostDeviceResponse {
  const PostDeviceResponse({
    this.guid,
  });

  factory PostDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$PostDeviceResponseFromJson(json);

  static const toJsonFactory = _$PostDeviceResponseToJson;
  Map<String, dynamic> toJson() => _$PostDeviceResponseToJson(this);

  @JsonKey(name: 'guid')
  final String? guid;
  static const fromJsonFactory = _$PostDeviceResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostDeviceResponse &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^ runtimeType.hashCode;
}

extension $PostDeviceResponseExtension on PostDeviceResponse {
  PostDeviceResponse copyWith({String? guid}) {
    return PostDeviceResponse(guid: guid ?? this.guid);
  }

  PostDeviceResponse copyWithWrapped({Wrapped<String?>? guid}) {
    return PostDeviceResponse(guid: (guid != null ? guid.value : this.guid));
  }
}

typedef GetDeviceIntegrationsResponseBody
    = List<GetDeviceIntegrationsResponseBody$Item>;

@JsonSerializable(explicitToJson: true)
class GetDeviceIntegrationsResponseBody$Item {
  const GetDeviceIntegrationsResponseBody$Item({
    required this.integrationId,
    required this.platform,
    required this.displayName,
  });

  factory GetDeviceIntegrationsResponseBody$Item.fromJson(
          Map<String, dynamic> json) =>
      _$GetDeviceIntegrationsResponseBody$ItemFromJson(json);

  static const toJsonFactory = _$GetDeviceIntegrationsResponseBody$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$GetDeviceIntegrationsResponseBody$ItemToJson(this);

  @JsonKey(name: 'integrationId')
  final String integrationId;
  @JsonKey(name: 'platform')
  final String platform;
  @JsonKey(name: 'displayName')
  final String displayName;
  static const fromJsonFactory =
      _$GetDeviceIntegrationsResponseBody$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetDeviceIntegrationsResponseBody$Item &&
            (identical(other.integrationId, integrationId) ||
                const DeepCollectionEquality()
                    .equals(other.integrationId, integrationId)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(integrationId) ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(displayName) ^
      runtimeType.hashCode;
}

extension $GetDeviceIntegrationsResponseBody$ItemExtension
    on GetDeviceIntegrationsResponseBody$Item {
  GetDeviceIntegrationsResponseBody$Item copyWith(
      {String? integrationId, String? platform, String? displayName}) {
    return GetDeviceIntegrationsResponseBody$Item(
        integrationId: integrationId ?? this.integrationId,
        platform: platform ?? this.platform,
        displayName: displayName ?? this.displayName);
  }

  GetDeviceIntegrationsResponseBody$Item copyWithWrapped(
      {Wrapped<String>? integrationId,
      Wrapped<String>? platform,
      Wrapped<String>? displayName}) {
    return GetDeviceIntegrationsResponseBody$Item(
        integrationId:
            (integrationId != null ? integrationId.value : this.integrationId),
        platform: (platform != null ? platform.value : this.platform),
        displayName:
            (displayName != null ? displayName.value : this.displayName));
  }
}

typedef GetIntegrationDevicesResponseBody
    = List<GetIntegrationDevicesResponseBody$Item>;

@JsonSerializable(explicitToJson: true)
class GetIntegrationDevicesResponseBody$Item {
  const GetIntegrationDevicesResponseBody$Item({
    required this.deviceId,
    required this.platform,
    required this.displayName,
  });

  factory GetIntegrationDevicesResponseBody$Item.fromJson(
          Map<String, dynamic> json) =>
      _$GetIntegrationDevicesResponseBody$ItemFromJson(json);

  static const toJsonFactory = _$GetIntegrationDevicesResponseBody$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$GetIntegrationDevicesResponseBody$ItemToJson(this);

  @JsonKey(name: 'deviceId')
  final String deviceId;
  @JsonKey(name: 'platform')
  final String platform;
  @JsonKey(name: 'displayName')
  final String displayName;
  static const fromJsonFactory =
      _$GetIntegrationDevicesResponseBody$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GetIntegrationDevicesResponseBody$Item &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(displayName) ^
      runtimeType.hashCode;
}

extension $GetIntegrationDevicesResponseBody$ItemExtension
    on GetIntegrationDevicesResponseBody$Item {
  GetIntegrationDevicesResponseBody$Item copyWith(
      {String? deviceId, String? platform, String? displayName}) {
    return GetIntegrationDevicesResponseBody$Item(
        deviceId: deviceId ?? this.deviceId,
        platform: platform ?? this.platform,
        displayName: displayName ?? this.displayName);
  }

  GetIntegrationDevicesResponseBody$Item copyWithWrapped(
      {Wrapped<String>? deviceId,
      Wrapped<String>? platform,
      Wrapped<String>? displayName}) {
    return GetIntegrationDevicesResponseBody$Item(
        deviceId: (deviceId != null ? deviceId.value : this.deviceId),
        platform: (platform != null ? platform.value : this.platform),
        displayName:
            (displayName != null ? displayName.value : this.displayName));
  }
}

@JsonSerializable(explicitToJson: true)
class PostDeviceIntegrationsRequestBody {
  const PostDeviceIntegrationsRequestBody({
    required this.integrationPairingToken,
  });

  factory PostDeviceIntegrationsRequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$PostDeviceIntegrationsRequestBodyFromJson(json);

  static const toJsonFactory = _$PostDeviceIntegrationsRequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$PostDeviceIntegrationsRequestBodyToJson(this);

  @JsonKey(name: 'integrationPairingToken')
  final String integrationPairingToken;
  static const fromJsonFactory = _$PostDeviceIntegrationsRequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PostDeviceIntegrationsRequestBody &&
            (identical(
                    other.integrationPairingToken, integrationPairingToken) ||
                const DeepCollectionEquality().equals(
                    other.integrationPairingToken, integrationPairingToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(integrationPairingToken) ^
      runtimeType.hashCode;
}

extension $PostDeviceIntegrationsRequestBodyExtension
    on PostDeviceIntegrationsRequestBody {
  PostDeviceIntegrationsRequestBody copyWith(
      {String? integrationPairingToken}) {
    return PostDeviceIntegrationsRequestBody(
        integrationPairingToken:
            integrationPairingToken ?? this.integrationPairingToken);
  }

  PostDeviceIntegrationsRequestBody copyWithWrapped(
      {Wrapped<String>? integrationPairingToken}) {
    return PostDeviceIntegrationsRequestBody(
        integrationPairingToken: (integrationPairingToken != null
            ? integrationPairingToken.value
            : this.integrationPairingToken));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentPostRequestBody {
  const DocumentPostRequestBody({
    required this.document,
    this.parameters,
    this.payloadMimeType,
  });

  factory DocumentPostRequestBody.fromJson(Map<String, dynamic> json) =>
      _$DocumentPostRequestBodyFromJson(json);

  static const toJsonFactory = _$DocumentPostRequestBodyToJson;
  Map<String, dynamic> toJson() => _$DocumentPostRequestBodyToJson(this);

  @JsonKey(name: 'document')
  final Document document;
  @JsonKey(name: 'parameters')
  final SigningParameters? parameters;
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
      Wrapped<SigningParameters?>? parameters,
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
    this.filename,
    required this.content,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  static const toJsonFactory = _$DocumentToJson;
  Map<String, dynamic> toJson() => _$DocumentToJson(this);

  @JsonKey(name: 'filename')
  final String? filename;
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
      {Wrapped<String?>? filename, Wrapped<String>? content}) {
    return Document(
        filename: (filename != null ? filename.value : this.filename),
        content: (content != null ? content.value : this.content));
  }
}

@JsonSerializable(explicitToJson: true)
class SignatureLevelResponse {
  const SignatureLevelResponse({
    this.level,
  });

  factory SignatureLevelResponse.fromJson(Map<String, dynamic> json) =>
      _$SignatureLevelResponseFromJson(json);

  static const toJsonFactory = _$SignatureLevelResponseToJson;
  Map<String, dynamic> toJson() => _$SignatureLevelResponseToJson(this);

  @JsonKey(
    name: 'level',
    toJson: signatureLevelResponseLevelNullableToJson,
    fromJson: signatureLevelResponseLevelNullableFromJson,
  )
  final enums.SignatureLevelResponseLevel? level;
  static const fromJsonFactory = _$SignatureLevelResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SignatureLevelResponse &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(level) ^ runtimeType.hashCode;
}

extension $SignatureLevelResponseExtension on SignatureLevelResponse {
  SignatureLevelResponse copyWith({enums.SignatureLevelResponseLevel? level}) {
    return SignatureLevelResponse(level: level ?? this.level);
  }

  SignatureLevelResponse copyWithWrapped(
      {Wrapped<enums.SignatureLevelResponseLevel?>? level}) {
    return SignatureLevelResponse(
        level: (level != null ? level.value : this.level));
  }
}

@JsonSerializable(explicitToJson: true)
class SigningParameters {
  const SigningParameters({
    this.checkPDFACompliance,
    this.autoLoadEform,
    this.level,
    this.container,
    this.containerXmlns,
    this.embedUsedSchemas,
    this.identifier,
    this.packaging,
    this.digestAlgorithm,
    this.en319132,
    this.infoCanonicalization,
    this.propertiesCanonicalization,
    this.keyInfoCanonicalization,
    this.schema,
    this.schemaIdentifier,
    this.transformation,
    this.transformationIdentifier,
    this.transformationLanguage,
    this.transformationMediaDestinationTypeDescription,
    this.transformationTargetEnvironment,
  });

  factory SigningParameters.fromJson(Map<String, dynamic> json) =>
      _$SigningParametersFromJson(json);

  static const toJsonFactory = _$SigningParametersToJson;
  Map<String, dynamic> toJson() => _$SigningParametersToJson(this);

  @JsonKey(name: 'checkPDFACompliance', defaultValue: false)
  final bool? checkPDFACompliance;
  @JsonKey(name: 'autoLoadEform', defaultValue: false)
  final bool? autoLoadEform;
  @JsonKey(
    name: 'level',
    toJson: signingParametersLevelNullableToJson,
    fromJson: signingParametersLevelNullableFromJson,
  )
  final enums.SigningParametersLevel? level;
  @JsonKey(
    name: 'container',
    toJson: signingParametersContainerNullableToJson,
    fromJson: signingParametersContainerNullableFromJson,
  )
  final enums.SigningParametersContainer? container;
  @JsonKey(
    name: 'containerXmlns',
    toJson: signingParametersContainerXmlnsNullableToJson,
    fromJson: signingParametersContainerXmlnsNullableFromJson,
  )
  final enums.SigningParametersContainerXmlns? containerXmlns;
  @JsonKey(name: 'embedUsedSchemas')
  final bool? embedUsedSchemas;
  @JsonKey(name: 'identifier')
  final String? identifier;
  @JsonKey(
    name: 'packaging',
    toJson: signingParametersPackagingNullableToJson,
    fromJson: signingParametersPackagingPackagingNullableFromJson,
  )
  final enums.SigningParametersPackaging? packaging;
  static enums.SigningParametersPackaging?
      signingParametersPackagingPackagingNullableFromJson(Object? value) =>
          signingParametersPackagingNullableFromJson(
              value, enums.SigningParametersPackaging.enveloped);

  @JsonKey(
    name: 'digestAlgorithm',
    toJson: signingParametersDigestAlgorithmNullableToJson,
    fromJson: signingParametersDigestAlgorithmDigestAlgorithmNullableFromJson,
  )
  final enums.SigningParametersDigestAlgorithm? digestAlgorithm;
  static enums.SigningParametersDigestAlgorithm?
      signingParametersDigestAlgorithmDigestAlgorithmNullableFromJson(
              Object? value) =>
          signingParametersDigestAlgorithmNullableFromJson(
              value, enums.SigningParametersDigestAlgorithm.sha256);

  @JsonKey(name: 'en319132', defaultValue: false)
  final bool? en319132;
  @JsonKey(
    name: 'infoCanonicalization',
    toJson: signingParametersInfoCanonicalizationNullableToJson,
    fromJson:
        signingParametersInfoCanonicalizationInfoCanonicalizationNullableFromJson,
  )
  final enums.SigningParametersInfoCanonicalization? infoCanonicalization;
  static enums.SigningParametersInfoCanonicalization?
      signingParametersInfoCanonicalizationInfoCanonicalizationNullableFromJson(
              Object? value) =>
          signingParametersInfoCanonicalizationNullableFromJson(
              value, enums.SigningParametersInfoCanonicalization.inclusive);

  @JsonKey(
    name: 'propertiesCanonicalization',
    toJson: signingParametersPropertiesCanonicalizationNullableToJson,
    fromJson:
        signingParametersPropertiesCanonicalizationPropertiesCanonicalizationNullableFromJson,
  )
  final enums.SigningParametersPropertiesCanonicalization?
      propertiesCanonicalization;
  static enums.SigningParametersPropertiesCanonicalization?
      signingParametersPropertiesCanonicalizationPropertiesCanonicalizationNullableFromJson(
              Object? value) =>
          signingParametersPropertiesCanonicalizationNullableFromJson(value,
              enums.SigningParametersPropertiesCanonicalization.inclusive);

  @JsonKey(
    name: 'keyInfoCanonicalization',
    toJson: signingParametersKeyInfoCanonicalizationNullableToJson,
    fromJson:
        signingParametersKeyInfoCanonicalizationKeyInfoCanonicalizationNullableFromJson,
  )
  final enums.SigningParametersKeyInfoCanonicalization? keyInfoCanonicalization;
  static enums.SigningParametersKeyInfoCanonicalization?
      signingParametersKeyInfoCanonicalizationKeyInfoCanonicalizationNullableFromJson(
              Object? value) =>
          signingParametersKeyInfoCanonicalizationNullableFromJson(
              value, enums.SigningParametersKeyInfoCanonicalization.inclusive);

  @JsonKey(name: 'schema')
  final String? schema;
  @JsonKey(name: 'schemaIdentifier')
  final String? schemaIdentifier;
  @JsonKey(name: 'transformation')
  final String? transformation;
  @JsonKey(name: 'transformationIdentifier')
  final String? transformationIdentifier;
  @JsonKey(name: 'transformationLanguage')
  final String? transformationLanguage;
  @JsonKey(
    name: 'transformationMediaDestinationTypeDescription',
    toJson:
        signingParametersTransformationMediaDestinationTypeDescriptionNullableToJson,
    fromJson:
        signingParametersTransformationMediaDestinationTypeDescriptionNullableFromJson,
  )
  final enums.SigningParametersTransformationMediaDestinationTypeDescription?
      transformationMediaDestinationTypeDescription;
  @JsonKey(name: 'transformationTargetEnvironment')
  final String? transformationTargetEnvironment;
  static const fromJsonFactory = _$SigningParametersFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SigningParameters &&
            (identical(other.checkPDFACompliance, checkPDFACompliance) ||
                const DeepCollectionEquality()
                    .equals(other.checkPDFACompliance, checkPDFACompliance)) &&
            (identical(other.autoLoadEform, autoLoadEform) ||
                const DeepCollectionEquality()
                    .equals(other.autoLoadEform, autoLoadEform)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.container, container) ||
                const DeepCollectionEquality()
                    .equals(other.container, container)) &&
            (identical(other.containerXmlns, containerXmlns) ||
                const DeepCollectionEquality()
                    .equals(other.containerXmlns, containerXmlns)) &&
            (identical(other.embedUsedSchemas, embedUsedSchemas) ||
                const DeepCollectionEquality()
                    .equals(other.embedUsedSchemas, embedUsedSchemas)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.packaging, packaging) ||
                const DeepCollectionEquality()
                    .equals(other.packaging, packaging)) &&
            (identical(other.digestAlgorithm, digestAlgorithm) ||
                const DeepCollectionEquality()
                    .equals(other.digestAlgorithm, digestAlgorithm)) &&
            (identical(other.en319132, en319132) ||
                const DeepCollectionEquality()
                    .equals(other.en319132, en319132)) &&
            (identical(other.infoCanonicalization, infoCanonicalization) ||
                const DeepCollectionEquality().equals(
                    other.infoCanonicalization, infoCanonicalization)) &&
            (identical(other.propertiesCanonicalization, propertiesCanonicalization) ||
                const DeepCollectionEquality().equals(
                    other.propertiesCanonicalization,
                    propertiesCanonicalization)) &&
            (identical(other.keyInfoCanonicalization, keyInfoCanonicalization) ||
                const DeepCollectionEquality().equals(
                    other.keyInfoCanonicalization, keyInfoCanonicalization)) &&
            (identical(other.schema, schema) ||
                const DeepCollectionEquality().equals(other.schema, schema)) &&
            (identical(other.schemaIdentifier, schemaIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.schemaIdentifier, schemaIdentifier)) &&
            (identical(other.transformation, transformation) ||
                const DeepCollectionEquality()
                    .equals(other.transformation, transformation)) &&
            (identical(other.transformationIdentifier, transformationIdentifier) ||
                const DeepCollectionEquality().equals(
                    other.transformationIdentifier,
                    transformationIdentifier)) &&
            (identical(other.transformationLanguage, transformationLanguage) ||
                const DeepCollectionEquality().equals(
                    other.transformationLanguage, transformationLanguage)) &&
            (identical(other.transformationMediaDestinationTypeDescription, transformationMediaDestinationTypeDescription) || const DeepCollectionEquality().equals(other.transformationMediaDestinationTypeDescription, transformationMediaDestinationTypeDescription)) &&
            (identical(other.transformationTargetEnvironment, transformationTargetEnvironment) || const DeepCollectionEquality().equals(other.transformationTargetEnvironment, transformationTargetEnvironment)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(checkPDFACompliance) ^
      const DeepCollectionEquality().hash(autoLoadEform) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(container) ^
      const DeepCollectionEquality().hash(containerXmlns) ^
      const DeepCollectionEquality().hash(embedUsedSchemas) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(packaging) ^
      const DeepCollectionEquality().hash(digestAlgorithm) ^
      const DeepCollectionEquality().hash(en319132) ^
      const DeepCollectionEquality().hash(infoCanonicalization) ^
      const DeepCollectionEquality().hash(propertiesCanonicalization) ^
      const DeepCollectionEquality().hash(keyInfoCanonicalization) ^
      const DeepCollectionEquality().hash(schema) ^
      const DeepCollectionEquality().hash(schemaIdentifier) ^
      const DeepCollectionEquality().hash(transformation) ^
      const DeepCollectionEquality().hash(transformationIdentifier) ^
      const DeepCollectionEquality().hash(transformationLanguage) ^
      const DeepCollectionEquality()
          .hash(transformationMediaDestinationTypeDescription) ^
      const DeepCollectionEquality().hash(transformationTargetEnvironment) ^
      runtimeType.hashCode;
}

extension $SigningParametersExtension on SigningParameters {
  SigningParameters copyWith(
      {bool? checkPDFACompliance,
      bool? autoLoadEform,
      enums.SigningParametersLevel? level,
      enums.SigningParametersContainer? container,
      enums.SigningParametersContainerXmlns? containerXmlns,
      bool? embedUsedSchemas,
      String? identifier,
      enums.SigningParametersPackaging? packaging,
      enums.SigningParametersDigestAlgorithm? digestAlgorithm,
      bool? en319132,
      enums.SigningParametersInfoCanonicalization? infoCanonicalization,
      enums.SigningParametersPropertiesCanonicalization?
          propertiesCanonicalization,
      enums.SigningParametersKeyInfoCanonicalization? keyInfoCanonicalization,
      String? schema,
      String? schemaIdentifier,
      String? transformation,
      String? transformationIdentifier,
      String? transformationLanguage,
      enums.SigningParametersTransformationMediaDestinationTypeDescription?
          transformationMediaDestinationTypeDescription,
      String? transformationTargetEnvironment}) {
    return SigningParameters(
        checkPDFACompliance: checkPDFACompliance ?? this.checkPDFACompliance,
        autoLoadEform: autoLoadEform ?? this.autoLoadEform,
        level: level ?? this.level,
        container: container ?? this.container,
        containerXmlns: containerXmlns ?? this.containerXmlns,
        embedUsedSchemas: embedUsedSchemas ?? this.embedUsedSchemas,
        identifier: identifier ?? this.identifier,
        packaging: packaging ?? this.packaging,
        digestAlgorithm: digestAlgorithm ?? this.digestAlgorithm,
        en319132: en319132 ?? this.en319132,
        infoCanonicalization: infoCanonicalization ?? this.infoCanonicalization,
        propertiesCanonicalization:
            propertiesCanonicalization ?? this.propertiesCanonicalization,
        keyInfoCanonicalization:
            keyInfoCanonicalization ?? this.keyInfoCanonicalization,
        schema: schema ?? this.schema,
        schemaIdentifier: schemaIdentifier ?? this.schemaIdentifier,
        transformation: transformation ?? this.transformation,
        transformationIdentifier:
            transformationIdentifier ?? this.transformationIdentifier,
        transformationLanguage:
            transformationLanguage ?? this.transformationLanguage,
        transformationMediaDestinationTypeDescription:
            transformationMediaDestinationTypeDescription ??
                this.transformationMediaDestinationTypeDescription,
        transformationTargetEnvironment: transformationTargetEnvironment ??
            this.transformationTargetEnvironment);
  }

  SigningParameters copyWithWrapped(
      {Wrapped<bool?>? checkPDFACompliance,
      Wrapped<bool?>? autoLoadEform,
      Wrapped<enums.SigningParametersLevel?>? level,
      Wrapped<enums.SigningParametersContainer?>? container,
      Wrapped<enums.SigningParametersContainerXmlns?>? containerXmlns,
      Wrapped<bool?>? embedUsedSchemas,
      Wrapped<String?>? identifier,
      Wrapped<enums.SigningParametersPackaging?>? packaging,
      Wrapped<enums.SigningParametersDigestAlgorithm?>? digestAlgorithm,
      Wrapped<bool?>? en319132,
      Wrapped<enums.SigningParametersInfoCanonicalization?>?
          infoCanonicalization,
      Wrapped<enums.SigningParametersPropertiesCanonicalization?>?
          propertiesCanonicalization,
      Wrapped<enums.SigningParametersKeyInfoCanonicalization?>?
          keyInfoCanonicalization,
      Wrapped<String?>? schema,
      Wrapped<String?>? schemaIdentifier,
      Wrapped<String?>? transformation,
      Wrapped<String?>? transformationIdentifier,
      Wrapped<String?>? transformationLanguage,
      Wrapped<
              enums
              .SigningParametersTransformationMediaDestinationTypeDescription?>?
          transformationMediaDestinationTypeDescription,
      Wrapped<String?>? transformationTargetEnvironment}) {
    return SigningParameters(
        checkPDFACompliance: (checkPDFACompliance != null
            ? checkPDFACompliance.value
            : this.checkPDFACompliance),
        autoLoadEform:
            (autoLoadEform != null ? autoLoadEform.value : this.autoLoadEform),
        level: (level != null ? level.value : this.level),
        container: (container != null ? container.value : this.container),
        containerXmlns: (containerXmlns != null
            ? containerXmlns.value
            : this.containerXmlns),
        embedUsedSchemas: (embedUsedSchemas != null
            ? embedUsedSchemas.value
            : this.embedUsedSchemas),
        identifier: (identifier != null ? identifier.value : this.identifier),
        packaging: (packaging != null ? packaging.value : this.packaging),
        digestAlgorithm: (digestAlgorithm != null
            ? digestAlgorithm.value
            : this.digestAlgorithm),
        en319132: (en319132 != null ? en319132.value : this.en319132),
        infoCanonicalization: (infoCanonicalization != null
            ? infoCanonicalization.value
            : this.infoCanonicalization),
        propertiesCanonicalization: (propertiesCanonicalization != null
            ? propertiesCanonicalization.value
            : this.propertiesCanonicalization),
        keyInfoCanonicalization: (keyInfoCanonicalization != null
            ? keyInfoCanonicalization.value
            : this.keyInfoCanonicalization),
        schema: (schema != null ? schema.value : this.schema),
        schemaIdentifier: (schemaIdentifier != null
            ? schemaIdentifier.value
            : this.schemaIdentifier),
        transformation: (transformation != null
            ? transformation.value
            : this.transformation),
        transformationIdentifier: (transformationIdentifier != null
            ? transformationIdentifier.value
            : this.transformationIdentifier),
        transformationLanguage: (transformationLanguage != null
            ? transformationLanguage.value
            : this.transformationLanguage),
        transformationMediaDestinationTypeDescription:
            (transformationMediaDestinationTypeDescription != null
                ? transformationMediaDestinationTypeDescription.value
                : this.transformationMediaDestinationTypeDescription),
        transformationTargetEnvironment:
            (transformationTargetEnvironment != null
                ? transformationTargetEnvironment.value
                : this.transformationTargetEnvironment));
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
    this.containerType,
    this.signatureForm,
    this.signatures,
    this.signedObjects,
    this.unsignedObjects,
  });

  factory DocumentValidationResponseBody.fromJson(Map<String, dynamic> json) =>
      _$DocumentValidationResponseBodyFromJson(json);

  static const toJsonFactory = _$DocumentValidationResponseBodyToJson;
  Map<String, dynamic> toJson() => _$DocumentValidationResponseBodyToJson(this);

  @JsonKey(
    name: 'containerType',
    toJson: documentValidationResponseBodyContainerTypeNullableToJson,
    fromJson: documentValidationResponseBodyContainerTypeNullableFromJson,
  )
  final enums.DocumentValidationResponseBodyContainerType? containerType;
  @JsonKey(
    name: 'signatureForm',
    toJson: documentValidationResponseBodySignatureFormNullableToJson,
    fromJson: documentValidationResponseBodySignatureFormNullableFromJson,
  )
  final enums.DocumentValidationResponseBodySignatureForm? signatureForm;
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
            (identical(other.containerType, containerType) ||
                const DeepCollectionEquality()
                    .equals(other.containerType, containerType)) &&
            (identical(other.signatureForm, signatureForm) ||
                const DeepCollectionEquality()
                    .equals(other.signatureForm, signatureForm)) &&
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
      const DeepCollectionEquality().hash(containerType) ^
      const DeepCollectionEquality().hash(signatureForm) ^
      const DeepCollectionEquality().hash(signatures) ^
      const DeepCollectionEquality().hash(signedObjects) ^
      const DeepCollectionEquality().hash(unsignedObjects) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBodyExtension
    on DocumentValidationResponseBody {
  DocumentValidationResponseBody copyWith(
      {enums.DocumentValidationResponseBodyContainerType? containerType,
      enums.DocumentValidationResponseBodySignatureForm? signatureForm,
      List<DocumentValidationResponseBody$Signatures$Item>? signatures,
      List<DocumentValidationResponseBody$SignedObjects$Item>? signedObjects,
      List<DocumentValidationResponseBody$UnsignedObjects$Item>?
          unsignedObjects}) {
    return DocumentValidationResponseBody(
        containerType: containerType ?? this.containerType,
        signatureForm: signatureForm ?? this.signatureForm,
        signatures: signatures ?? this.signatures,
        signedObjects: signedObjects ?? this.signedObjects,
        unsignedObjects: unsignedObjects ?? this.unsignedObjects);
  }

  DocumentValidationResponseBody copyWithWrapped(
      {Wrapped<enums.DocumentValidationResponseBodyContainerType?>?
          containerType,
      Wrapped<enums.DocumentValidationResponseBodySignatureForm?>?
          signatureForm,
      Wrapped<List<DocumentValidationResponseBody$Signatures$Item>?>?
          signatures,
      Wrapped<List<DocumentValidationResponseBody$SignedObjects$Item>?>?
          signedObjects,
      Wrapped<List<DocumentValidationResponseBody$UnsignedObjects$Item>?>?
          unsignedObjects}) {
    return DocumentValidationResponseBody(
        containerType:
            (containerType != null ? containerType.value : this.containerType),
        signatureForm:
            (signatureForm != null ? signatureForm.value : this.signatureForm),
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
    required this.validationResult,
    required this.level,
    required this.claimedSigningTime,
    required this.bestSigningTime,
    required this.signingCertificate,
    required this.areQualifiedTimestamps,
    this.timestamps,
    this.signedObjectsIds,
  });

  factory DocumentValidationResponseBody$Signatures$Item.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$ItemFromJson(json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$ItemToJson(this);

  @JsonKey(
    name: 'validationResult',
    toJson:
        documentValidationResponseBody$Signatures$ItemValidationResultToJson,
    fromJson:
        documentValidationResponseBody$Signatures$ItemValidationResultFromJson,
  )
  final enums.DocumentValidationResponseBody$Signatures$ItemValidationResult
      validationResult;
  @JsonKey(
    name: 'level',
    toJson: documentValidationResponseBody$Signatures$ItemLevelToJson,
    fromJson: documentValidationResponseBody$Signatures$ItemLevelFromJson,
  )
  final enums.DocumentValidationResponseBody$Signatures$ItemLevel level;
  @JsonKey(name: 'claimedSigningTime')
  final String claimedSigningTime;
  @JsonKey(name: 'bestSigningTime')
  final String bestSigningTime;
  @JsonKey(name: 'signingCertificate')
  final DocumentValidationResponseBody$Signatures$Item$SigningCertificate
      signingCertificate;
  @JsonKey(name: 'areQualifiedTimestamps')
  final bool areQualifiedTimestamps;
  @JsonKey(name: 'timestamps')
  final List<DocumentValidationResponseBody$Signatures$Item$Timestamps$Item>?
      timestamps;
  @JsonKey(name: 'signedObjectsIds', defaultValue: <Object>[])
  final List<Object>? signedObjectsIds;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item &&
            (identical(other.validationResult, validationResult) ||
                const DeepCollectionEquality()
                    .equals(other.validationResult, validationResult)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.claimedSigningTime, claimedSigningTime) ||
                const DeepCollectionEquality()
                    .equals(other.claimedSigningTime, claimedSigningTime)) &&
            (identical(other.bestSigningTime, bestSigningTime) ||
                const DeepCollectionEquality()
                    .equals(other.bestSigningTime, bestSigningTime)) &&
            (identical(other.signingCertificate, signingCertificate) ||
                const DeepCollectionEquality()
                    .equals(other.signingCertificate, signingCertificate)) &&
            (identical(other.areQualifiedTimestamps, areQualifiedTimestamps) ||
                const DeepCollectionEquality().equals(
                    other.areQualifiedTimestamps, areQualifiedTimestamps)) &&
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
      const DeepCollectionEquality().hash(validationResult) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(claimedSigningTime) ^
      const DeepCollectionEquality().hash(bestSigningTime) ^
      const DeepCollectionEquality().hash(signingCertificate) ^
      const DeepCollectionEquality().hash(areQualifiedTimestamps) ^
      const DeepCollectionEquality().hash(timestamps) ^
      const DeepCollectionEquality().hash(signedObjectsIds) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$ItemExtension
    on DocumentValidationResponseBody$Signatures$Item {
  DocumentValidationResponseBody$Signatures$Item copyWith(
      {enums.DocumentValidationResponseBody$Signatures$ItemValidationResult?
          validationResult,
      enums.DocumentValidationResponseBody$Signatures$ItemLevel? level,
      String? claimedSigningTime,
      String? bestSigningTime,
      DocumentValidationResponseBody$Signatures$Item$SigningCertificate?
          signingCertificate,
      bool? areQualifiedTimestamps,
      List<DocumentValidationResponseBody$Signatures$Item$Timestamps$Item>?
          timestamps,
      List<Object>? signedObjectsIds}) {
    return DocumentValidationResponseBody$Signatures$Item(
        validationResult: validationResult ?? this.validationResult,
        level: level ?? this.level,
        claimedSigningTime: claimedSigningTime ?? this.claimedSigningTime,
        bestSigningTime: bestSigningTime ?? this.bestSigningTime,
        signingCertificate: signingCertificate ?? this.signingCertificate,
        areQualifiedTimestamps:
            areQualifiedTimestamps ?? this.areQualifiedTimestamps,
        timestamps: timestamps ?? this.timestamps,
        signedObjectsIds: signedObjectsIds ?? this.signedObjectsIds);
  }

  DocumentValidationResponseBody$Signatures$Item copyWithWrapped(
      {Wrapped<
              enums
              .DocumentValidationResponseBody$Signatures$ItemValidationResult>?
          validationResult,
      Wrapped<enums.DocumentValidationResponseBody$Signatures$ItemLevel>? level,
      Wrapped<String>? claimedSigningTime,
      Wrapped<String>? bestSigningTime,
      Wrapped<DocumentValidationResponseBody$Signatures$Item$SigningCertificate>?
          signingCertificate,
      Wrapped<bool>? areQualifiedTimestamps,
      Wrapped<
              List<
                  DocumentValidationResponseBody$Signatures$Item$Timestamps$Item>?>?
          timestamps,
      Wrapped<List<Object>?>? signedObjectsIds}) {
    return DocumentValidationResponseBody$Signatures$Item(
        validationResult: (validationResult != null
            ? validationResult.value
            : this.validationResult),
        level: (level != null ? level.value : this.level),
        claimedSigningTime: (claimedSigningTime != null
            ? claimedSigningTime.value
            : this.claimedSigningTime),
        bestSigningTime: (bestSigningTime != null
            ? bestSigningTime.value
            : this.bestSigningTime),
        signingCertificate: (signingCertificate != null
            ? signingCertificate.value
            : this.signingCertificate),
        areQualifiedTimestamps: (areQualifiedTimestamps != null
            ? areQualifiedTimestamps.value
            : this.areQualifiedTimestamps),
        timestamps: (timestamps != null ? timestamps.value : this.timestamps),
        signedObjectsIds: (signedObjectsIds != null
            ? signedObjectsIds.value
            : this.signedObjectsIds));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$SignedObjects$Item {
  const DocumentValidationResponseBody$SignedObjects$Item({
    required this.id,
    this.mimeType,
    required this.filename,
  });

  factory DocumentValidationResponseBody$SignedObjects$Item.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$SignedObjects$ItemFromJson(json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$SignedObjects$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$SignedObjects$ItemToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'mimeType')
  final String? mimeType;
  @JsonKey(name: 'filename')
  final String filename;
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
      {Wrapped<String>? id,
      Wrapped<String?>? mimeType,
      Wrapped<String>? filename}) {
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
    required this.filename,
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
  final String filename;
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
      {Wrapped<String?>? mimeType, Wrapped<String>? filename}) {
    return DocumentValidationResponseBody$UnsignedObjects$Item(
        mimeType: (mimeType != null ? mimeType.value : this.mimeType),
        filename: (filename != null ? filename.value : this.filename));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$SigningCertificate {
  const DocumentValidationResponseBody$Signatures$Item$SigningCertificate({
    required this.qualification,
    required this.issuerDN,
    required this.subjectDN,
    required this.certificateDer,
  });

  factory DocumentValidationResponseBody$Signatures$Item$SigningCertificate.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$SigningCertificateFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SigningCertificateToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$SigningCertificateToJson(
          this);

  @JsonKey(
    name: 'qualification',
    toJson:
        documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationFromJson,
  )
  final enums
      .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification
      qualification;
  @JsonKey(name: 'issuerDN')
  final String issuerDN;
  @JsonKey(name: 'subjectDN')
  final String subjectDN;
  @JsonKey(name: 'certificateDer')
  final String certificateDer;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$SigningCertificateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$SigningCertificate &&
            (identical(other.qualification, qualification) ||
                const DeepCollectionEquality()
                    .equals(other.qualification, qualification)) &&
            (identical(other.issuerDN, issuerDN) ||
                const DeepCollectionEquality()
                    .equals(other.issuerDN, issuerDN)) &&
            (identical(other.subjectDN, subjectDN) ||
                const DeepCollectionEquality()
                    .equals(other.subjectDN, subjectDN)) &&
            (identical(other.certificateDer, certificateDer) ||
                const DeepCollectionEquality()
                    .equals(other.certificateDer, certificateDer)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(qualification) ^
      const DeepCollectionEquality().hash(issuerDN) ^
      const DeepCollectionEquality().hash(subjectDN) ^
      const DeepCollectionEquality().hash(certificateDer) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$SigningCertificateExtension
    on DocumentValidationResponseBody$Signatures$Item$SigningCertificate {
  DocumentValidationResponseBody$Signatures$Item$SigningCertificate copyWith(
      {enums
          .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification?
          qualification,
      String? issuerDN,
      String? subjectDN,
      String? certificateDer}) {
    return DocumentValidationResponseBody$Signatures$Item$SigningCertificate(
        qualification: qualification ?? this.qualification,
        issuerDN: issuerDN ?? this.issuerDN,
        subjectDN: subjectDN ?? this.subjectDN,
        certificateDer: certificateDer ?? this.certificateDer);
  }

  DocumentValidationResponseBody$Signatures$Item$SigningCertificate copyWithWrapped(
      {Wrapped<
              enums
              .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification>?
          qualification,
      Wrapped<String>? issuerDN,
      Wrapped<String>? subjectDN,
      Wrapped<String>? certificateDer}) {
    return DocumentValidationResponseBody$Signatures$Item$SigningCertificate(
        qualification:
            (qualification != null ? qualification.value : this.qualification),
        issuerDN: (issuerDN != null ? issuerDN.value : this.issuerDN),
        subjectDN: (subjectDN != null ? subjectDN.value : this.subjectDN),
        certificateDer: (certificateDer != null
            ? certificateDer.value
            : this.certificateDer));
  }
}

@JsonSerializable(explicitToJson: true)
class DocumentValidationResponseBody$Signatures$Item$Timestamps$Item {
  const DocumentValidationResponseBody$Signatures$Item$Timestamps$Item({
    required this.qualification,
    required this.timestampType,
    required this.subjectDN,
    required this.certificateDer,
    required this.productionTime,
  });

  factory DocumentValidationResponseBody$Signatures$Item$Timestamps$Item.fromJson(
          Map<String, dynamic> json) =>
      _$DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemFromJson(
          json);

  static const toJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemToJson(
          this);

  @JsonKey(
    name: 'qualification',
    toJson:
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationFromJson,
  )
  final enums
      .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
      qualification;
  @JsonKey(
    name: 'timestampType',
    toJson:
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeToJson,
    fromJson:
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeFromJson,
  )
  final enums
      .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
      timestampType;
  @JsonKey(name: 'subjectDN')
  final String subjectDN;
  @JsonKey(name: 'certificateDer')
  final String certificateDer;
  @JsonKey(name: 'productionTime')
  final String productionTime;
  static const fromJsonFactory =
      _$DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DocumentValidationResponseBody$Signatures$Item$Timestamps$Item &&
            (identical(other.qualification, qualification) ||
                const DeepCollectionEquality()
                    .equals(other.qualification, qualification)) &&
            (identical(other.timestampType, timestampType) ||
                const DeepCollectionEquality()
                    .equals(other.timestampType, timestampType)) &&
            (identical(other.subjectDN, subjectDN) ||
                const DeepCollectionEquality()
                    .equals(other.subjectDN, subjectDN)) &&
            (identical(other.certificateDer, certificateDer) ||
                const DeepCollectionEquality()
                    .equals(other.certificateDer, certificateDer)) &&
            (identical(other.productionTime, productionTime) ||
                const DeepCollectionEquality()
                    .equals(other.productionTime, productionTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(qualification) ^
      const DeepCollectionEquality().hash(timestampType) ^
      const DeepCollectionEquality().hash(subjectDN) ^
      const DeepCollectionEquality().hash(certificateDer) ^
      const DeepCollectionEquality().hash(productionTime) ^
      runtimeType.hashCode;
}

extension $DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemExtension
    on DocumentValidationResponseBody$Signatures$Item$Timestamps$Item {
  DocumentValidationResponseBody$Signatures$Item$Timestamps$Item copyWith(
      {enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification?
          qualification,
      enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType?
          timestampType,
      String? subjectDN,
      String? certificateDer,
      String? productionTime}) {
    return DocumentValidationResponseBody$Signatures$Item$Timestamps$Item(
        qualification: qualification ?? this.qualification,
        timestampType: timestampType ?? this.timestampType,
        subjectDN: subjectDN ?? this.subjectDN,
        certificateDer: certificateDer ?? this.certificateDer,
        productionTime: productionTime ?? this.productionTime);
  }

  DocumentValidationResponseBody$Signatures$Item$Timestamps$Item copyWithWrapped(
      {Wrapped<
              enums
              .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification>?
          qualification,
      Wrapped<
              enums
              .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType>?
          timestampType,
      Wrapped<String>? subjectDN,
      Wrapped<String>? certificateDer,
      Wrapped<String>? productionTime}) {
    return DocumentValidationResponseBody$Signatures$Item$Timestamps$Item(
        qualification:
            (qualification != null ? qualification.value : this.qualification),
        timestampType:
            (timestampType != null ? timestampType.value : this.timestampType),
        subjectDN: (subjectDN != null ? subjectDN.value : this.subjectDN),
        certificateDer: (certificateDer != null
            ? certificateDer.value
            : this.certificateDer),
        productionTime: (productionTime != null
            ? productionTime.value
            : this.productionTime));
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

String? signatureLevelResponseLevelNullableToJson(
    enums.SignatureLevelResponseLevel? signatureLevelResponseLevel) {
  return signatureLevelResponseLevel?.value;
}

String? signatureLevelResponseLevelToJson(
    enums.SignatureLevelResponseLevel signatureLevelResponseLevel) {
  return signatureLevelResponseLevel.value;
}

enums.SignatureLevelResponseLevel signatureLevelResponseLevelFromJson(
  Object? signatureLevelResponseLevel, [
  enums.SignatureLevelResponseLevel? defaultValue,
]) {
  return enums.SignatureLevelResponseLevel.values
          .firstWhereOrNull((e) => e.value == signatureLevelResponseLevel) ??
      defaultValue ??
      enums.SignatureLevelResponseLevel.swaggerGeneratedUnknown;
}

enums.SignatureLevelResponseLevel? signatureLevelResponseLevelNullableFromJson(
  Object? signatureLevelResponseLevel, [
  enums.SignatureLevelResponseLevel? defaultValue,
]) {
  if (signatureLevelResponseLevel == null) {
    return null;
  }
  return enums.SignatureLevelResponseLevel.values
          .firstWhereOrNull((e) => e.value == signatureLevelResponseLevel) ??
      defaultValue;
}

String signatureLevelResponseLevelExplodedListToJson(
    List<enums.SignatureLevelResponseLevel>? signatureLevelResponseLevel) {
  return signatureLevelResponseLevel?.map((e) => e.value!).join(',') ?? '';
}

List<String> signatureLevelResponseLevelListToJson(
    List<enums.SignatureLevelResponseLevel>? signatureLevelResponseLevel) {
  if (signatureLevelResponseLevel == null) {
    return [];
  }

  return signatureLevelResponseLevel.map((e) => e.value!).toList();
}

List<enums.SignatureLevelResponseLevel> signatureLevelResponseLevelListFromJson(
  List? signatureLevelResponseLevel, [
  List<enums.SignatureLevelResponseLevel>? defaultValue,
]) {
  if (signatureLevelResponseLevel == null) {
    return defaultValue ?? [];
  }

  return signatureLevelResponseLevel
      .map((e) => signatureLevelResponseLevelFromJson(e.toString()))
      .toList();
}

List<enums.SignatureLevelResponseLevel>?
    signatureLevelResponseLevelNullableListFromJson(
  List? signatureLevelResponseLevel, [
  List<enums.SignatureLevelResponseLevel>? defaultValue,
]) {
  if (signatureLevelResponseLevel == null) {
    return defaultValue;
  }

  return signatureLevelResponseLevel
      .map((e) => signatureLevelResponseLevelFromJson(e.toString()))
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

String? signingParametersContainerXmlnsNullableToJson(
    enums.SigningParametersContainerXmlns? signingParametersContainerXmlns) {
  return signingParametersContainerXmlns?.value;
}

String? signingParametersContainerXmlnsToJson(
    enums.SigningParametersContainerXmlns signingParametersContainerXmlns) {
  return signingParametersContainerXmlns.value;
}

enums.SigningParametersContainerXmlns signingParametersContainerXmlnsFromJson(
  Object? signingParametersContainerXmlns, [
  enums.SigningParametersContainerXmlns? defaultValue,
]) {
  return enums.SigningParametersContainerXmlns.values.firstWhereOrNull(
          (e) => e.value == signingParametersContainerXmlns) ??
      defaultValue ??
      enums.SigningParametersContainerXmlns.swaggerGeneratedUnknown;
}

enums.SigningParametersContainerXmlns?
    signingParametersContainerXmlnsNullableFromJson(
  Object? signingParametersContainerXmlns, [
  enums.SigningParametersContainerXmlns? defaultValue,
]) {
  if (signingParametersContainerXmlns == null) {
    return null;
  }
  return enums.SigningParametersContainerXmlns.values.firstWhereOrNull(
          (e) => e.value == signingParametersContainerXmlns) ??
      defaultValue;
}

String signingParametersContainerXmlnsExplodedListToJson(
    List<enums.SigningParametersContainerXmlns>?
        signingParametersContainerXmlns) {
  return signingParametersContainerXmlns?.map((e) => e.value!).join(',') ?? '';
}

List<String> signingParametersContainerXmlnsListToJson(
    List<enums.SigningParametersContainerXmlns>?
        signingParametersContainerXmlns) {
  if (signingParametersContainerXmlns == null) {
    return [];
  }

  return signingParametersContainerXmlns.map((e) => e.value!).toList();
}

List<enums.SigningParametersContainerXmlns>
    signingParametersContainerXmlnsListFromJson(
  List? signingParametersContainerXmlns, [
  List<enums.SigningParametersContainerXmlns>? defaultValue,
]) {
  if (signingParametersContainerXmlns == null) {
    return defaultValue ?? [];
  }

  return signingParametersContainerXmlns
      .map((e) => signingParametersContainerXmlnsFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersContainerXmlns>?
    signingParametersContainerXmlnsNullableListFromJson(
  List? signingParametersContainerXmlns, [
  List<enums.SigningParametersContainerXmlns>? defaultValue,
]) {
  if (signingParametersContainerXmlns == null) {
    return defaultValue;
  }

  return signingParametersContainerXmlns
      .map((e) => signingParametersContainerXmlnsFromJson(e.toString()))
      .toList();
}

String? signingParametersPackagingNullableToJson(
    enums.SigningParametersPackaging? signingParametersPackaging) {
  return signingParametersPackaging?.value;
}

String? signingParametersPackagingToJson(
    enums.SigningParametersPackaging signingParametersPackaging) {
  return signingParametersPackaging.value;
}

enums.SigningParametersPackaging signingParametersPackagingFromJson(
  Object? signingParametersPackaging, [
  enums.SigningParametersPackaging? defaultValue,
]) {
  return enums.SigningParametersPackaging.values
          .firstWhereOrNull((e) => e.value == signingParametersPackaging) ??
      defaultValue ??
      enums.SigningParametersPackaging.swaggerGeneratedUnknown;
}

enums.SigningParametersPackaging? signingParametersPackagingNullableFromJson(
  Object? signingParametersPackaging, [
  enums.SigningParametersPackaging? defaultValue,
]) {
  if (signingParametersPackaging == null) {
    return null;
  }
  return enums.SigningParametersPackaging.values
          .firstWhereOrNull((e) => e.value == signingParametersPackaging) ??
      defaultValue;
}

String signingParametersPackagingExplodedListToJson(
    List<enums.SigningParametersPackaging>? signingParametersPackaging) {
  return signingParametersPackaging?.map((e) => e.value!).join(',') ?? '';
}

List<String> signingParametersPackagingListToJson(
    List<enums.SigningParametersPackaging>? signingParametersPackaging) {
  if (signingParametersPackaging == null) {
    return [];
  }

  return signingParametersPackaging.map((e) => e.value!).toList();
}

List<enums.SigningParametersPackaging> signingParametersPackagingListFromJson(
  List? signingParametersPackaging, [
  List<enums.SigningParametersPackaging>? defaultValue,
]) {
  if (signingParametersPackaging == null) {
    return defaultValue ?? [];
  }

  return signingParametersPackaging
      .map((e) => signingParametersPackagingFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersPackaging>?
    signingParametersPackagingNullableListFromJson(
  List? signingParametersPackaging, [
  List<enums.SigningParametersPackaging>? defaultValue,
]) {
  if (signingParametersPackaging == null) {
    return defaultValue;
  }

  return signingParametersPackaging
      .map((e) => signingParametersPackagingFromJson(e.toString()))
      .toList();
}

String? signingParametersDigestAlgorithmNullableToJson(
    enums.SigningParametersDigestAlgorithm? signingParametersDigestAlgorithm) {
  return signingParametersDigestAlgorithm?.value;
}

String? signingParametersDigestAlgorithmToJson(
    enums.SigningParametersDigestAlgorithm signingParametersDigestAlgorithm) {
  return signingParametersDigestAlgorithm.value;
}

enums.SigningParametersDigestAlgorithm signingParametersDigestAlgorithmFromJson(
  Object? signingParametersDigestAlgorithm, [
  enums.SigningParametersDigestAlgorithm? defaultValue,
]) {
  return enums.SigningParametersDigestAlgorithm.values.firstWhereOrNull(
          (e) => e.value == signingParametersDigestAlgorithm) ??
      defaultValue ??
      enums.SigningParametersDigestAlgorithm.swaggerGeneratedUnknown;
}

enums.SigningParametersDigestAlgorithm?
    signingParametersDigestAlgorithmNullableFromJson(
  Object? signingParametersDigestAlgorithm, [
  enums.SigningParametersDigestAlgorithm? defaultValue,
]) {
  if (signingParametersDigestAlgorithm == null) {
    return null;
  }
  return enums.SigningParametersDigestAlgorithm.values.firstWhereOrNull(
          (e) => e.value == signingParametersDigestAlgorithm) ??
      defaultValue;
}

String signingParametersDigestAlgorithmExplodedListToJson(
    List<enums.SigningParametersDigestAlgorithm>?
        signingParametersDigestAlgorithm) {
  return signingParametersDigestAlgorithm?.map((e) => e.value!).join(',') ?? '';
}

List<String> signingParametersDigestAlgorithmListToJson(
    List<enums.SigningParametersDigestAlgorithm>?
        signingParametersDigestAlgorithm) {
  if (signingParametersDigestAlgorithm == null) {
    return [];
  }

  return signingParametersDigestAlgorithm.map((e) => e.value!).toList();
}

List<enums.SigningParametersDigestAlgorithm>
    signingParametersDigestAlgorithmListFromJson(
  List? signingParametersDigestAlgorithm, [
  List<enums.SigningParametersDigestAlgorithm>? defaultValue,
]) {
  if (signingParametersDigestAlgorithm == null) {
    return defaultValue ?? [];
  }

  return signingParametersDigestAlgorithm
      .map((e) => signingParametersDigestAlgorithmFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersDigestAlgorithm>?
    signingParametersDigestAlgorithmNullableListFromJson(
  List? signingParametersDigestAlgorithm, [
  List<enums.SigningParametersDigestAlgorithm>? defaultValue,
]) {
  if (signingParametersDigestAlgorithm == null) {
    return defaultValue;
  }

  return signingParametersDigestAlgorithm
      .map((e) => signingParametersDigestAlgorithmFromJson(e.toString()))
      .toList();
}

String? signingParametersInfoCanonicalizationNullableToJson(
    enums.SigningParametersInfoCanonicalization?
        signingParametersInfoCanonicalization) {
  return signingParametersInfoCanonicalization?.value;
}

String? signingParametersInfoCanonicalizationToJson(
    enums.SigningParametersInfoCanonicalization
        signingParametersInfoCanonicalization) {
  return signingParametersInfoCanonicalization.value;
}

enums.SigningParametersInfoCanonicalization
    signingParametersInfoCanonicalizationFromJson(
  Object? signingParametersInfoCanonicalization, [
  enums.SigningParametersInfoCanonicalization? defaultValue,
]) {
  return enums.SigningParametersInfoCanonicalization.values.firstWhereOrNull(
          (e) => e.value == signingParametersInfoCanonicalization) ??
      defaultValue ??
      enums.SigningParametersInfoCanonicalization.swaggerGeneratedUnknown;
}

enums.SigningParametersInfoCanonicalization?
    signingParametersInfoCanonicalizationNullableFromJson(
  Object? signingParametersInfoCanonicalization, [
  enums.SigningParametersInfoCanonicalization? defaultValue,
]) {
  if (signingParametersInfoCanonicalization == null) {
    return null;
  }
  return enums.SigningParametersInfoCanonicalization.values.firstWhereOrNull(
          (e) => e.value == signingParametersInfoCanonicalization) ??
      defaultValue;
}

String signingParametersInfoCanonicalizationExplodedListToJson(
    List<enums.SigningParametersInfoCanonicalization>?
        signingParametersInfoCanonicalization) {
  return signingParametersInfoCanonicalization
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> signingParametersInfoCanonicalizationListToJson(
    List<enums.SigningParametersInfoCanonicalization>?
        signingParametersInfoCanonicalization) {
  if (signingParametersInfoCanonicalization == null) {
    return [];
  }

  return signingParametersInfoCanonicalization.map((e) => e.value!).toList();
}

List<enums.SigningParametersInfoCanonicalization>
    signingParametersInfoCanonicalizationListFromJson(
  List? signingParametersInfoCanonicalization, [
  List<enums.SigningParametersInfoCanonicalization>? defaultValue,
]) {
  if (signingParametersInfoCanonicalization == null) {
    return defaultValue ?? [];
  }

  return signingParametersInfoCanonicalization
      .map((e) => signingParametersInfoCanonicalizationFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersInfoCanonicalization>?
    signingParametersInfoCanonicalizationNullableListFromJson(
  List? signingParametersInfoCanonicalization, [
  List<enums.SigningParametersInfoCanonicalization>? defaultValue,
]) {
  if (signingParametersInfoCanonicalization == null) {
    return defaultValue;
  }

  return signingParametersInfoCanonicalization
      .map((e) => signingParametersInfoCanonicalizationFromJson(e.toString()))
      .toList();
}

String? signingParametersPropertiesCanonicalizationNullableToJson(
    enums.SigningParametersPropertiesCanonicalization?
        signingParametersPropertiesCanonicalization) {
  return signingParametersPropertiesCanonicalization?.value;
}

String? signingParametersPropertiesCanonicalizationToJson(
    enums.SigningParametersPropertiesCanonicalization
        signingParametersPropertiesCanonicalization) {
  return signingParametersPropertiesCanonicalization.value;
}

enums.SigningParametersPropertiesCanonicalization
    signingParametersPropertiesCanonicalizationFromJson(
  Object? signingParametersPropertiesCanonicalization, [
  enums.SigningParametersPropertiesCanonicalization? defaultValue,
]) {
  return enums.SigningParametersPropertiesCanonicalization.values
          .firstWhereOrNull(
              (e) => e.value == signingParametersPropertiesCanonicalization) ??
      defaultValue ??
      enums.SigningParametersPropertiesCanonicalization.swaggerGeneratedUnknown;
}

enums.SigningParametersPropertiesCanonicalization?
    signingParametersPropertiesCanonicalizationNullableFromJson(
  Object? signingParametersPropertiesCanonicalization, [
  enums.SigningParametersPropertiesCanonicalization? defaultValue,
]) {
  if (signingParametersPropertiesCanonicalization == null) {
    return null;
  }
  return enums.SigningParametersPropertiesCanonicalization.values
          .firstWhereOrNull(
              (e) => e.value == signingParametersPropertiesCanonicalization) ??
      defaultValue;
}

String signingParametersPropertiesCanonicalizationExplodedListToJson(
    List<enums.SigningParametersPropertiesCanonicalization>?
        signingParametersPropertiesCanonicalization) {
  return signingParametersPropertiesCanonicalization
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> signingParametersPropertiesCanonicalizationListToJson(
    List<enums.SigningParametersPropertiesCanonicalization>?
        signingParametersPropertiesCanonicalization) {
  if (signingParametersPropertiesCanonicalization == null) {
    return [];
  }

  return signingParametersPropertiesCanonicalization
      .map((e) => e.value!)
      .toList();
}

List<enums.SigningParametersPropertiesCanonicalization>
    signingParametersPropertiesCanonicalizationListFromJson(
  List? signingParametersPropertiesCanonicalization, [
  List<enums.SigningParametersPropertiesCanonicalization>? defaultValue,
]) {
  if (signingParametersPropertiesCanonicalization == null) {
    return defaultValue ?? [];
  }

  return signingParametersPropertiesCanonicalization
      .map((e) =>
          signingParametersPropertiesCanonicalizationFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersPropertiesCanonicalization>?
    signingParametersPropertiesCanonicalizationNullableListFromJson(
  List? signingParametersPropertiesCanonicalization, [
  List<enums.SigningParametersPropertiesCanonicalization>? defaultValue,
]) {
  if (signingParametersPropertiesCanonicalization == null) {
    return defaultValue;
  }

  return signingParametersPropertiesCanonicalization
      .map((e) =>
          signingParametersPropertiesCanonicalizationFromJson(e.toString()))
      .toList();
}

String? signingParametersKeyInfoCanonicalizationNullableToJson(
    enums.SigningParametersKeyInfoCanonicalization?
        signingParametersKeyInfoCanonicalization) {
  return signingParametersKeyInfoCanonicalization?.value;
}

String? signingParametersKeyInfoCanonicalizationToJson(
    enums.SigningParametersKeyInfoCanonicalization
        signingParametersKeyInfoCanonicalization) {
  return signingParametersKeyInfoCanonicalization.value;
}

enums.SigningParametersKeyInfoCanonicalization
    signingParametersKeyInfoCanonicalizationFromJson(
  Object? signingParametersKeyInfoCanonicalization, [
  enums.SigningParametersKeyInfoCanonicalization? defaultValue,
]) {
  return enums.SigningParametersKeyInfoCanonicalization.values.firstWhereOrNull(
          (e) => e.value == signingParametersKeyInfoCanonicalization) ??
      defaultValue ??
      enums.SigningParametersKeyInfoCanonicalization.swaggerGeneratedUnknown;
}

enums.SigningParametersKeyInfoCanonicalization?
    signingParametersKeyInfoCanonicalizationNullableFromJson(
  Object? signingParametersKeyInfoCanonicalization, [
  enums.SigningParametersKeyInfoCanonicalization? defaultValue,
]) {
  if (signingParametersKeyInfoCanonicalization == null) {
    return null;
  }
  return enums.SigningParametersKeyInfoCanonicalization.values.firstWhereOrNull(
          (e) => e.value == signingParametersKeyInfoCanonicalization) ??
      defaultValue;
}

String signingParametersKeyInfoCanonicalizationExplodedListToJson(
    List<enums.SigningParametersKeyInfoCanonicalization>?
        signingParametersKeyInfoCanonicalization) {
  return signingParametersKeyInfoCanonicalization
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> signingParametersKeyInfoCanonicalizationListToJson(
    List<enums.SigningParametersKeyInfoCanonicalization>?
        signingParametersKeyInfoCanonicalization) {
  if (signingParametersKeyInfoCanonicalization == null) {
    return [];
  }

  return signingParametersKeyInfoCanonicalization.map((e) => e.value!).toList();
}

List<enums.SigningParametersKeyInfoCanonicalization>
    signingParametersKeyInfoCanonicalizationListFromJson(
  List? signingParametersKeyInfoCanonicalization, [
  List<enums.SigningParametersKeyInfoCanonicalization>? defaultValue,
]) {
  if (signingParametersKeyInfoCanonicalization == null) {
    return defaultValue ?? [];
  }

  return signingParametersKeyInfoCanonicalization
      .map(
          (e) => signingParametersKeyInfoCanonicalizationFromJson(e.toString()))
      .toList();
}

List<enums.SigningParametersKeyInfoCanonicalization>?
    signingParametersKeyInfoCanonicalizationNullableListFromJson(
  List? signingParametersKeyInfoCanonicalization, [
  List<enums.SigningParametersKeyInfoCanonicalization>? defaultValue,
]) {
  if (signingParametersKeyInfoCanonicalization == null) {
    return defaultValue;
  }

  return signingParametersKeyInfoCanonicalization
      .map(
          (e) => signingParametersKeyInfoCanonicalizationFromJson(e.toString()))
      .toList();
}

String?
    signingParametersTransformationMediaDestinationTypeDescriptionNullableToJson(
        enums.SigningParametersTransformationMediaDestinationTypeDescription?
            signingParametersTransformationMediaDestinationTypeDescription) {
  return signingParametersTransformationMediaDestinationTypeDescription?.value;
}

String? signingParametersTransformationMediaDestinationTypeDescriptionToJson(
    enums.SigningParametersTransformationMediaDestinationTypeDescription
        signingParametersTransformationMediaDestinationTypeDescription) {
  return signingParametersTransformationMediaDestinationTypeDescription.value;
}

enums.SigningParametersTransformationMediaDestinationTypeDescription
    signingParametersTransformationMediaDestinationTypeDescriptionFromJson(
  Object? signingParametersTransformationMediaDestinationTypeDescription, [
  enums.SigningParametersTransformationMediaDestinationTypeDescription?
      defaultValue,
]) {
  return enums
          .SigningParametersTransformationMediaDestinationTypeDescription.values
          .firstWhereOrNull((e) =>
              e.value ==
              signingParametersTransformationMediaDestinationTypeDescription) ??
      defaultValue ??
      enums.SigningParametersTransformationMediaDestinationTypeDescription
          .swaggerGeneratedUnknown;
}

enums.SigningParametersTransformationMediaDestinationTypeDescription?
    signingParametersTransformationMediaDestinationTypeDescriptionNullableFromJson(
  Object? signingParametersTransformationMediaDestinationTypeDescription, [
  enums.SigningParametersTransformationMediaDestinationTypeDescription?
      defaultValue,
]) {
  if (signingParametersTransformationMediaDestinationTypeDescription == null) {
    return null;
  }
  return enums
          .SigningParametersTransformationMediaDestinationTypeDescription.values
          .firstWhereOrNull((e) =>
              e.value ==
              signingParametersTransformationMediaDestinationTypeDescription) ??
      defaultValue;
}

String
    signingParametersTransformationMediaDestinationTypeDescriptionExplodedListToJson(
        List<
                enums
                .SigningParametersTransformationMediaDestinationTypeDescription>?
            signingParametersTransformationMediaDestinationTypeDescription) {
  return signingParametersTransformationMediaDestinationTypeDescription
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    signingParametersTransformationMediaDestinationTypeDescriptionListToJson(
        List<
                enums
                .SigningParametersTransformationMediaDestinationTypeDescription>?
            signingParametersTransformationMediaDestinationTypeDescription) {
  if (signingParametersTransformationMediaDestinationTypeDescription == null) {
    return [];
  }

  return signingParametersTransformationMediaDestinationTypeDescription
      .map((e) => e.value!)
      .toList();
}

List<enums.SigningParametersTransformationMediaDestinationTypeDescription>
    signingParametersTransformationMediaDestinationTypeDescriptionListFromJson(
  List? signingParametersTransformationMediaDestinationTypeDescription, [
  List<enums.SigningParametersTransformationMediaDestinationTypeDescription>?
      defaultValue,
]) {
  if (signingParametersTransformationMediaDestinationTypeDescription == null) {
    return defaultValue ?? [];
  }

  return signingParametersTransformationMediaDestinationTypeDescription
      .map((e) =>
          signingParametersTransformationMediaDestinationTypeDescriptionFromJson(
              e.toString()))
      .toList();
}

List<enums.SigningParametersTransformationMediaDestinationTypeDescription>?
    signingParametersTransformationMediaDestinationTypeDescriptionNullableListFromJson(
  List? signingParametersTransformationMediaDestinationTypeDescription, [
  List<enums.SigningParametersTransformationMediaDestinationTypeDescription>?
      defaultValue,
]) {
  if (signingParametersTransformationMediaDestinationTypeDescription == null) {
    return defaultValue;
  }

  return signingParametersTransformationMediaDestinationTypeDescription
      .map((e) =>
          signingParametersTransformationMediaDestinationTypeDescriptionFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBodyContainerTypeNullableToJson(
    enums.DocumentValidationResponseBodyContainerType?
        documentValidationResponseBodyContainerType) {
  return documentValidationResponseBodyContainerType?.value;
}

String? documentValidationResponseBodyContainerTypeToJson(
    enums.DocumentValidationResponseBodyContainerType
        documentValidationResponseBodyContainerType) {
  return documentValidationResponseBodyContainerType.value;
}

enums.DocumentValidationResponseBodyContainerType
    documentValidationResponseBodyContainerTypeFromJson(
  Object? documentValidationResponseBodyContainerType, [
  enums.DocumentValidationResponseBodyContainerType? defaultValue,
]) {
  return enums.DocumentValidationResponseBodyContainerType.values
          .firstWhereOrNull(
              (e) => e.value == documentValidationResponseBodyContainerType) ??
      defaultValue ??
      enums.DocumentValidationResponseBodyContainerType.swaggerGeneratedUnknown;
}

enums.DocumentValidationResponseBodyContainerType?
    documentValidationResponseBodyContainerTypeNullableFromJson(
  Object? documentValidationResponseBodyContainerType, [
  enums.DocumentValidationResponseBodyContainerType? defaultValue,
]) {
  if (documentValidationResponseBodyContainerType == null) {
    return null;
  }
  return enums.DocumentValidationResponseBodyContainerType.values
          .firstWhereOrNull(
              (e) => e.value == documentValidationResponseBodyContainerType) ??
      defaultValue;
}

String documentValidationResponseBodyContainerTypeExplodedListToJson(
    List<enums.DocumentValidationResponseBodyContainerType>?
        documentValidationResponseBodyContainerType) {
  return documentValidationResponseBodyContainerType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> documentValidationResponseBodyContainerTypeListToJson(
    List<enums.DocumentValidationResponseBodyContainerType>?
        documentValidationResponseBodyContainerType) {
  if (documentValidationResponseBodyContainerType == null) {
    return [];
  }

  return documentValidationResponseBodyContainerType
      .map((e) => e.value!)
      .toList();
}

List<enums.DocumentValidationResponseBodyContainerType>
    documentValidationResponseBodyContainerTypeListFromJson(
  List? documentValidationResponseBodyContainerType, [
  List<enums.DocumentValidationResponseBodyContainerType>? defaultValue,
]) {
  if (documentValidationResponseBodyContainerType == null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBodyContainerType
      .map((e) =>
          documentValidationResponseBodyContainerTypeFromJson(e.toString()))
      .toList();
}

List<enums.DocumentValidationResponseBodyContainerType>?
    documentValidationResponseBodyContainerTypeNullableListFromJson(
  List? documentValidationResponseBodyContainerType, [
  List<enums.DocumentValidationResponseBodyContainerType>? defaultValue,
]) {
  if (documentValidationResponseBodyContainerType == null) {
    return defaultValue;
  }

  return documentValidationResponseBodyContainerType
      .map((e) =>
          documentValidationResponseBodyContainerTypeFromJson(e.toString()))
      .toList();
}

String? documentValidationResponseBodySignatureFormNullableToJson(
    enums.DocumentValidationResponseBodySignatureForm?
        documentValidationResponseBodySignatureForm) {
  return documentValidationResponseBodySignatureForm?.value;
}

String? documentValidationResponseBodySignatureFormToJson(
    enums.DocumentValidationResponseBodySignatureForm
        documentValidationResponseBodySignatureForm) {
  return documentValidationResponseBodySignatureForm.value;
}

enums.DocumentValidationResponseBodySignatureForm
    documentValidationResponseBodySignatureFormFromJson(
  Object? documentValidationResponseBodySignatureForm, [
  enums.DocumentValidationResponseBodySignatureForm? defaultValue,
]) {
  return enums.DocumentValidationResponseBodySignatureForm.values
          .firstWhereOrNull(
              (e) => e.value == documentValidationResponseBodySignatureForm) ??
      defaultValue ??
      enums.DocumentValidationResponseBodySignatureForm.swaggerGeneratedUnknown;
}

enums.DocumentValidationResponseBodySignatureForm?
    documentValidationResponseBodySignatureFormNullableFromJson(
  Object? documentValidationResponseBodySignatureForm, [
  enums.DocumentValidationResponseBodySignatureForm? defaultValue,
]) {
  if (documentValidationResponseBodySignatureForm == null) {
    return null;
  }
  return enums.DocumentValidationResponseBodySignatureForm.values
          .firstWhereOrNull(
              (e) => e.value == documentValidationResponseBodySignatureForm) ??
      defaultValue;
}

String documentValidationResponseBodySignatureFormExplodedListToJson(
    List<enums.DocumentValidationResponseBodySignatureForm>?
        documentValidationResponseBodySignatureForm) {
  return documentValidationResponseBodySignatureForm
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> documentValidationResponseBodySignatureFormListToJson(
    List<enums.DocumentValidationResponseBodySignatureForm>?
        documentValidationResponseBodySignatureForm) {
  if (documentValidationResponseBodySignatureForm == null) {
    return [];
  }

  return documentValidationResponseBodySignatureForm
      .map((e) => e.value!)
      .toList();
}

List<enums.DocumentValidationResponseBodySignatureForm>
    documentValidationResponseBodySignatureFormListFromJson(
  List? documentValidationResponseBodySignatureForm, [
  List<enums.DocumentValidationResponseBodySignatureForm>? defaultValue,
]) {
  if (documentValidationResponseBodySignatureForm == null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBodySignatureForm
      .map((e) =>
          documentValidationResponseBodySignatureFormFromJson(e.toString()))
      .toList();
}

List<enums.DocumentValidationResponseBodySignatureForm>?
    documentValidationResponseBodySignatureFormNullableListFromJson(
  List? documentValidationResponseBodySignatureForm, [
  List<enums.DocumentValidationResponseBodySignatureForm>? defaultValue,
]) {
  if (documentValidationResponseBodySignatureForm == null) {
    return defaultValue;
  }

  return documentValidationResponseBodySignatureForm
      .map((e) =>
          documentValidationResponseBodySignatureFormFromJson(e.toString()))
      .toList();
}

String?
    documentValidationResponseBody$Signatures$ItemValidationResultNullableToJson(
        enums.DocumentValidationResponseBody$Signatures$ItemValidationResult?
            documentValidationResponseBody$Signatures$ItemValidationResult) {
  return documentValidationResponseBody$Signatures$ItemValidationResult?.value;
}

String? documentValidationResponseBody$Signatures$ItemValidationResultToJson(
    enums.DocumentValidationResponseBody$Signatures$ItemValidationResult
        documentValidationResponseBody$Signatures$ItemValidationResult) {
  return documentValidationResponseBody$Signatures$ItemValidationResult.value;
}

enums.DocumentValidationResponseBody$Signatures$ItemValidationResult
    documentValidationResponseBody$Signatures$ItemValidationResultFromJson(
  Object? documentValidationResponseBody$Signatures$ItemValidationResult, [
  enums.DocumentValidationResponseBody$Signatures$ItemValidationResult?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$ItemValidationResult.values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$ItemValidationResult) ??
      defaultValue ??
      enums.DocumentValidationResponseBody$Signatures$ItemValidationResult
          .swaggerGeneratedUnknown;
}

enums.DocumentValidationResponseBody$Signatures$ItemValidationResult?
    documentValidationResponseBody$Signatures$ItemValidationResultNullableFromJson(
  Object? documentValidationResponseBody$Signatures$ItemValidationResult, [
  enums.DocumentValidationResponseBody$Signatures$ItemValidationResult?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$ItemValidationResult == null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$ItemValidationResult.values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$ItemValidationResult) ??
      defaultValue;
}

String
    documentValidationResponseBody$Signatures$ItemValidationResultExplodedListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$ItemValidationResult>?
            documentValidationResponseBody$Signatures$ItemValidationResult) {
  return documentValidationResponseBody$Signatures$ItemValidationResult
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$ItemValidationResultListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$ItemValidationResult>?
            documentValidationResponseBody$Signatures$ItemValidationResult) {
  if (documentValidationResponseBody$Signatures$ItemValidationResult == null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$ItemValidationResult
      .map((e) => e.value!)
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$ItemValidationResult>
    documentValidationResponseBody$Signatures$ItemValidationResultListFromJson(
  List? documentValidationResponseBody$Signatures$ItemValidationResult, [
  List<enums.DocumentValidationResponseBody$Signatures$ItemValidationResult>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$ItemValidationResult == null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$ItemValidationResult
      .map((e) =>
          documentValidationResponseBody$Signatures$ItemValidationResultFromJson(
              e.toString()))
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$ItemValidationResult>?
    documentValidationResponseBody$Signatures$ItemValidationResultNullableListFromJson(
  List? documentValidationResponseBody$Signatures$ItemValidationResult, [
  List<enums.DocumentValidationResponseBody$Signatures$ItemValidationResult>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$ItemValidationResult == null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$ItemValidationResult
      .map((e) =>
          documentValidationResponseBody$Signatures$ItemValidationResultFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$ItemLevelNullableToJson(
    enums.DocumentValidationResponseBody$Signatures$ItemLevel?
        documentValidationResponseBody$Signatures$ItemLevel) {
  return documentValidationResponseBody$Signatures$ItemLevel?.value;
}

String? documentValidationResponseBody$Signatures$ItemLevelToJson(
    enums.DocumentValidationResponseBody$Signatures$ItemLevel
        documentValidationResponseBody$Signatures$ItemLevel) {
  return documentValidationResponseBody$Signatures$ItemLevel.value;
}

enums.DocumentValidationResponseBody$Signatures$ItemLevel
    documentValidationResponseBody$Signatures$ItemLevelFromJson(
  Object? documentValidationResponseBody$Signatures$ItemLevel, [
  enums.DocumentValidationResponseBody$Signatures$ItemLevel? defaultValue,
]) {
  return enums.DocumentValidationResponseBody$Signatures$ItemLevel.values
          .firstWhereOrNull((e) =>
              e.value == documentValidationResponseBody$Signatures$ItemLevel) ??
      defaultValue ??
      enums.DocumentValidationResponseBody$Signatures$ItemLevel
          .swaggerGeneratedUnknown;
}

enums.DocumentValidationResponseBody$Signatures$ItemLevel?
    documentValidationResponseBody$Signatures$ItemLevelNullableFromJson(
  Object? documentValidationResponseBody$Signatures$ItemLevel, [
  enums.DocumentValidationResponseBody$Signatures$ItemLevel? defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$ItemLevel == null) {
    return null;
  }
  return enums.DocumentValidationResponseBody$Signatures$ItemLevel.values
          .firstWhereOrNull((e) =>
              e.value == documentValidationResponseBody$Signatures$ItemLevel) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$ItemLevelExplodedListToJson(
    List<enums.DocumentValidationResponseBody$Signatures$ItemLevel>?
        documentValidationResponseBody$Signatures$ItemLevel) {
  return documentValidationResponseBody$Signatures$ItemLevel
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> documentValidationResponseBody$Signatures$ItemLevelListToJson(
    List<enums.DocumentValidationResponseBody$Signatures$ItemLevel>?
        documentValidationResponseBody$Signatures$ItemLevel) {
  if (documentValidationResponseBody$Signatures$ItemLevel == null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$ItemLevel
      .map((e) => e.value!)
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$ItemLevel>
    documentValidationResponseBody$Signatures$ItemLevelListFromJson(
  List? documentValidationResponseBody$Signatures$ItemLevel, [
  List<enums.DocumentValidationResponseBody$Signatures$ItemLevel>? defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$ItemLevel == null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$ItemLevel
      .map((e) => documentValidationResponseBody$Signatures$ItemLevelFromJson(
          e.toString()))
      .toList();
}

List<enums.DocumentValidationResponseBody$Signatures$ItemLevel>?
    documentValidationResponseBody$Signatures$ItemLevelNullableListFromJson(
  List? documentValidationResponseBody$Signatures$ItemLevel, [
  List<enums.DocumentValidationResponseBody$Signatures$ItemLevel>? defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$ItemLevel == null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$ItemLevel
      .map((e) => documentValidationResponseBody$Signatures$ItemLevelFromJson(
          e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification?
        documentValidationResponseBody$Signatures$Item$SigningCertificateQualification) {
  return documentValidationResponseBody$Signatures$Item$SigningCertificateQualification
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification
        documentValidationResponseBody$Signatures$Item$SigningCertificateQualification) {
  return documentValidationResponseBody$Signatures$Item$SigningCertificateQualification
      .value;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification
    documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SigningCertificateQualification, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SigningCertificateQualification) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification?
    documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$SigningCertificateQualification, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SigningCertificateQualification ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$SigningCertificateQualification) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification>?
        documentValidationResponseBody$Signatures$Item$SigningCertificateQualification) {
  return documentValidationResponseBody$Signatures$Item$SigningCertificateQualification
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification>?
            documentValidationResponseBody$Signatures$Item$SigningCertificateQualification) {
  if (documentValidationResponseBody$Signatures$Item$SigningCertificateQualification ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$SigningCertificateQualification
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification>
    documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SigningCertificateQualification, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SigningCertificateQualification ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$SigningCertificateQualification
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification>?
    documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$SigningCertificateQualification, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$SigningCertificateQualification>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$SigningCertificateQualification ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$SigningCertificateQualification
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$SigningCertificateQualificationFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification?
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification) {
  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification) {
  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
      .value;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification?
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification>?
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification) {
  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification>?
            documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification>
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification>?
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualification
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$Timestamps$ItemQualificationFromJson(
              e.toString()))
      .toList();
}

String? documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeNullableToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType?
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType) {
  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
      ?.value;
}

String? documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeToJson(
    enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType) {
  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
      .value;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType?
      defaultValue,
]) {
  return enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType) ??
      defaultValue ??
      enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
          .swaggerGeneratedUnknown;
}

enums
    .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType?
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeNullableFromJson(
  Object?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType, [
  enums
      .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType ==
      null) {
    return null;
  }
  return enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
          .values
          .firstWhereOrNull((e) =>
              e.value ==
              documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType) ??
      defaultValue;
}

String documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeExplodedListToJson(
    List<
            enums
            .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType>?
        documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType) {
  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String>
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeListToJson(
        List<
                enums
                .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType>?
            documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType ==
      null) {
    return [];
  }

  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
      .map((e) => e.value!)
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType>
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType ==
      null) {
    return defaultValue ?? [];
  }

  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeFromJson(
              e.toString()))
      .toList();
}

List<
        enums
        .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType>?
    documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeNullableListFromJson(
  List?
      documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType, [
  List<
          enums
          .DocumentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType>?
      defaultValue,
]) {
  if (documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType ==
      null) {
    return defaultValue;
  }

  return documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampType
      .map((e) =>
          documentValidationResponseBody$Signatures$Item$Timestamps$ItemTimestampTypeFromJson(
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
