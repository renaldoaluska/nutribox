import '/customer_user/tab_bar/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'outlet_page_widget.dart' show OutletPageWidget;
import 'package:flutter/material.dart';

class OutletPageModel extends FlutterFlowModel<OutletPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for Tab_bar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    tabBarModel.dispose();
  }
}
