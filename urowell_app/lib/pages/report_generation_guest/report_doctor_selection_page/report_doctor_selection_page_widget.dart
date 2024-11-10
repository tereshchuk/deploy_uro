import '/backend/schema/enums/enums.dart';
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
import 'report_doctor_selection_page_model.dart';
export 'report_doctor_selection_page_model.dart';

class ReportDoctorSelectionPageWidget extends StatefulWidget {
  const ReportDoctorSelectionPageWidget({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.email,
    required this.locationid,
    required this.locationNumber,
  });

  final String? firstname;
  final String? lastname;
  final int? age;
  final String? email;
  final String? locationid;
  final int? locationNumber;

  @override
  State<ReportDoctorSelectionPageWidget> createState() =>
      _ReportDoctorSelectionPageWidgetState();
}

class _ReportDoctorSelectionPageWidgetState
    extends State<ReportDoctorSelectionPageWidget> {
  late ReportDoctorSelectionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportDoctorSelectionPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.doctorList = await DoctorsTable().queryRows(
        queryFn: (q) => q.eq(
          'clinic',
          widget!.locationid,
        ),
      );
      _model.locationid = _model.doctorList?.first?.clinic;
      _model.doctorid = _model.doctorList?.first?.id;
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                            back: true,
                            title: 'Guest Profile Setup',
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
                            8.0),
                        child: wrapWithModel(
                          model: _model.stepWidgetModel,
                          updateCallback: () => safeSetState(() {}),
                          child: StepWidgetWidget(
                            title: 'Doctor Selection',
                            step: 2,
                            error: false,
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
                          'Your report will also be shared with the doctor you choose.',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Flexible(
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
                          child: Builder(
                            builder: (context) {
                              final gridLocation =
                                  _model.doctorList?.toList() ?? [];

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 1.5,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: gridLocation.length,
                                itemBuilder: (context, gridLocationIndex) {
                                  final gridLocationItem =
                                      gridLocation[gridLocationIndex];
                                  return Builder(
                                    builder: (context) {
                                      if (gridLocationIndex ==
                                          _model.locationindex) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.locationindex =
                                                valueOrDefault<int>(
                                              gridLocationIndex,
                                              0,
                                            );
                                            _model.locationid = _model
                                                .doctorList?[
                                                    _model.locationindex!]
                                                ?.clinic;
                                            _model.doctorid = _model
                                                .doctorList?[
                                                    _model.locationindex!]
                                                ?.id;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 156.0,
                                            height: 104.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        gridLocationItem.name,
                                                        'name',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.locationindex =
                                                valueOrDefault<int>(
                                              gridLocationIndex,
                                              0,
                                            );
                                            _model.locationid = _model
                                                .doctorList?[
                                                    _model.locationindex!]
                                                ?.clinic;
                                            _model.doctorid = _model
                                                .doctorList?[
                                                    _model.locationindex!]
                                                ?.id;
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 156.0,
                                            height: 104.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFC6C6C6),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        gridLocationItem.name,
                                                        'name',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      context.pushNamed(
                        'create_agreements_page',
                        queryParameters: {
                          'email': serializeParam(
                            widget!.email,
                            ParamType.String,
                          ),
                          'firstname': serializeParam(
                            widget!.firstname,
                            ParamType.String,
                          ),
                          'lastname': serializeParam(
                            widget!.lastname,
                            ParamType.String,
                          ),
                          'location': serializeParam(
                            _model.locationid,
                            ParamType.String,
                          ),
                          'age': serializeParam(
                            widget!.age,
                            ParamType.int,
                          ),
                          'type': serializeParam(
                            TypeUsers.guest.name,
                            ParamType.String,
                          ),
                          'doctor': serializeParam(
                            _model.doctorid,
                            ParamType.String,
                          ),
                          'usages': serializeParam(
                            FFAppConstants.countPayStart,
                            ParamType.int,
                          ),
                          'locationNumber': serializeParam(
                            widget!.locationNumber,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: wrapWithModel(
                      model: _model.buttonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonWidget(
                        title: 'Next',
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
