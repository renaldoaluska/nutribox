import '/flutter_flow/flutter_flow_util.dart';
import '/merchant/tab_bar_outlet/tab_bar_outlet_widget.dart';
import '/index.dart';
import 'a_home_merchant_widget.dart' show AHomeMerchantWidget;
import 'package:flutter/material.dart';

class AHomeMerchantModel extends FlutterFlowModel<AHomeMerchantWidget> {
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
