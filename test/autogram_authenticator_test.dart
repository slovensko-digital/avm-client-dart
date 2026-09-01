import 'package:autogram_sign/autogram_sign.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' show MockClient;
import 'package:test/test.dart';

/// Tests for [AutogramAuthenticator].
///
/// The interceptor is wired the same way [AutogramService] wires it, so these
/// cover the whole path from [Autogram.create] down to the outgoing request.
void main() {
  group('AutogramAuthenticator', () {
    /// Sends [requestCount] requests through an [Autogram] client using
    /// [encryptionKeySource] and returns the captured outgoing requests.
    Future<List<http.BaseRequest>> sendRequests(
      String Function() encryptionKeySource, {
      int requestCount = 1,
    }) async {
      final requests = <http.BaseRequest>[];

      final autogram = Autogram.create(
        baseUrl: Uri.parse('https://example.test/api/v1'),
        httpClient: MockClient((request) async {
          requests.add(request);

          return http.Response('', 204);
        }),
        interceptors: [
          AutogramAuthenticator(encryptionKeySource),
        ],
      );

      for (var i = 0; i < requestCount; i++) {
        await autogram.documentsGuidDelete(guid: 'some-document-guid');
      }

      return requests;
    }

    test('sets the X-Encryption-Key header', () async {
      final requests = await sendRequests(() => 'test-encryption-key');

      expect(requests, hasLength(1));
      expect(requests.single.headers['X-Encryption-Key'],
          'test-encryption-key');
    });

    test('sets the Accept header to application/json', () async {
      final requests = await sendRequests(() => 'test-encryption-key');

      expect(requests.single.headers['Accept'], 'application/json');
    });

    test('re-evaluates the encryption key on every request', () async {
      // This is why AutogramAuthenticator overrides intercept instead of
      // passing a static header map to HeadersInterceptor.
      var counter = 0;
      final requests = await sendRequests(
        () => 'key-${counter++}',
        requestCount: 3,
      );

      expect(
        requests.map((request) => request.headers['X-Encryption-Key']),
        ['key-0', 'key-1', 'key-2'],
      );
    });
  });
}
