import '/admin/customer_search/customer_search_widget.dart';
import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cust_order_page_widget.dart' show CustOrderPageWidget;
import 'package:flutter/material.dart';

class CustOrderPageModel extends FlutterFlowModel<CustOrderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customer_search component.
  late CustomerSearchModel customerSearchModel;
  // Model for Navbars component.
  late NavbarsModel navbarsModel;

  @override
  void initState(BuildContext context) {
    customerSearchModel = createModel(context, () => CustomerSearchModel());
    navbarsModel = createModel(context, () => NavbarsModel());
  }

  @override
  void dispose() {
    customerSearchModel.dispose();
    navbarsModel.dispose();
  }
}
