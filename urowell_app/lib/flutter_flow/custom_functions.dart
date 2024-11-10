import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? getTypeFile(String? url) {
  if (url!.contains(RegExp(r'[?]'))) {
    return ".${url.substring(0, url.indexOf('?')).split('.').last}"
        .toLowerCase();
  }
  return ".${url.split('.').last}".toLowerCase();
}

int? getUserId(String? locationNumber) {
  int next(int min, int max) => min + math.Random().nextInt(max - min);
  return int.parse("$locationNumber${next(1000, 10000)}");
}

int? minusUsages(int? usages) {
  if (usages! > 0) {
    return usages - 1;
  }
  return usages;
}
