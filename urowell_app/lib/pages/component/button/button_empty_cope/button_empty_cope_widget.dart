import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_empty_cope_model.dart';
export 'button_empty_cope_model.dart';

class ButtonEmptyCopeWidget extends StatefulWidget {
  const ButtonEmptyCopeWidget({
    super.key,
    this.title,
    this.color,
  });

  final String? title;
  final Color? color;

  @override
  State<ButtonEmptyCopeWidget> createState() => _ButtonEmptyCopeWidgetState();
}

class _ButtonEmptyCopeWidgetState extends State<ButtonEmptyCopeWidget> {
  late ButtonEmptyCopeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonEmptyCopeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget!.title!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 48.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: Color(0x00D53232),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: FlutterFlowTheme.of(context).primary,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
          width: 0.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
