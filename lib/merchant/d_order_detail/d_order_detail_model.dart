import '/flutter_flow/flutter_flow_util.dart';
import '/merchant/tab_bar_outlet/tab_bar_outlet_widget.dart';
import 'd_order_detail_widget.dart' show DOrderDetailWidget;
import 'package:flutter/material.dart';

class DOrderDetailModel extends FlutterFlowModel<DOrderDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Tab_Bar_Outlet component.
  late TabBarOutletModel tabBarOutletModel;

  @override
  void initState(BuildContext context) {
    tabBarOutletModel = createModel(context, () => TabBarOutletModel());
  }

  @override
  void dispose() {
    tabBarOutletModel.dispose();
  }
}
