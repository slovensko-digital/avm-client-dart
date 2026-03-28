import 'dart:io';

import 'package:autogram_sign/autogram_sign.dart';
import 'package:autogram_sign/src/file_device_keys_store.dart';

/// Sample code to register new Device.
void main() async {
  final encryptionKeySource = generateEncryptionKey;
  final deviceKeysStore = FileDeviceKeysStore(path: Directory("bin"));
  final service = AutogramService(
    encryptionKeySource: encryptionKeySource,
    deviceKeysStore: deviceKeysStore,
  );

  final registrationId = "token!";
  final displayName = "Device ${Platform.localHostname}";

  final deviceId = await service.registerDevice(
    registrationId: registrationId,
    displayName: displayName,
  );

  print("New Device registration for $displayName created with ID: $deviceId");
}
