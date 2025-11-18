import '/admin/customer_order1/customer_order1_widget.dart';
import '/admin/customer_order2/customer_order2_widget.dart';
import '/admin/customer_order3/customer_order3_widget.dart';
import '/admin/customer_search/customer_search_widget.dart';
import '/admin/navbars/navbars_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cust_order_page_model.dart';
export 'cust_order_page_model.dart';

class CustOrderPageWidget extends StatefulWidget {
  const CustOrderPageWidget({super.key});

  static String routeName = 'cust_order_page';
  static String routePath = '/custOrderPage';

  @override
  State<CustOrderPageWidget> createState() => _CustOrderPageWidgetState();
}

class _CustOrderPageWidgetState extends State<CustOrderPageWidget> {
  late CustOrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustOrderPageModel());

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
        backgroundColor: Color(0xFFFFFDF9),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Customer Order',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF1F2937),
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFE8C00),
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.customerSearchModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomerSearchWidget(),
                        ),
                        wrapWithModel(
                          model: _model.customerOrder1Model,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomerOrder1Widget(),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: wrapWithModel(
                            model: _model.customerOrder3Model,
                            updateCallback: () => safeSetState(() {}),
                            child: CustomerOrder3Widget(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.customerOrder2Model,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomerOrder2Widget(),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 393.19,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.navbarsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarsWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
