import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button/button_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'measurement_success_page_model.dart';
export 'measurement_success_page_model.dart';

class MeasurementSuccessPageWidget extends StatefulWidget {
  const MeasurementSuccessPageWidget({
    super.key,
    required this.measurementid,
    required this.serialNumber,
    required this.status,
  });

  final String? measurementid;
  final String? serialNumber;
  final String? status;

  @override
  State<MeasurementSuccessPageWidget> createState() =>
      _MeasurementSuccessPageWidgetState();
}

class _MeasurementSuccessPageWidgetState
    extends State<MeasurementSuccessPageWidget> {
  late MeasurementSuccessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementSuccessPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initFull = await UsersTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          FFAppState().guest != null && FFAppState().guest != ''
              ? FFAppState().guest
              : currentUserUid,
        ),
      );

      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: wrapWithModel(
                      model: _model.stepWidgetModel,
                      updateCallback: () => safeSetState(() {}),
                      child: StepWidgetWidget(
                        title: 'title',
                        step: 0,
                        error: false,
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
                      child: Image.asset(
                        'assets/images/Check_circle.png',
                        width: 32.0,
                        height: 32.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          FFAppConstants.contentPadding,
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          FFAppConstants.contentPadding,
                          0.0,
                        ),
                        0.0),
                    child: Text(
                      'Measurement is successfully done',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.initFull?.first?.type == 'full') {
                        return Padding(
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
                            'Measurement is successfully done. Your uroflowmetry test report will be sent to your email. You have ${_model.initFull?.first?.usages?.toString()} tests remaining in your package.A comprehensive analysis will be provided after your final test.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        );
                      } else {
                        return Padding(
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
                            'Measurement is successfully done.Your uroflowmetry test report will be sent to your email.Additionally, the report will be sent to your doctor Dr. ${_model.initFull?.first?.doctor} and reviewer Dr. ${_model.initFull?.first?.doctor} for further analysis.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        );
                      }
                    },
                  ),
                  Spacer(),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        FFAppConstants.contentPadding,
                        0.0,
                      ),
                      0.0,
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
                      context.goNamed('start_page');
                    },
                    child: wrapWithModel(
                      model: _model.buttonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonWidget(
                        title: 'Ok',
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
