import 'dart:convert';
import 'package:flutter/services.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Development';
  static const String environmentValuesPath =
      'assets/environment_values/development.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _baseUrl = data['baseUrl'];
      _anonKey = data['anonKey'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _baseUrl = '';
  String get baseUrl => _baseUrl;

  String _anonKey = '';
  String get anonKey => _anonKey;
}
