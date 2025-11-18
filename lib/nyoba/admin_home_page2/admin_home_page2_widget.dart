import '/admin/tab_bar_admin/tab_bar_admin_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nyoba/admin_home2/admin_home2_widget.dart';
import 'package:flutter/material.dart';
import 'admin_home_page2_model.dart';
export 'admin_home_page2_model.dart';

class AdminHomePage2Widget extends StatefulWidget {
  const AdminHomePage2Widget({super.key});

  static String routeName = 'admin_home_page2';
  static String routePath = '/admin/home2';

  @override
  State<AdminHomePage2Widget> createState() => _AdminHomePage2WidgetState();
}

class _AdminHomePage2WidgetState extends State<AdminHomePage2Widget> {
  late AdminHomePage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminHomePage2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.adminHome2Model,
                updateCallback: () => safeSetState(() {}),
                child: AdminHome2Widget(),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.tabBarAdminModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TabBarAdminWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
