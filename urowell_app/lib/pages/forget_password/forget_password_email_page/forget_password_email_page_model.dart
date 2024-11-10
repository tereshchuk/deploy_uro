import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button/button_widget.dart';
import 'forget_password_email_page_widget.dart'
    show ForgetPasswordEmailPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPasswordEmailPageModel
    extends FlutterFlowModel<ForgetPasswordEmailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_bar component.
  late AppBarModel appBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error Email';
    }

    if (val.length < 3) {
      return 'Error Email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Error Email';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in TextField widget.
  bool? emailValid;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    emailTextControllerValidator = _emailTextControllerValidator;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
