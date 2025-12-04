import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_cart_page_widget.dart' show MyCartPageWidget;
import 'package:flutter/material.dart';

class MyCartPageModel extends FlutterFlowModel<MyCartPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<UserCartsRecord, bool> checkboxValueMap = {};
  List<UserCartsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  DateTime? datePicked;
  // State field(s) for NoteField widget.
  FocusNode? noteFieldFocusNode;
  TextEditingController? noteFieldTextController;
  String? Function(BuildContext, String?)? noteFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? orderBaru;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PackagesRecord? paketLengkap;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    noteFieldFocusNode?.dispose();
    noteFieldTextController?.dispose();
  }
}
