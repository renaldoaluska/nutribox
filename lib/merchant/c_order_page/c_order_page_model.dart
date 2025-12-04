import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/merchant/tab_bar_outlet/tab_bar_outlet_widget.dart';
import '/index.dart';
import 'c_order_page_widget.dart' show COrderPageWidget;
import 'package:flutter/material.dart';

class COrderPageModel extends FlutterFlowModel<COrderPageWidget> {
  ///  Local state fields for this page.

  String statusFilter = 'dikonfirmasi';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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
