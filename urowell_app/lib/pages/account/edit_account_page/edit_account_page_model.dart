import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/component/button/button/button_widget.dart';
import 'edit_account_page_widget.dart' show EditAccountPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class EditAccountPageModel extends FlutterFlowModel<EditAccountPageWidget> {
  ///  Local state fields for this page.

  String? firstname;

  String? lastname;

  String? age;

  String? email;

  String? location;

  String? doctorid;

  bool edit = true;

  String? doctorIdChange;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in edit_account_page widget.
  List<UsersRow>? initUser;
  // Stores action output result for [Backend Call - Query Rows] action in edit_account_page widget.
  List<LocationsRow>? locationAll;
  // Stores action output result for [Backend Call - Query Rows] action in edit_account_page widget.
  List<LocationsRow>? locationUser;
  // Stores action output result for [Backend Call - Query Rows] action in edit_account_page widget.
  List<DoctorsRow>? doctorUserLocation;
  // Stores action output result for [Backend Call - Query Rows] action in edit_account_page widget.
  List<DoctorsRow>? doctorUser;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Stores action output result for [Backend Call - Query Rows] action in button widget.
  List<LocationsRow>? locationId;
  // Stores action output result for [Backend Call - API (updateEmailUser)] action in button widget.
  ApiCallResponse? updateEmail;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
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
}
