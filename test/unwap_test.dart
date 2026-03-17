import 'package:autogram_sign/src/response_functions.dart' show unwrap;
import 'package:autogram_sign/src/service_exception.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

/// Tests for [unwrap] function.
void main() {
  group('unwrap(Response<BodyType>)', () {
    test('unwrap returns value for 200 status code', () {
      final httpResponse = http.Response('"Test"', 200);
      final response = chopper.Response<String>(httpResponse, "Test");
      final actual = unwrap(response);

      expect(actual, "Test");
    });

    test('unwrap returns nullable value for 200 status code', () {
      final httpResponse = http.Response('"Test"', 200);
      final response = chopper.Response<String?>(httpResponse, "Test");
      final actual = unwrap(response);

      expect(actual, "Test");
    });

    test('unwrap returns nothing for 204 status code with no body', () {
      final httpResponse = http.Response('', 204);
      final response = chopper.Response<dynamic>(httpResponse, null);
      final actual = unwrap(response);

      expect(actual, null);
    });

    test('unwrap throws ServiceException for 404 status code', () {
      final httpResponse = http.Response('', 404);
      final response = chopper.Response<dynamic>(httpResponse, null);

      expect(
        () => unwrap(response),
        throwsA(
          predicate((e) => e is ServiceException && e.statusCode == 404),
        ),
      );
    });

    test('unwrap throws ServiceException for other error status code', () {
      final httpResponse = http.Response('', 503);
      final response = chopper.Response<dynamic>(httpResponse, null);

      expect(
        () => unwrap(response),
        throwsA(
          predicate(
            (e) => e is ServiceException && e.statusCode == 503,
          ),
        ),
      );
    });

    test('unwrap throws ServiceException with details deserialized', () {
      final json = """
{
  "code": "UNPROCESSABLE_INPUT",
  "message": "IllegalArgumentException parsing request body",
  "details": "Document must be a PDF when using PAdES."
}"""
          .trim();
      final httpResponse = http.Response(json, 422);
      final response = chopper.Response<dynamic>(
        httpResponse,
        null,
        error: httpResponse.body,
      );

      expect(
        () => unwrap(response),
        throwsA(
          predicate(
            (e) =>
                e is ServiceException &&
                e.statusCode == 422 &&
                e.message == "IllegalArgumentException parsing request body" &&
                e.errorCode == "UNPROCESSABLE_INPUT" &&
                e.details == "Document must be a PDF when using PAdES.",
          ),
        ),
      );
    });

    test(
        'unwrap throws ServiceException without details when it\'s different structure',
        () {
      final json = """
{
  "error": "Fatal error"
}"""
          .trim();
      final httpResponse = http.Response(json, 422);
      final response = chopper.Response<dynamic>(
        httpResponse,
        null,
        error: httpResponse.body,
      );

      expect(
        () => unwrap(response),
        throwsA(
          predicate(
            (e) =>
                e is ServiceException &&
                e.statusCode == 422 &&
                e.message.contains("Fatal error") &&
                e.errorCode == null &&
                e.details == null,
          ),
        ),
      );
    });

    test('unwrap throws ServiceException and does not crash for malformed JSON',
        () {
      final json = """
{
<<
}"""
          .trim();
      final httpResponse = http.Response(json, 500);
      final response = chopper.Response<dynamic>(
        httpResponse,
        null,
        error: httpResponse.body,
      );

      expect(
        () => unwrap(response),
        throwsA(
          predicate(
            (e) =>
                e is ServiceException &&
                e.statusCode == 500 &&
                e.errorCode == null &&
                e.details == null,
          ),
        ),
      );
    });
  });
}
