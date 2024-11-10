// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

Future<String?> downloadAndStoreFile(String url, String type) async {
  // Add your function code here!
  var uuid = Uuid();
  final http.Response response = await http.get(Uri.parse(url));
  final Directory directory = await getApplicationDocumentsDirectory();
  final File newFile = File('${directory.path}/${uuid.v1()}${type}');
  if (await newFile.exists()) {
    await newFile.delete();
  }
  await newFile.writeAsBytes(response.bodyBytes);
  return newFile.path;
}
