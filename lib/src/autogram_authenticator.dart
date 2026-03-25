import 'package:chopper/chopper.dart';

/// Sets the "X-Encryption-Key" and "Accept": "application/json" values.
class AutogramAuthenticator extends HeadersInterceptor {
  final String Function() encryptionKeySource;

  AutogramAuthenticator(this.encryptionKeySource) : super(const {});

  @override
  // TODO Fix override
  // TODO Add tests
  Future<Request> onRequest(Request request) async {
    final encryptionKey = encryptionKeySource();
    final allHeaders = {
      "Accept": "application/json",
      "X-Encryption-Key": encryptionKey,
    };

    return applyHeaders(request, allHeaders);
  }
}
