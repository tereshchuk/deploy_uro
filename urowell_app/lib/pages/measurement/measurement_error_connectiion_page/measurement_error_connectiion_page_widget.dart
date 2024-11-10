import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button_empty_cope/button_empty_cope_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'measurement_error_connectiion_page_model.dart';
export 'measurement_error_connectiion_page_model.dart';

class MeasurementErrorConnectiionPageWidget extends StatefulWidget {
  const MeasurementErrorConnectiionPageWidget({super.key});

  @override
  State<MeasurementErrorConnectiionPageWidget> createState() =>
      _MeasurementErrorConnectiionPageWidgetState();
}

class _MeasurementErrorConnectiionPageWidgetState
    extends State<MeasurementErrorConnectiionPageWidget> {
  late MeasurementErrorConnectiionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementErrorConnectiionPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    valueOrDefault<double>(
                      FFAppConstants.appbarpadding,
                      0.0,
                    )),
                child: wrapWithModel(
                  model: _model.appBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppBarWidget(
                    back: false,
                    title: 'Measurement',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: wrapWithModel(
                  model: _model.stepWidgetModel,
                  updateCallback: () => safeSetState(() {}),
                  child: StepWidgetWidget(
                    title: 'Connection',
                    step: 2,
                    error: true,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    valueOrDefault<double>(
                      FFAppConstants.appbarpadding,
                      0.0,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Vector.svg',
                    width: 32.0,
                    height: 32.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Error',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      FFAppConstants.contentPadding,
                      0.0,
                    ),
                    valueOrDefault<double>(
                      FFAppConstants.appbarpadding,
                      0.0,
                    ),
                    valueOrDefault<double>(
                      FFAppConstants.contentPadding,
                      0.0,
                    ),
                    valueOrDefault<double>(
                      FFAppConstants.appbarpadding,
                      0.0,
                    )),
                child: Text(
                  'Having trouble connecting your device, click the button below to try again.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      FFAppConstants.contentPadding,
                      0.0,
                    ),
                    valueOrDefault<double>(
                      FFAppConstants.appbarpadding,
                      0.0,
                    ),
                    valueOrDefault<double>(
                      FFAppConstants.contentPadding,
                      0.0,
                    ),
                    valueOrDefault<double>(
                      FFAppConstants.contentPadding,
                      0.0,
                    )),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed('measurement_start_page');
                  },
                  child: wrapWithModel(
                    model: _model.buttonEmptyCopeModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ButtonEmptyCopeWidget(
                      title: 'Start Measurement Again',
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
