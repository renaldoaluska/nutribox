import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_detail_page_widget.dart' show AdminDetailPageWidget;
import 'package:flutter/material.dart';

class AdminDetailPageModel extends FlutterFlowModel<AdminDetailPageWidget> {
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
