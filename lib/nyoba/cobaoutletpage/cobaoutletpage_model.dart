import '/flutter_flow/flutter_flow_util.dart';
import '/nyoba/cobaoutlet/cobaoutlet_widget.dart';
import 'cobaoutletpage_widget.dart' show CobaoutletpageWidget;
import 'package:flutter/material.dart';

class CobaoutletpageModel extends FlutterFlowModel<CobaoutletpageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for cobaoutlet component.
  late CobaoutletModel cobaoutletModel;

  @override
  void initState(BuildContext context) {
    cobaoutletModel = createModel(context, () => CobaoutletModel());
  }

  @override
  void dispose() {
    cobaoutletModel.dispose();
  }
}
