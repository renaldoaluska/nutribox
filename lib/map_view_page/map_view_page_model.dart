import '/flutter_flow/flutter_flow_util.dart';
import '/modals/modal_map_view/modal_map_view_widget.dart';
import '/index.dart';
import 'map_view_page_widget.dart' show MapViewPageWidget;
import 'package:flutter/material.dart';

class MapViewPageModel extends FlutterFlowModel<MapViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for modal_map_view component.
  late ModalMapViewModel modalMapViewModel;

  @override
  void initState(BuildContext context) {
    modalMapViewModel = createModel(context, () => ModalMapViewModel());
  }

  @override
  void dispose() {
    modalMapViewModel.dispose();
  }
}
