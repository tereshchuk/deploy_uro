import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button/button_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import 'measurement_start_page_widget.dart' show MeasurementStartPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeasurementStartPageModel
    extends FlutterFlowModel<MeasurementStartPageWidget> {
  ///  State fields for stateful widgets in this page.

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
