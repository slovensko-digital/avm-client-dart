import 'dart:async';

import 'package:chopper/chopper.dart';

// TODO Drop AutogramAuthenticator and implement using custom DynamicMap<K, V> : MapBase<K, V> that will accept K Function()

/// Sets the "X-Encryption-Key" and "Accept": "application/json" values.
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
