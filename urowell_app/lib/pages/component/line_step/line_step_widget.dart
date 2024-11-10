import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'line_step_model.dart';
export 'line_step_model.dart';

class LineStepWidget extends StatefulWidget {
  const LineStepWidget({
    super.key,
    String? status,
  }) : this.status = status ?? '';

  final String status;

  @override
  State<LineStepWidget> createState() => _LineStepWidgetState();
}

class _LineStepWidgetState extends State<LineStepWidget> {
  late LineStepModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineStepModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget!.status == 'init') {
          return Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: Color(0xFFA8D8FF),
            ),
          );
        } else if (widget!.status == 'load') {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFFA8D8FF),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFF0E5AA6),
                ),
              ),
            ],
          );
        } else {
          return Container(
            width: double.infinity,
            height: 1.0,
            decoration: BoxDecoration(
              color: Color(0xFF0DA690),
            ),
          );
        }
      },
    );
  }
}
