import 'dart:convert' show base64Url, json, utf8;
import 'dart:typed_data' show Uint8List;

import 'package:autogram_sign/autogram_sign.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:test/test.dart';

/// Tests for `keys` functions.
void main() {
  group('generateEncryptionKey', () {
    test('generateEncryptionKey returns base64 encoded 32 bytes', () {
      final key = generateEncryptionKey();

      expect(key, isNotEmpty);
    });
  });

  group('generateAsymmetricKeyPair', () {
    test('generateAsymmetricKeyPair returns usable key pair', () {
      final keyPair = generateAsymmetricKeyPair();

      expect(keyPair.publicKey.Q, isNotNull);
      expect(keyPair.publicKey.getEncoded(), isNotNull);

      expect(keyPair.privateKey.d, isNotNull);
      expect(keyPair.privateKey.parameters, isNotNull);
      expect(keyPair.privateKey.getEncoded(), isNotNull);
    });
  });

  group('createDeviceToken', () {
    List<int> decode(String value) =>
        base64Url.decode(base64Url.normalize(value));

    test('createDeviceToken returns valid ES256 JWT', () {
      final keyPair = generateAsymmetricKeyPair();
      final now = DateTime.utc(2026, 1, 1, 12);

      final token = createDeviceToken(
        deviceId: "device-1",
        privateKey: keyPair.privateKey,
        now: now,
      );
      final parts = token.split('.');

      expect(parts, hasLength(3));
      expect(token, isNot(contains('=')));

      final header = json.decode(utf8.decode(decode(parts[0])));
      expect(header, {"alg": "ES256", "typ": "JWT"});

      final payload = json.decode(utf8.decode(decode(parts[1])));
      expect(payload["sub"], "device-1");
      expect(
        payload["exp"],
        now.add(const Duration(minutes: 5)).millisecondsSinceEpoch ~/ 1000,
      );
      expect(payload["jti"], matches(RegExp(r'^[0-9a-f]{64}$')));

      final signature = decode(parts[2]);
      expect(signature, hasLength(64));

      final isValid = CryptoUtils.ecVerify(
        keyPair.publicKey,
        Uint8List.fromList(utf8.encode("${parts[0]}.${parts[1]}")),
        ECSignature(
          BigInt.parse(_hex(signature.sublist(0, 32)), radix: 16),
          BigInt.parse(_hex(signature.sublist(32)), radix: 16),
        ),
        algorithm: 'SHA-256/ECDSA',
      );
      expect(isValid, isTrue);
    });

    test('createDeviceToken returns unique jti', () {
      final keyPair = generateAsymmetricKeyPair();
      String jti() {
        final token = createDeviceToken(
          deviceId: "device-1",
          privateKey: keyPair.privateKey,
        );
        final payload = token.split('.')[1];

        return json.decode(utf8.decode(decode(payload)))["jti"];
      }

      expect(jti(), isNot(jti()));
    });
  });
}

String _hex(List<int> bytes) =>
    bytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
