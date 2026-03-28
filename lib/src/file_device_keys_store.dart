import 'dart:io';

import 'package:autogram_sign/src/keys.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:path/path.dart' as p;

import 'device_keys_store.dart';

/// File based [DeviceKeysStore] used for development only.
class FileDeviceKeysStore implements DeviceKeysStore {
  final Directory path;

  File get publicKeyFile => File(path.resolve("public_key.pem"));

  File get privateKeyFile => File(path.resolve("private_key.pem"));

  FileDeviceKeysStore({required this.path});

  @override
  Future<AsymmetricKeyPair<PublicKey, PrivateKey>?> load() async {
    if (!publicKeyFile.existsSync()) {
      return null;
    }

    if (!privateKeyFile.existsSync()) {
      return null;
    }

    final publicKeyString = await publicKeyFile.readAsString();
    final privateKeyString = await privateKeyFile.readAsString();

    final publicKey = CryptoUtils.ecPublicKeyFromPem(publicKeyString);
    final privateKey = CryptoUtils.ecPrivateKeyFromPem(privateKeyString);

    return AsymmetricKeyPair(publicKey, privateKey);
  }

  @override
  Future save(AsymmetricKeyPair<PublicKey, PrivateKey> value) async {
    final publicKeyString = value.publicKey.getEncoded();
    final privateKeyString = value.privateKey.getEncoded();

    if (!await path.exists()) {
      await path.create(recursive: true);
    }

    await publicKeyFile.writeAsString(publicKeyString);
    await privateKeyFile.writeAsString(privateKeyString);
  }
}

extension on Directory {
  String resolve(String name) {
    return p.join(path, name);
  }
}
