import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/line_step/line_step_widget.dart';
import 'step_widget_widget.dart' show StepWidgetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StepWidgetModel extends FlutterFlowModel<StepWidgetWidget> {
  ///  Local state fields for this component.

  int? step;

  bool error = true;

  String title = 'title';

  ///  State fields for stateful widgets in this component.

  // Model for line_step component.
  late LineStepModel lineStepModel1;
  // Model for line_step component.
  late LineStepModel lineStepModel2;
  // Model for line_step component.
  late LineStepModel lineStepModel3;
  // Model for line_step component.
  late LineStepModel lineStepModel4;
  // Model for line_step component.
  late LineStepModel lineStepModel5;
  // Model for line_step component.
  late LineStepModel lineStepModel6;

  @override
  void initState(BuildContext context) {
    lineStepModel1 = createModel(context, () => LineStepModel());
    lineStepModel2 = createModel(context, () => LineStepModel());
    lineStepModel3 = createModel(context, () => LineStepModel());
    lineStepModel4 = createModel(context, () => LineStepModel());
    lineStepModel5 = createModel(context, () => LineStepModel());
    lineStepModel6 = createModel(context, () => LineStepModel());
  }

  @override
  void dispose() {
    lineStepModel1.dispose();
    lineStepModel2.dispose();
    lineStepModel3.dispose();
    lineStepModel4.dispose();
    lineStepModel5.dispose();
    lineStepModel6.dispose();
  }
}
