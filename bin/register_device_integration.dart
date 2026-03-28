import 'dart:io';

import 'package:autogram_sign/autogram_sign.dart';
import 'package:autogram_sign/src/file_device_keys_store.dart';
import 'package:autogram_sign/src/jwt.dart';

/// Sample code to register Device to Integration.
void main() async {
  final encryptionKeySource = generateEncryptionKey;
  final deviceKeysStore = FileDeviceKeysStore(path: Directory("bin"));
  final privateKey =
      await deviceKeysStore.load().then((value) => value!.privateKey);
  final IAutogramService service = AutogramService(
    encryptionKeySource: encryptionKeySource,
    deviceKeysStore: deviceKeysStore,
  );

  final integrationId = "17e21ee5-6a1f-4800-9c51-74927a5c231f";
  final deviceId = "de41ba44-0eed-4803-8e99-65a132dab2ad";
  final integrationPairingToken = signedJwt(
    subject: integrationId,
    expiresIn: Duration(minutes: 10),
    privateKey: privateKey,
    audience: "device",
  );

  await service.registerDeviceIntegration(
    deviceId: deviceId,
    integrationPairingToken: integrationPairingToken,
  );

  print("Device registered to the integration.");
}
