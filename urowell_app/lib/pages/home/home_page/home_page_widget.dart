import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/banner/banner_widget.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initFull = await UsersTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          FFAppState().guest != null && FFAppState().guest != ''
              ? FFAppState().guest
              : currentUserUid,
        ),
      );
      _model.locationFull = await LocationsTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          _model.initFull?.first?.location,
        ),
      );
      _model.getContent = await ContentTable().queryRows(
        queryFn: (q) => q,
      );

      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
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
              0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${_model.initFull?.first?.firstName} ${_model.initFull?.first?.lastName}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/Vector.svg',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.locationFull?.first?.address,
                              'Location',
                            ),
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
                        ),
                      ],
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (FFAppState().guest != null &&
                        FFAppState().guest != '') {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('measurement_instruction_page');
                        },
                        child: wrapWithModel(
                          model: _model.bannerModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: BannerWidget(
                            title: 'Your Key to Health',
                            description:
                                'Uroflowmetry: Your Key to Better Health and Comprehensive Insights.',
                            buttonTitle: 'Proceed to Measurement',
                          ),
                        ),
                      );
                    } else {
                      return Builder(
                        builder: (context) {
                          if (_model.initFull != null &&
                              (_model.initFull)!.isNotEmpty) {
                            return Builder(
                              builder: (context) {
                                if (_model.initFull!.first.usages > 0) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          'measurement_instruction_page');
                                    },
                                    child: wrapWithModel(
                                      model: _model.bannerModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BannerWidget(
                                        title:
                                            '${_model.initFull?.first?.usages?.toString()} Tests Left',
                                        description:
                                            'Uroflowmetry: You have ${_model.initFull?.first?.usages?.toString()} tests left before we generate your detailed report.',
                                        buttonTitle: 'Proceed to Measurement',
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
                                      _model.apiResultog8 =
                                          await PaymentUserCall.call(
                                        authToken: currentJwtToken,
                                      );

                                      await launchURL(
                                          PaymentModelStruct.maybeFromMap(
                                                  (_model.apiResultog8
                                                          ?.jsonBody ??
                                                      ''))!
                                              .url);

                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.bannerModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BannerWidget(
                                        title: 'Upgrade Subscription',
                                        description:
                                            'Uroflowmetry: Unlock Deeper Insights with a 10-Measurement Package!',
                                        buttonTitle:
                                            'Get a Package for \$14.99',
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    FFAppConstants.appbarpadding,
                                    0.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                  child: Text(
                    'Understanding Uroflowmetry',
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
                if (FFAppConstants.baseUrl == 'rrrrr')
                  Builder(
                    builder: (context) {
                      final listContent = _model.getContent?.toList() ?? [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listContent.length,
                        itemBuilder: (context, listContentIndex) {
                          final listContentItem = listContent[listContentIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'details_page',
                                queryParameters: {
                                  'title': serializeParam(
                                    listContentItem.title,
                                    ParamType.String,
                                  ),
                                  'text': serializeParam(
                                    listContentItem.text,
                                    ParamType.String,
                                  ),
                                  'video': serializeParam(
                                    listContentItem.video,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        FFAppConstants.appbarpadding,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      listContentItem.image!,
                                      width: double.infinity,
                                      height: 164.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      listContentItem.title,
                                      'title',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        FFAppConstants.appbarpadding,
                        0.0,
                      )),
                  child: Builder(
                    builder: (context) {
                      final listContent1 =
                          _model.getContent?.map((e) => e).toList()?.toList() ??
                              [];

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(listContent1.length,
                            (listContent1Index) {
                          final listContent1Item =
                              listContent1[listContent1Index];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'details_page',
                                queryParameters: {
                                  'title': serializeParam(
                                    listContent1Item.title,
                                    ParamType.String,
                                  ),
                                  'text': serializeParam(
                                    listContent1Item.title,
                                    ParamType.String,
                                  ),
                                  'video': serializeParam(
                                    listContent1Item.video,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        FFAppConstants.appbarpadding,
                                        0.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      listContent1Item.image!,
                                      width: double.infinity,
                                      height: 164.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      listContent1Item.title,
                                      'title',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
