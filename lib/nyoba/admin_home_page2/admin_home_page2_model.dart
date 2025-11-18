import '/admin/tab_bar_admin/tab_bar_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nyoba/admin_home2/admin_home2_widget.dart';
import 'admin_home_page2_widget.dart' show AdminHomePage2Widget;
import 'package:flutter/material.dart';

class AdminHomePage2Model extends FlutterFlowModel<AdminHomePage2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for admin_home2 component.
  late AdminHome2Model adminHome2Model;
  // Model for Tab_bar_admin component.
  late TabBarAdminModel tabBarAdminModel;

  @override
  void initState(BuildContext context) {
    adminHome2Model = createModel(context, () => AdminHome2Model());
    tabBarAdminModel = createModel(context, () => TabBarAdminModel());
  }

  @override
  void dispose() {
    adminHome2Model.dispose();
    tabBarAdminModel.dispose();
  }
}
