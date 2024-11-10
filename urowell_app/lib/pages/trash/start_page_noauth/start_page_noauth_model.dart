import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/trash/home_page_noauth/home_page_noauth_widget.dart';
import 'dart:async';
import 'start_page_noauth_widget.dart' show StartPageNoauthWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartPageNoauthModel extends FlutterFlowModel<StartPageNoauthWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in start_page_noauth widget.
  List<LegalRow>? getLegal;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for home_page_noauth component.
  late HomePageNoauthModel homePageNoauthModel;

  @override
  void initState(BuildContext context) {
    homePageNoauthModel = createModel(context, () => HomePageNoauthModel());
  }

  @override
  void dispose() {
    homePageNoauthModel.dispose();
  }
}
