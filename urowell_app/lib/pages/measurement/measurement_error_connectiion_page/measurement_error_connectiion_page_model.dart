import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button_empty_cope/button_empty_cope_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import 'measurement_error_connectiion_page_widget.dart'
    show MeasurementErrorConnectiionPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeasurementErrorConnectiionPageModel
    extends FlutterFlowModel<MeasurementErrorConnectiionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for app_bar component.
  late AppBarModel appBarModel;
  // Model for step_widget component.
  late StepWidgetModel stepWidgetModel;
  // Model for button_empty_cope component.
  late ButtonEmptyCopeModel buttonEmptyCopeModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    stepWidgetModel = createModel(context, () => StepWidgetModel());
    buttonEmptyCopeModel = createModel(context, () => ButtonEmptyCopeModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    stepWidgetModel.dispose();
    buttonEmptyCopeModel.dispose();
  }
}
