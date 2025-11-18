import '/admin/customer_order1/customer_order1_widget.dart';
import '/admin/customer_order2/customer_order2_widget.dart';
import '/admin/customer_order3/customer_order3_widget.dart';
import '/admin/customer_search/customer_search_widget.dart';
import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cust_order_page_widget.dart' show CustOrderPageWidget;
import 'package:flutter/material.dart';

class CustOrderPageModel extends FlutterFlowModel<CustOrderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customer_search component.
  late CustomerSearchModel customerSearchModel;
  // Model for customer_order1 component.
  late CustomerOrder1Model customerOrder1Model;
  // Model for customer_order3 component.
  late CustomerOrder3Model customerOrder3Model;
  // Model for customer_order2 component.
  late CustomerOrder2Model customerOrder2Model;
  // Model for Navbars component.
  late NavbarsModel navbarsModel;

  @override
  void initState(BuildContext context) {
    customerSearchModel = createModel(context, () => CustomerSearchModel());
    customerOrder1Model = createModel(context, () => CustomerOrder1Model());
    customerOrder3Model = createModel(context, () => CustomerOrder3Model());
    customerOrder2Model = createModel(context, () => CustomerOrder2Model());
    navbarsModel = createModel(context, () => NavbarsModel());
  }

  @override
  void dispose() {
    customerSearchModel.dispose();
    customerOrder1Model.dispose();
    customerOrder3Model.dispose();
    customerOrder2Model.dispose();
    navbarsModel.dispose();
  }
}
