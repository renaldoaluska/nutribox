import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_cart_page_widget.dart' show MyCartPageWidget;
import 'package:flutter/material.dart';

class MyCartPageModel extends FlutterFlowModel<MyCartPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Model for Tab_bar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarModel.dispose();
  }
}
