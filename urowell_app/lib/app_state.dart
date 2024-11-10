import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _guest = prefs.getString('ff_guest') ?? _guest;
    });
    _safeInit(() {
      _enableBluetooth =
          prefs.getBool('ff_enableBluetooth') ?? _enableBluetooth;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
  }

  String _emailUser = '';
  String get emailUser => _emailUser;
  set emailUser(String value) {
    _emailUser = value;
  }

  String _guest = '';
  String get guest => _guest;
  set guest(String value) {
    _guest = value;
    prefs.setString('ff_guest', value);
  }

  bool _enableBluetooth = false;
  bool get enableBluetooth => _enableBluetooth;
  set enableBluetooth(bool value) {
    _enableBluetooth = value;
    prefs.setBool('ff_enableBluetooth', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
