import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button/button_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'measurement_progress_page_widget.dart'
    show MeasurementProgressPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MeasurementProgressPageModel
    extends FlutterFlowModel<MeasurementProgressPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in measurement_progress_page widget.
  List<UsersRow>? initFull;
  // Stores action output result for [Backend Call - Insert Row] action in measurement_progress_page widget.
  MeasurementsRow? createMeasurement;
  // Model for app_bar component.
  late AppBarModel appBarModel;
  // Model for step_widget component.
  late StepWidgetModel stepWidgetModel;
  // Model for button component.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    stepWidgetModel = createModel(context, () => StepWidgetModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    stepWidgetModel.dispose();
    buttonModel.dispose();
  }
}
