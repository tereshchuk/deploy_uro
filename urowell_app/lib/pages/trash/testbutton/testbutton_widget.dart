import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'testbutton_model.dart';
export 'testbutton_model.dart';

class TestbuttonWidget extends StatefulWidget {
  const TestbuttonWidget({super.key});

  @override
  State<TestbuttonWidget> createState() => _TestbuttonWidgetState();
}

class _TestbuttonWidgetState extends State<TestbuttonWidget> {
  late TestbuttonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestbuttonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFF530C0C),
      ),
    );
  }
}
