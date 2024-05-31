// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autogram.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Autogram extends Autogram {
  _$Autogram([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Autogram;

  @override
  Future<Response<CreateDocumentResponseBody>> _documentsPost({
    String? accept,
    required DocumentPostRequestBody? body,
  }) {
    final Uri $url = Uri.parse('/documents');
    final Map<String, String> $headers = {
      if (accept != null) 'Accept': accept,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client
        .send<CreateDocumentResponseBody, CreateDocumentResponseBody>($request);
  }

  @override
  Future<Response<GetDocumentResponseBody>> _documentsGuidGet({
    required String? guid,
    String? ifModifiedSince,
    String? accept,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}');
    final Map<String, String> $headers = {
      if (ifModifiedSince != null) 'If-Modified-Since': ifModifiedSince,
      if (accept != null) 'Accept': accept,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<GetDocumentResponseBody, GetDocumentResponseBody>($request);
  }

  @override
  Future<Response<dynamic>> _documentsGuidDelete({required String? guid}) {
    final Uri $url = Uri.parse('/documents/${guid}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<DocumentVisualizationResponseBody>>
      _documentsGuidVisualizationGet({
    required String? guid,
    String? accept,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}/visualization');
    final Map<String, String> $headers = {
      if (accept != null) 'Accept': accept,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<DocumentVisualizationResponseBody,
        DocumentVisualizationResponseBody>($request);
  }

  @override
  Future<Response<SigningParameters>> _documentsGuidParametersGet({
    required String? guid,
    String? accept,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}/parameters');
    final Map<String, String> $headers = {
      if (accept != null) 'Accept': accept,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<SigningParameters, SigningParameters>($request);
  }

  @override
  Future<Response<DocumentValidationResponseBody>> _documentsGuidValidationGet({
    required String? guid,
    String? accept,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}/validation');
    final Map<String, String> $headers = {
      if (accept != null) 'Accept': accept,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<DocumentValidationResponseBody,
        DocumentValidationResponseBody>($request);
  }

  @override
  Future<Response<DataToSignStructure>> _documentsGuidDatatosignPost({
    required String? guid,
    String? accept,
    required DataToSignRequestBody? body,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}/datatosign');
    final Map<String, String> $headers = {
      if (accept != null) 'Accept': accept,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<DataToSignStructure, DataToSignStructure>($request);
  }

  @override
  Future<Response<SignDocumentResponseBody>> _documentsGuidSignPost({
    required String? guid,
    bool? returnSignedDocument,
    String? accept,
    required SignRequestBody? body,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}/sign');
    final Map<String, dynamic> $params = <String, dynamic>{
      'returnSignedDocument': returnSignedDocument
    };
    final Map<String, String> $headers = {
      if (accept != null) 'Accept': accept,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<SignDocumentResponseBody, SignDocumentResponseBody>($request);
  }

  @override
  Future<Response<PostIntegrationResponse>> _integrationsPost(
      {required PostIntegrationRequestBody? body}) {
    final Uri $url = Uri.parse('/integrations');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<PostIntegrationResponse, PostIntegrationResponse>($request);
  }

  @override
  Future<Response<PostDeviceResponse>> _devicesPost(
      {required PostDeviceRequestBody? body}) {
    final Uri $url = Uri.parse('/devices');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PostDeviceResponse, PostDeviceResponse>($request);
  }

  @override
  Future<Response<dynamic>> _deviceIntegrationsPost(
      {required PostDeviceIntegrationsRequestBody? body}) {
    final Uri $url = Uri.parse('/device-integrations');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<GetDeviceIntegrationsResponseBody$Item>>>
      _deviceIntegrationsGet() {
    final Uri $url = Uri.parse('/device-integrations');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<GetDeviceIntegrationsResponseBody$Item>,
        GetDeviceIntegrationsResponseBody$Item>($request);
  }

  @override
  Future<Response<dynamic>> _deviceIntegrationsIntegrationIdDelete(
      {required String? integrationId}) {
    final Uri $url = Uri.parse('/device-integrations/${integrationId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<GetIntegrationDevicesResponseBody$Item>>>
      _integrationDevicesGet() {
    final Uri $url = Uri.parse('/integration-devices');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<GetIntegrationDevicesResponseBody$Item>,
        GetIntegrationDevicesResponseBody$Item>($request);
  }

  @override
  Future<Response<dynamic>> _integrationDevicesDeviceIdDelete(
      {required String? deviceId}) {
    final Uri $url = Uri.parse('/integration-devices/${deviceId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _signRequestPost(
      {required PostSignRequestBody? body}) {
    final Uri $url = Uri.parse('/sign-request');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _qrCodeGet({
    required String? guid,
    required String? key,
    String? pushkey,
    String? integration,
  }) {
    final Uri $url = Uri.parse('/qr-code');
    final Map<String, dynamic> $params = <String, dynamic>{
      'guid': guid,
      'key': key,
      'pushkey': pushkey,
      'integration': integration,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
