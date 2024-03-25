import 'dart:convert' show jsonDecode;
import 'dart:developer' as developer;

import 'package:chopper/chopper.dart' show Response;

import 'service_exception.dart';

/// Unwraps the [Response.body] and:
///  - returns its data cast to [BodyType] if was [Response.isSuccessful];
///  - throws [ServiceException] otherwise.
BodyType unwrap<BodyType>(Response<BodyType> response) {
  if (response.isSuccessful) {
    return response.body as BodyType;
  }

  final error = response.error;
  final statusCode = response.statusCode;

  if (error is String) {
    if (error.startsWith("{") && error.endsWith("}")) {
      dynamic errorJson;

      try {
        errorJson = jsonDecode(error);
      } catch (error, stackTrace) {
        developer.log(
          "Error occurred when deserializing error JSON.",
          error: error,
          stackTrace: stackTrace,
        );
      }

      if (errorJson is Map<String, dynamic>) {
        // code: String - it's enum specific to API call and status code, e.g. EncryptionKeyMismatchErrorResponseBodyCode
        // message: String
        // details: String?

        final message = errorJson["message"]?.toString();

        if (message != null) {
          final errorCode = errorJson["code"]?.toString();
          final details = errorJson["details"]?.toString();

          throw ServiceException(
            statusCode: statusCode,
            message: message,
            errorCode: errorCode,
            details: details,
          );
        }
      }
    }
  }

  throw ServiceException(
    statusCode: statusCode,
    message: error.toString(),
  );
}
