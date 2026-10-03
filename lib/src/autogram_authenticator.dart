import 'dart:async' show FutureOr;

import 'package:chopper/chopper.dart';

/// Sets the "X-Encryption-Key" and "Accept": "application/json" values.
///
/// Also sets "Authorization: Bearer <Device JWT>" for device authenticated
/// APIs ("/device-integrations") when [deviceTokenSource] is provided.
class AutogramAuthenticator extends HeadersInterceptor {
  final String Function() encryptionKeySource;
  final FutureOr<String?> Function()? deviceTokenSource;

  AutogramAuthenticator(
    this.encryptionKeySource, {
    this.deviceTokenSource,
  }) : super(const {});

  @override
  Future<Request> onRequest(Request request) async {
    final encryptionKey = encryptionKeySource();
    final allHeaders = {
      "Accept": "application/json",
      "X-Encryption-Key": encryptionKey,
    };

    // Each Device JWT has unique "jti" so create it only when needed
    final tokenSource = deviceTokenSource;

    if (tokenSource != null &&
        request.url.path.contains("/device-integrations")) {
      final token = await tokenSource();

      if (token != null) {
        allHeaders["Authorization"] = "Bearer $token";
      }
    }

    return applyHeaders(request, allHeaders);
  }
}
