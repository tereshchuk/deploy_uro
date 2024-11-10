import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_page_model.dart';
export 'splash_screen_page_model.dart';

class SplashScreenPageWidget extends StatefulWidget {
  const SplashScreenPageWidget({super.key});

  @override
  State<SplashScreenPageWidget> createState() => _SplashScreenPageWidgetState();
}

class _SplashScreenPageWidgetState extends State<SplashScreenPageWidget> {
  late SplashScreenPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: Image.asset(
          'assets/images/Orion_Flow_Onboarding_Loading@2x.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
