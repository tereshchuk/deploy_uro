import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/alert/alert_log_out/alert_log_out_widget.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import 'dart:async';
import 'account_page_widget.dart' show AccountPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AccountPageModel extends FlutterFlowModel<AccountPageWidget> {
  ///  Local state fields for this component.

  List<LegalRow> legal = [];
  void addToLegal(LegalRow item) => legal.add(item);
  void removeFromLegal(LegalRow item) => legal.remove(item);
  void removeAtIndexFromLegal(int index) => legal.removeAt(index);
  void insertAtIndexInLegal(int index, LegalRow item) =>
      legal.insert(index, item);
  void updateLegalAtIndex(int index, Function(LegalRow) updateFn) =>
      legal[index] = updateFn(legal[index]);

  ///  State fields for stateful widgets in this component.

  // Model for app_bar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
  }
}
