import '/admin/navbars/navbars_widget.dart';
import '/admin/payment_success/payment_success_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_verification_sucess_gapake_widget.dart'
    show PaymentVerificationSucessGapakeWidget;
import 'package:flutter/material.dart';

class PaymentVerificationSucessGapakeModel
    extends FlutterFlowModel<PaymentVerificationSucessGapakeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for payment_success component.
  late PaymentSuccessModel paymentSuccessModel;
  // Model for Navbars component.
  late NavbarsModel navbarsModel;

  @override
  void initState(BuildContext context) {
    paymentSuccessModel = createModel(context, () => PaymentSuccessModel());
    navbarsModel = createModel(context, () => NavbarsModel());
  }

  @override
  void dispose() {
    paymentSuccessModel.dispose();
    navbarsModel.dispose();
  }
}
