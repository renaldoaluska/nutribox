import '/admin/tab_bar_admin/tab_bar_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nyoba/admin_home/admin_home_widget.dart';
import 'admin_home_page_widget.dart' show AdminHomePageWidget;
import 'package:flutter/material.dart';

class AdminHomePageModel extends FlutterFlowModel<AdminHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for admin_home component.
  late AdminHomeModel adminHomeModel;
  // Model for Tab_bar_admin component.
  late TabBarAdminModel tabBarAdminModel;

  @override
  void initState(BuildContext context) {
    adminHomeModel = createModel(context, () => AdminHomeModel());
    tabBarAdminModel = createModel(context, () => TabBarAdminModel());
  }

  @override
  void dispose() {
    adminHomeModel.dispose();
    tabBarAdminModel.dispose();
  }
}
