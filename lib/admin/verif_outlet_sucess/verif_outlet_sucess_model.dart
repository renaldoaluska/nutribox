import '/admin/navbars/navbars_widget.dart';
import '/admin/verifoutlet_success/verifoutlet_success_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verif_outlet_sucess_widget.dart' show VerifOutletSucessWidget;
import 'package:flutter/material.dart';

class VerifOutletSucessModel extends FlutterFlowModel<VerifOutletSucessWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for verifoutlet_success component.
  late VerifoutletSuccessModel verifoutletSuccessModel;
  // Model for Navbars component.
  late NavbarsModel navbarsModel;

  @override
  void initState(BuildContext context) {
    verifoutletSuccessModel =
        createModel(context, () => VerifoutletSuccessModel());
    navbarsModel = createModel(context, () => NavbarsModel());
  }

  @override
  void dispose() {
    verifoutletSuccessModel.dispose();
    navbarsModel.dispose();
  }
}
