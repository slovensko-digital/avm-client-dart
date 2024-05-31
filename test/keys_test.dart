import 'package:autogram_sign/autogram_sign.dart';
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
}
