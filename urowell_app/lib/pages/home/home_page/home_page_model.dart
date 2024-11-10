import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/component/banner/banner_widget.dart';
import '/backend/schema/structs/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in home_page widget.
  List<UsersRow>? initFull;
  // Stores action output result for [Backend Call - Query Rows] action in home_page widget.
  List<LocationsRow>? locationFull;
  // Stores action output result for [Backend Call - Query Rows] action in home_page widget.
  List<ContentRow>? getContent;
  // Model for banner component.
  late BannerModel bannerModel1;
  // Model for banner component.
  late BannerModel bannerModel2;
  // Model for banner component.
  late BannerModel bannerModel3;
  // Stores action output result for [Backend Call - API (paymentUser)] action in banner widget.
  ApiCallResponse? apiResultog8;

  @override
  void initState(BuildContext context) {
    bannerModel1 = createModel(context, () => BannerModel());
    bannerModel2 = createModel(context, () => BannerModel());
    bannerModel3 = createModel(context, () => BannerModel());
  }

  @override
  void dispose() {
    bannerModel1.dispose();
    bannerModel2.dispose();
    bannerModel3.dispose();
  }
}
