import 'dart:async' show FutureOr;
import 'dart:isolate';

import 'package:basic_utils/basic_utils.dart' show AsymmetricKeyPair;

/// Persistent store for device [AsymmetricKeyPair] keys.
abstract interface class DeviceKeysStore {
  /// Loads the [AsymmetricKeyPair].
  Future<AsymmetricKeyPair?> load();

  /// Saves the [AsymmetricKeyPair].
  Future save(AsymmetricKeyPair value);
}

extension DeviceKeysStoreExtensions on DeviceKeysStore {
  /// If [load] returns `null`, then [factory] and [save] are called.
  Future<AsymmetricKeyPair> loadOrCreate(
    FutureOr<AsymmetricKeyPair> Function() factory,
  ) async {
    var value = await load();

    if (value == null) {
      value = await Isolate.run(factory);

      save(value!);
    }

    return value;
  }
}
