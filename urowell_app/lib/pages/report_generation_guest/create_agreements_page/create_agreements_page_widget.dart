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
import 'package:provider/provider.dart';
import 'create_agreements_page_model.dart';
export 'create_agreements_page_model.dart';

class CreateAgreementsPageWidget extends StatefulWidget {
  const CreateAgreementsPageWidget({
    super.key,
    required this.email,
    required this.firstname,
    String? lastname,
    required this.location,
    required this.usages,
    required this.age,
    required this.type,
    required this.doctor,
    required this.locationNumber,
  }) : this.lastname = lastname ?? '';

  final String? email;
  final String? firstname;
  final String lastname;
  final String? location;
  final int? usages;
  final int? age;
  final String? type;
  final String? doctor;
  final int? locationNumber;

  @override
  State<CreateAgreementsPageWidget> createState() =>
      _CreateAgreementsPageWidgetState();
}

class _CreateAgreementsPageWidgetState
    extends State<CreateAgreementsPageWidget> {
  late CreateAgreementsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAgreementsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getLegal = await LegalTable().queryRows(
        queryFn: (q) => q,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        title: 'Create Profile',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if ((_model.checkboxValue2 == true) &&
                            (_model.checkboxValue3 == true) &&
                            (_model.checkboxValue4 == true) &&
                            (_model.checkboxValue5 == true)) {
                          return wrapWithModel(
                            model: _model.stepWidgetModel1,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: StepWidgetWidget(
                              title: 'Agreements',
                              step: 0,
                              error: false,
                            ),
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.stepWidgetModel2,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: StepWidgetWidget(
                              title: 'Agreements',
                              step: 3,
                              error: false,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                    child: Text(
                      'Please review each section and acknowledge your agreement to continue.',
                      textAlign: TextAlign.start,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF0C0C0C),
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue1 ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue1 = newValue!);
                              if (newValue!) {
                                safeSetState(() {
                                  _model.checkboxValue2 = true;
                                });
                                safeSetState(() {
                                  _model.checkboxValue3 = true;
                                });
                                safeSetState(() {
                                  _model.checkboxValue3 = true;
                                });
                                safeSetState(() {
                                  _model.checkboxValue4 = true;
                                });
                                safeSetState(() {
                                  _model.checkboxValue5 = true;
                                });
                              } else {
                                safeSetState(() {
                                  _model.checkboxValue2 = false;
                                });
                                safeSetState(() {
                                  _model.checkboxValue3 = false;
                                });
                                safeSetState(() {
                                  _model.checkboxValue3 = false;
                                });
                                safeSetState(() {
                                  _model.checkboxValue4 = false;
                                });
                                safeSetState(() {
                                  _model.checkboxValue5 = false;
                                });
                              }
                            },
                            side: BorderSide(
                              width: 2,
                              color: Color(0xFF0C0C0C),
                            ),
                            activeColor: Colors.white,
                            checkColor: Color(0xFF0E5AA6),
                          ),
                        ),
                        Text(
                          'I Agree to All',
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF0C0C0C),
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue2 ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue2 = newValue!);
                            },
                            side: BorderSide(
                              width: 2,
                              color: Color(0xFF0C0C0C),
                            ),
                            activeColor: Colors.white,
                            checkColor: Color(0xFF0E5AA6),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'webview_page',
                              queryParameters: {
                                'title': serializeParam(
                                  _model.getLegal?[0]?.name,
                                  ParamType.String,
                                ),
                                'url': serializeParam(
                                  _model.getLegal?[0]?.file,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Text(
                            valueOrDefault<String>(
                              _model.getLegal?[0]?.name,
                              'title',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF0C0C0C),
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue3 ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue3 = newValue!);
                            },
                            side: BorderSide(
                              width: 2,
                              color: Color(0xFF0C0C0C),
                            ),
                            activeColor: Colors.white,
                            checkColor: Color(0xFF0E5AA6),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'webview_page',
                              queryParameters: {
                                'title': serializeParam(
                                  _model.getLegal?[1]?.name,
                                  ParamType.String,
                                ),
                                'url': serializeParam(
                                  _model.getLegal?[1]?.file,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Text(
                            valueOrDefault<String>(
                              _model.getLegal?[1]?.name,
                              'title',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF0C0C0C),
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue4 ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue4 = newValue!);
                            },
                            side: BorderSide(
                              width: 2,
                              color: Color(0xFF0C0C0C),
                            ),
                            activeColor: Colors.white,
                            checkColor: Color(0xFF0E5AA6),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'webview_page',
                              queryParameters: {
                                'title': serializeParam(
                                  _model.getLegal?[2]?.name,
                                  ParamType.String,
                                ),
                                'url': serializeParam(
                                  _model.getLegal?[2]?.file,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Text(
                            valueOrDefault<String>(
                              _model.getLegal?[2]?.name,
                              'title',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF0C0C0C),
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue5 ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue5 = newValue!);
                            },
                            side: BorderSide(
                              width: 2,
                              color: Color(0xFF0C0C0C),
                            ),
                            activeColor: Colors.white,
                            checkColor: Color(0xFF0E5AA6),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'webview_page',
                              queryParameters: {
                                'title': serializeParam(
                                  _model.getLegal?[3]?.name,
                                  ParamType.String,
                                ),
                                'url': serializeParam(
                                  _model.getLegal?[3]?.file,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Text(
                            valueOrDefault<String>(
                              _model.getLegal?[3]?.name,
                              'title',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  if ((_model.checkboxValue2 == true) &&
                      (_model.checkboxValue3 == true) &&
                      (_model.checkboxValue4 == true) &&
                      (_model.checkboxValue5 == true)) {
                    return Align(
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
                            _model.responseUser = await UsersTable().insert({
                              'first_name': widget!.firstname,
                              'last_name': widget!.lastname,
                              'email': widget!.email,
                              'location': widget!.location,
                              'usages': widget!.usages,
                              'age': widget!.age,
                              'type': widget!.type,
                              'doctor': widget!.doctor,
                              'user_id': functions.getUserId(
                                  widget!.locationNumber?.toString()),
                            });
                            FFAppState().guest = _model.responseUser!.id;
                            FFAppState().update(() {});

                            context.goNamed('start_page');

                            safeSetState(() {});
                          },
                          child: wrapWithModel(
                            model: _model.buttonModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonWidget(
                              title: 'Finish',
                              color: FlutterFlowTheme.of(context).success,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 15.0),
                        child: wrapWithModel(
                          model: _model.buttonModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            title: 'Finish',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
