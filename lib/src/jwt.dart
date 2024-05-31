import 'package:autogram_sign/autogram_sign.dart';
import 'package:basic_utils/basic_utils.dart'
    show ECPrivateKey, PrivateKey, RSAPrivateKey;
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart' as jwt;
import 'package:uuid/uuid.dart' show Uuid;

/// Returns signed JWT.
String signedJwt({
  required String subject,
  Duration? expiresIn,
  required PrivateKey privateKey,
}) {
  // Create JWT
  final jwtId = Uuid().v4();
  final token = jwt.JWT(
    null,
    subject: subject,
    jwtId: jwtId,
  );

  // Get jwt.JWTKey based on PrivateKey (from different package)
  final jwt.JWTKey key = switch (privateKey) {
    ECPrivateKey _ => jwt.ECPrivateKey(privateKey.getEncoded()),
    RSAPrivateKey _ => jwt.RSAPrivateKey(privateKey.getEncoded()),
    _ => throw UnsupportedError(
        "Signing by ${privateKey.runtimeType} not supported."),
  };

  return token.sign(
    key,
    expiresIn: expiresIn,
    algorithm: jwt.JWTAlgorithm.ES256,
  );
}
