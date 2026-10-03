import 'dart:convert' show base64, base64Url, json, utf8;
import 'dart:typed_data' show Uint8List;

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

/// Creates "Device JWT" signed by device [privateKey] using ES256.
///
/// Server verifies it with device public key sent in `registerDevice` and
/// requires: `sub` = device ID, `exp` at most 15 minutes in future and
/// unique `jti` with 32-256 `[0-9a-z\-_]` chars.
String createDeviceToken({
  required String deviceId,
  required ECPrivateKey privateKey,
  Duration validity = const Duration(minutes: 5),
  DateTime? now,
}) {
  final exp = (now ?? DateTime.now()).add(validity).millisecondsSinceEpoch ~/
      Duration.millisecondsPerSecond;
  final jti = CryptoUtils.getSecureRandom()
      .nextBytes(32)
      .map((e) => e.toRadixString(16).padLeft(2, '0'))
      .join();

  final header = {"alg": "ES256", "typ": "JWT"};
  final payload = {"sub": deviceId, "exp": exp, "jti": jti};
  final signingInput =
      "${_base64UrlJson(header)}.${_base64UrlJson(payload)}";

  final signature = CryptoUtils.ecSign(
    privateKey,
    Uint8List.fromList(utf8.encode(signingInput)),
    algorithmName: 'SHA-256/ECDSA',
  );

  // JWS ES256 signature is R || S, each as 32 bytes unsigned big-endian
  final signatureBytes = Uint8List.fromList([
    ..._bigIntToBytes(signature.r, 32),
    ..._bigIntToBytes(signature.s, 32),
  ]);

  return "$signingInput.${_base64UrlNoPadding(signatureBytes)}";
}

String _base64UrlJson(Map<String, Object> value) {
  return _base64UrlNoPadding(utf8.encode(json.encode(value)));
}

String _base64UrlNoPadding(List<int> data) {
  return base64Url.encode(data).replaceAll('=', '');
}

List<int> _bigIntToBytes(BigInt value, int length) {
  final bytes = List<int>.filled(length, 0);
  var v = value;

  for (var i = length - 1; i >= 0; i--) {
    bytes[i] = (v & BigInt.from(0xff)).toInt();
    v = v >> 8;
  }

  return bytes;
}
