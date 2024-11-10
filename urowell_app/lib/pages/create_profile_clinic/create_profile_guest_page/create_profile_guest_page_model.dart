import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button/button_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_profile_guest_page_widget.dart'
    show CreateProfileGuestPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileGuestPageModel
    extends FlutterFlowModel<CreateProfileGuestPageWidget> {
  ///  Local state fields for this page.

  List<int> checkList = [];
  void addToCheckList(int item) => checkList.add(item);
  void removeFromCheckList(int item) => checkList.remove(item);
  void removeAtIndexFromCheckList(int index) => checkList.removeAt(index);
  void insertAtIndexInCheckList(int index, int item) =>
      checkList.insert(index, item);
  void updateCheckListAtIndex(int index, Function(int) updateFn) =>
      checkList[index] = updateFn(checkList[index]);

  int? countCheck = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in create_profile_guest_page widget.
  List<LegalRow>? getLegal;
  // Model for app_bar component.
  late AppBarModel appBarModel;
  // Model for step_widget component.
  late StepWidgetModel stepWidgetModel1;
  // Model for step_widget component.
  late StepWidgetModel stepWidgetModel2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    stepWidgetModel1 = createModel(context, () => StepWidgetModel());
    stepWidgetModel2 = createModel(context, () => StepWidgetModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    stepWidgetModel1.dispose();
    stepWidgetModel2.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
