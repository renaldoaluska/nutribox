import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_verification_widget.dart' show PaymentVerificationWidget;
import 'package:flutter/material.dart';

class PaymentVerificationModel
    extends FlutterFlowModel<PaymentVerificationWidget> {
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
