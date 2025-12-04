import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'outlet_details_page_widget.dart' show OutletDetailsPageWidget;
import 'package:flutter/material.dart';

class OutletDetailsPageModel extends FlutterFlowModel<OutletDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<UserCartsRecord>? checkCart;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<UserCartsRecord>? itemsToDelete;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
