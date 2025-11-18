import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verif_outlet_page_widget.dart' show VerifOutletPageWidget;
import 'package:flutter/material.dart';

class VerifOutletPageModel extends FlutterFlowModel<VerifOutletPageWidget> {
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
