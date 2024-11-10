import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';

Future<void> startSignal(String userId, String localName) async {
  if (await FlutterBlePeripheral().isAdvertising) {
    //await FlutterBlePeripheral().stop();
  } else {
    await FlutterBlePeripheral().start(
        advertiseData: AdvertiseData(
          serviceUuid:
              'bf27730d-0000-0000-0000-0000${int.parse(userId).toRadixString(16).padLeft(8, '0')}',
          //transmissionPowerIncluded: true,
        ),
        advertiseSetParameters: AdvertiseSetParameters(
            legacyMode: true,
            connectable: true,
            scannable: true,
            includeTxPowerLevel: true));
  }
}
