import 'package:chopper/chopper.dart';

class AutogramAuthenticator extends HeadersInterceptor {
  AutogramAuthenticator({required String encryptionKey})
      : super({
          "Accept": "application/json",
          "X-Encryption-Key": encryptionKey,
        });
}
