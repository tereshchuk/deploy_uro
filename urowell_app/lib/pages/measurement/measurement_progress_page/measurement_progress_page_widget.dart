import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/button/button/button_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'measurement_progress_page_model.dart';
export 'measurement_progress_page_model.dart';

class MeasurementProgressPageWidget extends StatefulWidget {
  const MeasurementProgressPageWidget({
    super.key,
    required this.serialNumber,
    required this.status,
    required this.userid,
  });

  final String? serialNumber;
  final String? status;
  final String? userid;

  @override
  State<MeasurementProgressPageWidget> createState() =>
      _MeasurementProgressPageWidgetState();
}

class _MeasurementProgressPageWidgetState
    extends State<MeasurementProgressPageWidget> {
  late MeasurementProgressPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementProgressPageModel());

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
      await UsersTable().update(
        data: {
          'usages': functions.minusUsages(_model.initFull?.first?.usages),
        },
        matchingRows: (rows) => rows.eq(
          'id',
          FFAppState().guest != null && FFAppState().guest != ''
              ? FFAppState().guest
              : currentUserUid,
        ),
      );
      _model.createMeasurement = await MeasurementsTable().insert({
        'external_user_id': _model.initFull?.first?.userId,
      });
      await Future.delayed(const Duration(milliseconds: 180000));

      context.pushNamed(
        'measurement_success_page',
        queryParameters: {
          'measurementid': serializeParam(
            _model.createMeasurement?.id,
            ParamType.String,
          ),
          'serialNumber': serializeParam(
            widget!.serialNumber,
            ParamType.String,
          ),
          'status': serializeParam(
            widget!.status,
            ParamType.String,
          ),
        }.withoutNulls,
      );
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
                    title: 'Measurement',
                    step: 2,
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
                child: CircularPercentIndicator(
                  percent: 0.2,
                  radius: 16.0,
                  lineWidth: 3.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: Color(0xFF0E5AA6),
                  backgroundColor: Color(0xFFE6E6E8),
                  center: Text(
                    '20%',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineSmallFamily,
                          fontSize: 0.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).headlineSmallFamily),
                        ),
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
                  'Measurement in progress',
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
                  'Press the button below when you finish.',
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
                    context.pushNamed(
                      'measurement_success_page',
                      queryParameters: {
                        'measurementid': serializeParam(
                          _model.createMeasurement?.id,
                          ParamType.String,
                        ),
                        'serialNumber': serializeParam(
                          widget!.serialNumber,
                          ParamType.String,
                        ),
                        'status': serializeParam(
                          widget!.status,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: wrapWithModel(
                    model: _model.buttonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ButtonWidget(
                      title: 'Stop Measurement',
                      color: FlutterFlowTheme.of(context).error,
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
