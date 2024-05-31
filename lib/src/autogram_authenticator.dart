import 'package:basic_utils/basic_utils.dart' show PrivateKey;
import 'package:chopper/chopper.dart'
    show HeadersInterceptor, Request, applyHeaders;

/// Sets the authorization header:
///  - "X-Encryption-Key: [encryptionKeySource] value" OR
///  - "Authorization: Bearer JWT signed by [deviceKeySource]"
///
/// Also sets "Accept: application/json" value.
class AutogramAuthenticator extends HeadersInterceptor {
  final String Function() encryptionKeySource;
  final Future<PrivateKey> Function() deviceKeySource;

  AutogramAuthenticator({
    required this.encryptionKeySource,
    required this.deviceKeySource,
  }) : super(const {});

  @override
  Future<Request> onRequest(Request request) async {
    final encryptionKey = encryptionKeySource();
    final allHeaders = {
      "Accept": "application/json",
      "X-Encryption-Key": encryptionKey,
    };

    if (request.method == 'POST' &&
        request.uri.path == '/device-integrations') {
      // TODO Set "Authorization: Bearer token
      // JWT:
      // - sub je tvoje deviceId, čo dostaneš pri registrácii
      // - jti je random UUID
      // - exp je now + 5min
      //allHeaders["Authorization"] = "Bearer XXX";
    }

    return applyHeaders(request, allHeaders);
  }
}
