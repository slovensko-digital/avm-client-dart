import 'dart:io';

import 'package:autogram_sign/autogram_sign.dart';
import 'package:autogram_sign/src/file_device_keys_store.dart';

/// Sample code to create new Integration.
void main() async {
  final encryptionKeySource = generateEncryptionKey;
  final deviceKeysStore = FileDeviceKeysStore(path: Directory("bin"));
  final service = AutogramService(
    encryptionKeySource: encryptionKeySource,
    deviceKeysStore: deviceKeysStore,
  );

  final integrationName = "AVM Integration @ ${Platform.localHostname}";
  final integrationId = await service.registerIntegration(
    displayName: integrationName,
  );

  print("$integrationName created with ID: $integrationId");
}
