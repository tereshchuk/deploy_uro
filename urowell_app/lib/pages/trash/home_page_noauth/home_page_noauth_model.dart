import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/button/button/button_widget.dart';
import 'home_page_noauth_widget.dart' show HomePageNoauthWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageNoauthModel extends FlutterFlowModel<HomePageNoauthWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in home_page_noauth widget.
  List<UsersRow>? initUser;
  // Stores action output result for [Backend Call - Query Rows] action in home_page_noauth widget.
  List<LocationsRow>? locationUser;
  // Stores action output result for [Backend Call - Query Rows] action in home_page_noauth widget.
  List<ContentRow>? getContent;
  // Model for button component.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
