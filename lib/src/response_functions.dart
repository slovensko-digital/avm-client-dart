import 'package:chopper/chopper.dart' show Response;

import 'service_exception.dart';

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

  // TODO Impl. deserialization of JSON data:
  // code: String - it's enum, e.g. InvalidSignatureErrorResponseBodyCode
  // message: String
  // details: String?

  throw ServiceException(statusCode, error.toString());
}
