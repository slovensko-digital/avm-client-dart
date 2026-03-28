import 'package:basic_utils/basic_utils.dart';

import 'device_keys_store.dart';

/// In-memory [DeviceKeysStore] used for development only.
class InMemoryDeviceKeysStore implements DeviceKeysStore {
  AsymmetricKeyPair<PublicKey, PrivateKey>? value;

  @override
  Future<AsymmetricKeyPair<PublicKey, PrivateKey>?> load() {
    return Future.value(value);
  }

  @override
  Future save(AsymmetricKeyPair<PublicKey, PrivateKey> value) async {
    this.value = value;
  }
}
