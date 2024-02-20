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
  Future<Response<DocumentsPost$Response>> _documentsPost(
      {required DocumentPostRequestBody? body}) {
    final Uri $url = Uri.parse('/documents');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<DocumentsPost$Response, DocumentsPost$Response>($request);
  }

  @override
  Future<Response<GetDocumentResponse>> _documentsGuidGet({
    required String? guid,
    String? ifModifiedSince,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}');
    final Map<String, String> $headers = {
      if (ifModifiedSince != null) 'If-Modified-Since': ifModifiedSince,
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
  Future<Response<DocumentsGuidVisualizationGet$Response>>
      _documentsGuidVisualizationGet({required String? guid}) {
    final Uri $url = Uri.parse('/documents/${guid}/visualization');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DocumentsGuidVisualizationGet$Response,
        DocumentsGuidVisualizationGet$Response>($request);
  }

  @override
  Future<Response<DataToSignStructure>> _documentsGuidDatatosignPost({
    required String? guid,
    required DocumentsGuidDatatosignPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}/datatosign');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<DataToSignStructure, DataToSignStructure>($request);
  }

  @override
  Future<Response<dynamic>> _documentsGuidSignPost({
    required String? guid,
    bool? returnSignedDocument,
    required SignRequestBody? body,
  }) {
    final Uri $url = Uri.parse('/documents/${guid}/sign');
    final Map<String, dynamic> $params = <String, dynamic>{
      'returnSignedDocument': returnSignedDocument
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
