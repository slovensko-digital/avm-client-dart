import 'dart:convert';

import 'package:autogram_sign/service_exception.dart';
import 'package:chopper/chopper.dart' show Response;

/// Unwraps the [Response.body] and:
///  - returns its data if was successful;
///  - throws [ServiceException] possibly with [SerializableError] otherwise.
BodyType unwrap<BodyType>(Response<BodyType> response) {
  if (response.isSuccessful) {
    return response.body as BodyType;
  }

  // Error branch
  final error = response.error;
  final statusCode = response.statusCode;

  throw ServiceException(statusCode, error.toString());
}
