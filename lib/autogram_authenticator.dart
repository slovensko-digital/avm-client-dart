import 'package:chopper/chopper.dart';

class AutogramAuthenticator extends HeadersInterceptor {
  final String encryptionKey;

  AutogramAuthenticator({required this.encryptionKey})
      : super({
          "Accept": "application/json",
          "X-Encryption-Key": encryptionKey,
        });
}
