import 'package:basic_utils/basic_utils.dart';

/// Persistent store for device [AsymmetricKeyPair] keys.
abstract interface class DeviceKeysStore {
  /// Loads the [AsymmetricKeyPair].
  Future<AsymmetricKeyPair?> load();

  /// Saves the [AsymmetricKeyPair].
  Future save(AsymmetricKeyPair it);
}
