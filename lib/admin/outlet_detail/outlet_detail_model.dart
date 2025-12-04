import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'outlet_detail_widget.dart' show OutletDetailWidget;
import 'package:flutter/material.dart';

class OutletDetailModel extends FlutterFlowModel<OutletDetailWidget> {
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
