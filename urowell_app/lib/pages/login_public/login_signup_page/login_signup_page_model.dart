import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/button/button/button_widget.dart';
import '/pages/component/button/button_empty/button_empty_widget.dart';
import 'login_signup_page_widget.dart' show LoginSignupPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginSignupPageModel extends FlutterFlowModel<LoginSignupPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for button_empty component.
  late ButtonEmptyModel buttonEmptyModel;
  // Model for button component.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonEmptyModel = createModel(context, () => ButtonEmptyModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonEmptyModel.dispose();
    buttonModel.dispose();
  }
}
