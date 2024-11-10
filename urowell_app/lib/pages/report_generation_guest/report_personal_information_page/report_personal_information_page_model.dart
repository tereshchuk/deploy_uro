import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button/button_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import 'report_personal_information_page_widget.dart'
    show ReportPersonalInformationPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportPersonalInformationPageModel
    extends FlutterFlowModel<ReportPersonalInformationPageWidget> {
  ///  Local state fields for this page.

  String? mail;

  String? password;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_bar component.
  late AppBarModel appBarModel;
  // Model for step_widget component.
  late StepWidgetModel stepWidgetModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error First Name';
    }

    if (val.length < 3) {
      return 'Error First Name';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Error First Name';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in TextField widget.
  bool? firstNameValidate;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error Last Name';
    }

    if (val.length < 3) {
      return 'Error Last Name';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Error Last Name';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in TextField widget.
  bool? lastNameValidate;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Error Age';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in TextField widget.
  bool? ageValidate;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
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
  bool? emailValidate;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    stepWidgetModel = createModel(context, () => StepWidgetModel());
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    stepWidgetModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
  }

  /// Action blocks.
  Future form1(BuildContext context) async {}
}
