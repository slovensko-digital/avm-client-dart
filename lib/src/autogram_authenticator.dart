import 'dart:async';

import 'package:chopper/chopper.dart';

/// Sets the "X-Encryption-Key" and "Accept": "application/json" values.
///
/// Internal to `AutogramService` and deliberately not exported from
/// `autogram_sign.dart`: overriding [intercept] means this class's signature
/// follows `chopper`'s `Interceptor` contract, and keeping it private stops
/// that contract from becoming part of this package's public API.
class AutogramAuthenticator extends HeadersInterceptor {
  final String Function() encryptionKeySource;

  AutogramAuthenticator(this.encryptionKeySource) : super(const {});

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    // Typically would not need to override and only use the map passed
    // via the constructor; however since the encryptionKeySource
    // is function, this needs to be evaluated dynamically
    final encryptionKey = encryptionKeySource();
    final headers = {
      "Accept": "application/json",
      "X-Encryption-Key": encryptionKey,
    };

    return chain.proceed(applyHeaders(chain.request, headers));
  }
}
