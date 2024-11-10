import 'dart:async';

import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/app_bar/app_bar/app_bar_widget.dart';
import '/pages/component/step_widget/step_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'measurement_connectiion_page_model.dart';
export 'measurement_connectiion_page_model.dart';

class MeasurementConnectiionPageWidget extends StatefulWidget {
  const MeasurementConnectiionPageWidget({super.key});

  @override
  State<MeasurementConnectiionPageWidget> createState() =>
      _MeasurementConnectiionPageWidgetState();
}

class _MeasurementConnectiionPageWidgetState
    extends State<MeasurementConnectiionPageWidget> {
  late MeasurementConnectiionPageModel _model;
  String getDevice = "";
  bool _isScanning = false;
  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;
  late StreamSubscription<bool> _isScanningSubscription;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementConnectiionPageModel());

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

      // safeSetState(() {});

      _scanResultsSubscription = FlutterBluePlus.scanResults.listen(
        (results) {
          if (results.isNotEmpty) {
            for (int i = 0; i < results.length; i++) {
              if (results[i].advertisementData.serviceUuids.isNotEmpty &&
                  results[i].advertisementData.serviceUuids.join(', ').length >
                      22 &&
                  results[i]
                          .advertisementData
                          .serviceUuids
                          .join(', ')
                          .substring(0, 8) ==
                      "bf27730d") {
                getDevice =
                    results[i].advertisementData.serviceUuids.join(', ');
              }
            }

            if (getDevice.isNotEmpty) {
              if (getErrorCode(getDevice) == "00") {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Success: ${getDevice}')),
                );
                context.goNamed(
                  'measurement_progress_page',
                  queryParameters: {
                    'serialNumber': serializeParam(
                      getSerialNumber(getDevice),
                      ParamType.String,
                    ),
                    'status': serializeParam(
                      getErrorCode(getDevice),
                      ParamType.String,
                    ),
                    'userid': serializeParam(
                      getUserId(getDevice),
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );

                //  print(
                //"Suucess ${getSerialNumber(getDevice)} ${getUserId(getDevice)} ${getErrorCode(getDevice)}");
              } else if (getErrorCode(getDevice) == "02" ||
                  getDevice.isNotEmpty && getErrorCode(getDevice) == "04") {
                context.goNamed('measurement_error_connectiion_page');
              }
            } else
              print("Error");
          }

          if (mounted) {
            setState(() {});
          }
        },
        onError: (e) {},
      );

      _isScanningSubscription = FlutterBluePlus.isScanning.listen((state) {
        _isScanning = state;
        if (mounted) {
          setState(() {});
        }
      });

      startSignal(_model.initFull?.first.userId?.toString());

      FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 60),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> startSignal(String? userId) async {
    if (await FlutterBlePeripheral().isAdvertising) {
      //await FlutterBlePeripheral().stop();
    } else {
      await FlutterBlePeripheral().start(
          advertiseData: AdvertiseData(
            serviceUuid:
                'bf27730d-0000-0000-0000-0000${int.parse(userId!).toRadixString(16).padLeft(8, '0')}',
            transmissionPowerIncluded: true,
          ),
          advertiseSetParameters: AdvertiseSetParameters(
              legacyMode: true,
              connectable: true,
              scannable: true,
              includeTxPowerLevel: true));
    }
  }

  String getErrorCode(String uuid) {
    final String result =
        uuid.substring(uuid.lastIndexOf('-')).replaceAll(RegExp('-'), '');

    return result.substring(2, 4);
  }

  String getSerialNumber(String uuid) {
    return uuid
        .substring(9, 23)
        .replaceAll(RegExp('-'), '')
        .split('')
        .reversed
        .join();
  }

  int getUserId(String uuid) {
    final String result =
        uuid.substring(uuid.lastIndexOf('-')).replaceAll(RegExp('-'), '');

    final String userIdHex = result.substring(4, result.length);

    return int.parse(userIdHex, radix: 16);
  }

  @override
  void dispose() {
    _model.dispose();
    _scanResultsSubscription.cancel();
    _isScanningSubscription.cancel();
    FlutterBlePeripheral().stop();
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
                  child: const AppBarWidget(
                    back: false,
                    title: 'Measurement',
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
                child: wrapWithModel(
                  model: _model.stepWidgetModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const StepWidgetWidget(
                    title: 'Connection',
                    step: 2,
                    error: false,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 23.0),
                child: CircularPercentIndicator(
                  percent: 0.2,
                  radius: 16.0,
                  lineWidth: 3.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: const Color(0xFF0E5AA6),
                  backgroundColor: const Color(0xFFE6E6E8),
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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  'Establishing a connection with the device',
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
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 24.0, 16.0, 24.0),
                child: Text(
                  'Do not close the application.',
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
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 24.0, 16.0, 24.0),
                child: Text(
                  getDevice.isNotEmpty
                      ? getDevice
                      : 'Do not close the application.',
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
/*
Future<void> stopSignal() async {
  await FlutterBlePeripheral().start(
      advertiseData: AdvertiseData(
        serviceUuid: 'bf27730d-0000-0000-0000-000000000000',
        transmissionPowerIncluded: true,
      ),
      advertiseSetParameters: AdvertiseSetParameters(
          legacyMode: true,
          connectable: true,
          scannable: true,
          includeTxPowerLevel: true));
}
*/