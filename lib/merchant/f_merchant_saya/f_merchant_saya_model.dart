import '/flutter_flow/flutter_flow_util.dart';
import '/merchant/tab_bar_outlet/tab_bar_outlet_widget.dart';
import '/index.dart';
import 'f_merchant_saya_widget.dart' show FMerchantSayaWidget;
import 'package:flutter/material.dart';

class FMerchantSayaModel extends FlutterFlowModel<FMerchantSayaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
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
