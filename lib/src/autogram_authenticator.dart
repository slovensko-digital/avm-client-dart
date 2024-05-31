import 'package:chopper/chopper.dart'
    show HeadersInterceptor, Request, applyHeaders;

/// Sets the authorization header:
/// "X-Encryption-Key: [encryptionKeySource] value".
///
/// Also sets "Accept: application/json" value.
class AutogramAuthenticator extends HeadersInterceptor {
  final String Function() encryptionKeySource;

  AutogramAuthenticator({
    required this.encryptionKeySource,
  }) : super(const {});

  @override
  Future<Request> onRequest(Request request) async {
    final encryptionKey = encryptionKeySource();
    final allHeaders = {
      "Accept": "application/json",
      "X-Encryption-Key": encryptionKey,
    };

    return applyHeaders(request, allHeaders);
  }
}
