import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/account/account_page/account_page_widget.dart';
import '/pages/home/home_page/home_page_widget.dart';
import 'dart:async';
import 'start_page_widget.dart' show StartPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartPageModel extends FlutterFlowModel<StartPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in start_page widget.
  List<LegalRow>? getLegal;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for home_page component.
  late HomePageModel homePageModel;
  // Model for account_page component.
  late AccountPageModel accountPageModel;

  @override
  void initState(BuildContext context) {
    homePageModel = createModel(context, () => HomePageModel());
    accountPageModel = createModel(context, () => AccountPageModel());
  }

  @override
  void dispose() {
    homePageModel.dispose();
    accountPageModel.dispose();
  }
}
