import 'dart:async';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() => runApp(const FlutterBlePeripheralExample());

class FlutterBlePeripheralExample extends StatefulWidget {
  const FlutterBlePeripheralExample({Key? key}) : super(key: key);

  @override
  FlutterBlePeripheralExampleState createState() =>
      FlutterBlePeripheralExampleState();
}

class FlutterBlePeripheralExampleState
    extends State<FlutterBlePeripheralExample> {
  final List<ScanResult> _scanResults = [];
  bool _isScanning = false;
  String getDevice = "";
  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;
  late StreamSubscription<bool> _isScanningSubscription;

  int userId = 100000 + Random().nextInt(999999 - 100000);
/*
  late AdvertiseData advertiseData = AdvertiseData(
    serviceUuid:
        'bf27730d-0000-0000-0000-0000${userId.toRadixString(16).padLeft(8, '0')}',
    transmissionPowerIncluded: true,
  );

  final AdvertiseSetParameters advertiseSetParameters = AdvertiseSetParameters(
    legacyMode: true,
    connectable: true,
    scannable: true,
    includeTxPowerLevel: true,
  );*/

  final bool _isSupported = false;

  @override
  void initState() {
    super.initState();

    _scanResultsSubscription = FlutterBluePlus.scanResults.listen(
      (results) {
        if (results.isNotEmpty) {
          getDevice = results
              .firstWhere((o) {
                return o.advertisementData.serviceUuids.isNotEmpty &&
                    o.advertisementData.serviceUuids.join(', ').length > 22 &&
                    o.advertisementData.serviceUuids
                            .join(', ')
                            .substring(0, 8) ==
                        "bf27730d";
              })
              .advertisementData
              .serviceUuids
              .join(', ');

          /* if (getDevice.isNotEmpty && getErrorCode(getDevice) == "00") {
            print(
                "Suucess ${getSerialNumber(getDevice)} ${getUserId(getDevice)} ${getErrorCode(getDevice)}");
          } else
            print("Error");*/
        }
        print(results);
        print(getDevice);

        if (mounted) {
          setState(() {});
        }
      },
      onError: (e) {},
    );

    _isScanningSubscription = FlutterBluePlus.isScanning.listen((state) {
      _isScanning = state;
      if (mounted) {
        setState(() {});
      }
    });

    FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 60),
    );

    startSignal("123456");
  }

  @override
  void dispose() {
    _scanResultsSubscription.cancel();
    _isScanningSubscription.cancel();
    super.dispose();
  }

  String getErrorCode(String uuid) {
    final String result =
        uuid.substring(uuid.lastIndexOf('-')).replaceAll(RegExp('-'), '');

    return result.substring(2, 4);
  }

  String getSerialNumber(String uuid) {
    return uuid
        .substring(9, 23)
        .replaceAll(RegExp('-'), '')
        .split('')
        .reversed
        .join();
  }

  int getUserId(String uuid) {
    final String result =
        uuid.substring(uuid.lastIndexOf('-')).replaceAll(RegExp('-'), '');

    final String userIdHex = result.substring(4, result.length);

    return int.parse(userIdHex, radix: 16);
  }

  Future<void> startSignal(String userId) async {
    if (await FlutterBlePeripheral().isAdvertising) {
      //await FlutterBlePeripheral().stop();
    } else {
      await FlutterBlePeripheral().start(
          advertiseData: AdvertiseData(
            serviceUuid:
                'bf27730d-0000-0000-0000-0000${int.parse(userId).toRadixString(16).padLeft(8, '0')}',
            transmissionPowerIncluded: true,
          ),
          advertiseSetParameters: AdvertiseSetParameters(
              legacyMode: true,
              connectable: true,
              scannable: true,
              includeTxPowerLevel: true));
    }
  }
/*
  Future<void> _toggleAdvertise() async {
    if (await FlutterBlePeripheral().isAdvertising) {
      await FlutterBlePeripheral().stop();
    } else {
      await FlutterBlePeripheral().start(
        advertiseData: advertiseData,
        advertiseSetParameters: advertiseSetParameters,
      );
    }
  }*/

  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FlutterBluePlus.startScan(
              timeout: const Duration(seconds: 60),
            );
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Is supported: $_isSupported'),
              StreamBuilder(
                stream: FlutterBlePeripheral().onPeripheralStateChanged,
                initialData: PeripheralState.unknown,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Text(
                    'State: ${(snapshot.data as PeripheralState).name}',
                  );
                },
              ),
              //  Text('Current UUID: ${advertiseData.serviceUuid}'),
              MaterialButton(
                onPressed: () async {
                  /*  await FlutterBlePeripheral().start(
                    advertiseData: advertiseData,
                    advertiseSetParameters: advertiseSetParameters,
                  );*/
                },
                child: Text(
                  'Start advertising',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .labelLarge!
                      .copyWith(color: Colors.blue),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  await FlutterBlePeripheral().stop();
                },
                child: Text(
                  'Stop advertising',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .labelLarge!
                      .copyWith(color: Colors.blue),
                ),
              ),
              if (getDevice.isNotEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Дані отримані від пристрою"),
                    Text("UUID DEVICE : $getDevice"),
                    Text(
                      "Статус : ${getErrorCode(getDevice)}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "UserId : ${getUserId(getDevice)}",
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                )
              else
                Container(),
            ],
          ),
        ),
      ),
    );
  }
}
