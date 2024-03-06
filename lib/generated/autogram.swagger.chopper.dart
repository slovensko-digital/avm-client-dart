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
  Future<Response<DocumentsPost$Response>> _documentsPost({
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
        .send<DocumentsPost$Response, DocumentsPost$Response>($request);
  }

  @override
  Future<Response<GetDocumentResponse>> _documentsGuidGet({
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
    return client.send<GetDocumentResponse, GetDocumentResponse>($request);
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
  Future<Response<VisualizationResponse>> _documentsGuidVisualizationGet({
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
    return client.send<VisualizationResponse, VisualizationResponse>($request);
  }

  @override
  Future<Response<DataToSignStructure>> _documentsGuidDatatosignPost({
    required String? guid,
    String? accept,
    required DocumentsGuidDatatosignPost$RequestBody? body,
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
  Future<Response<SignDocumentResponse>> _documentsGuidSignPost({
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
    return client.send<SignDocumentResponse, SignDocumentResponse>($request);
  }
}
