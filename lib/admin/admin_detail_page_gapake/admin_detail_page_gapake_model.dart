import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_detail_page_gapake_widget.dart' show AdminDetailPageGapakeWidget;
import 'package:flutter/material.dart';

class AdminDetailPageGapakeModel
    extends FlutterFlowModel<AdminDetailPageGapakeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navbars component.
  late NavbarsModel navbarsModel;

  @override
  void initState(BuildContext context) {
    navbarsModel = createModel(context, () => NavbarsModel());
  }

  @override
  void dispose() {
    navbarsModel.dispose();
  }
}
