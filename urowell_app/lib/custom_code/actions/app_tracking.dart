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
// Importar dependência app_tracking_transparency
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

Future appTracking() async {
  if (Platform.isIOS) {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    // Se o sistema puder mostrar uma caixa de diálogo de solicitação de autorização
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
    await AppTrackingTransparency.getAdvertisingIdentifier();
  }
}
