import 'dart:convert' show base64;

import 'package:basic_utils/basic_utils.dart';

/// Generates new secure "encryption key".
String generateEncryptionKey() {
  final data = CryptoUtils.getSecureRandom().nextBytes(32);

  return base64.encode(data);
}

/// Generates new ECC [AsymmetricKeyPair].
AsymmetricKeyPair<ECPublicKey, ECPrivateKey> generateAsymmetricKeyPair() {
  final keyPair = CryptoUtils.generateEcKeyPair();

  return AsymmetricKeyPair(
    keyPair.publicKey as ECPublicKey,
    keyPair.privateKey as ECPrivateKey,
  );
}

/// A set of extensions on [PublicKey].
extension PublicKeyExtensions on PublicKey {
  /// Gets the ASN.1 PEM encoded.
  String getEncoded() {
    return switch (this) {
      ECPublicKey it => CryptoUtils.encodeEcPublicKeyToPem(it),
      RSAPublicKey it => CryptoUtils.encodeRSAPublicKeyToPem(it),
      _ => throw UnsupportedError("Encoding $runtimeType not supported."),
    };
  }
}

/// A set of extensions on [PrivateKey].
extension PrivateKeyExtensions on PrivateKey {
  /// Gets the ASN.1 PEM encoded.
  String getEncoded() {
    return switch (this) {
      ECPrivateKey it => CryptoUtils.encodeEcPrivateKeyToPem(it),
      RSAPrivateKey it => CryptoUtils.encodeRSAPrivateKeyToPem(it),
      _ => throw UnsupportedError("Encoding $runtimeType not supported."),
    };
  }
}
