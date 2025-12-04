import '/admin/customer_order1/customer_order1_widget.dart';
import '/admin/customer_search/customer_search_widget.dart';
import '/admin/navbars/navbars_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (currentUserDocument?.role == UserRole.admin) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
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
                              StreamBuilder<List<OrdersRecord>>(
                                stream: queryOrdersRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFFFF8C00),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<OrdersRecord> wrapOrdersRecordList =
                                      snapshot.data!;

                                  return Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(
                                        wrapOrdersRecordList.length,
                                        (wrapIndex) {
                                      final wrapOrdersRecord =
                                          wrapOrdersRecordList[wrapIndex];
                                      return StreamBuilder<OutletsRecord>(
                                        stream: OutletsRecord.getDocument(
                                            wrapOrdersRecord.outletRef!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xFFFF8C00),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final columnOutletsRecord =
                                              snapshot.data!;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    wrapOrdersRecord
                                                        .customerRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0xFFFF8C00),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final customerOrder1UsersRecord =
                                                      snapshot.data!;

                                                  return CustomerOrder1Widget(
                                                    key: Key(
                                                        'Key01h_${wrapIndex}_of_${wrapOrdersRecordList.length}'),
                                                    namaCust:
                                                        customerOrder1UsersRecord
                                                            .displayName,
                                                    tanggalPesan:
                                                        wrapOrdersRecord
                                                            .createdAt
                                                            ?.toString(),
                                                    namaOutlet:
                                                        columnOutletsRecord
                                                            .name,
                                                    nomorID: wrapOrdersRecord
                                                        .reference.id,
                                                    warnaStatus: functions
                                                        .getStatusColor(
                                                            wrapOrdersRecord
                                                                .status)!,
                                                    status: wrapOrdersRecord
                                                        .status!,
                                                    totalBayar: wrapOrdersRecord
                                                        .totalAmount
                                                        .toString(),
                                                    refKeOrder: wrapOrdersRecord
                                                        .reference,
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }),
                                  );
                                },
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 393.2,
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
                );
              } else {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Anda Tidak Terverifikasi Sebagai Admin!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
