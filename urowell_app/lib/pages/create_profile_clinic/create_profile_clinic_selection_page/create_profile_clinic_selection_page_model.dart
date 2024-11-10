import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/component/button/button/button_widget.dart';
import 'create_profile_clinic_selection_page_widget.dart'
    show CreateProfileClinicSelectionPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileClinicSelectionPageModel
    extends FlutterFlowModel<CreateProfileClinicSelectionPageWidget> {
  ///  Local state fields for this page.

  String? locationid = '0';

  int? locationindex = 0;

  String? type;

  int? locationNumber;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in create_profile_clinic_selection_page widget.
  List<LocationsRow>? locationList;
  // Model for button component.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
