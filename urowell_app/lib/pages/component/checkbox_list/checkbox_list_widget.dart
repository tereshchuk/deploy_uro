import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkbox_list_model.dart';
export 'checkbox_list_model.dart';

class CheckboxListWidget extends StatefulWidget {
  const CheckboxListWidget({super.key});

  @override
  State<CheckboxListWidget> createState() => _CheckboxListWidgetState();
}

class _CheckboxListWidgetState extends State<CheckboxListWidget> {
  late CheckboxListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowCheckboxGroup(
      options: ['Option 1', 'Option 2', 'Option 3'],
      onChanged: (val) => safeSetState(() => _model.checkboxGroupValues = val),
      controller: _model.checkboxGroupValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      activeColor: FlutterFlowTheme.of(context).primary,
      checkColor: FlutterFlowTheme.of(context).info,
      checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            letterSpacing: 0.0,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
          ),
      checkboxBorderRadius: BorderRadius.circular(4.0),
      initialized: _model.checkboxGroupValues != null,
    );
  }
}
