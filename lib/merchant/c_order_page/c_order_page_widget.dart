import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/merchant/tab_bar_outlet/tab_bar_outlet_widget.dart';
import '/merchant/x_card_order_page/x_card_order_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'c_order_page_model.dart';
export 'c_order_page_model.dart';

/// Build a mobile Merchant Order List Page for a catering merchant app using
/// a clean white + orange theme.
///
/// Palette: BG #FFFDF9, Card #FFFFFF, Primary #F4A259, Border #F2E8DA, Text
/// #1F2937, Subtext #6B7280. Use Inter, radius 16–20, spacing 8–12, soft
/// shadow.
///
/// Header: title “Pesanan”, search icon on the right.
///
/// Tabs: segmented tabs: Hari Ini, Mendatang, Langganan, Event. Active tab in
/// Primary orange.
///
/// Order List:
/// Show a vertical list of compact rounded white cards. Each card includes a
/// pastel circular icon on the LEFT, then Order ID + type, customer name
/// (bold), date + timeslot + porsi, and a status chip on the right.
/// Type icons:
///
/// Normal: pastel orange clock
///
/// Subscription: pastel green calendar
///
/// Event: pastel blue building
/// Add a chat icon on the right inside the card to open chat for that order.
///
/// Bottom Navigation: white bar with Home, Pesanan, Merchant Saya, Profil.
/// Pesanan MUST be the active tab and its icon MUST be in Primary #F4A259.
class COrderPageWidget extends StatefulWidget {
  const COrderPageWidget({super.key});

  static String routeName = 'C_Order_Page';
  static String routePath = '/outlet/OrderPage';

  @override
  State<COrderPageWidget> createState() => _COrderPageWidgetState();
}

class _COrderPageWidgetState extends State<COrderPageWidget> {
  late COrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => COrderPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OutletsRecord>>(
      stream: queryOutletsRecord(
        queryBuilder: (outletsRecord) => outletsRecord.where(
          'owner_ref',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFFFFDF9),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFFF8C00),
                  ),
                ),
              ),
            ),
          );
        }
        List<OutletsRecord> cOrderPageOutletsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final cOrderPageOutletsRecord = cOrderPageOutletsRecordList.isNotEmpty
            ? cOrderPageOutletsRecordList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFFFFDF9),
            appBar: AppBar(
              backgroundColor: Color(0xFFFFFDF9),
              automaticallyImplyLeading: false,
              title: Text(
                'Pesanan',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
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
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 16.0,
                    borderWidth: 1.0,
                    buttonSize: 44.0,
                    fillColor: Color(0xFFF4A259),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      if (currentUserDocument?.role == UserRole.outlet) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 16.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData(valueOrDefault<String>(
                                    Status.dikonfirmasi.name,
                                    'Dikonfirmasi',
                                  )),
                                  ChipData(Status.diproses.name),
                                  ChipData(Status.sedang_dikirim.name),
                                  ChipData(Status.telah_dikirim.name),
                                  ChipData(Status.selesai.name),
                                  ChipData(Status.dibatalkan.name),
                                  ChipData(Status.menunggu_pembayaran.name)
                                ],
                                onChanged: (val) async {
                                  safeSetState(() => _model.choiceChipsValue =
                                      val?.firstOrNull);
                                  _model.statusFilter =
                                      _model.choiceChipsValue!;
                                  safeSetState(() {});
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFF4A259),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF6B7280),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  iconColor: Color(0xFF6B7280),
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  elevation: 1.0,
                                  borderColor: Color(0xFFF2E8DA),
                                  borderWidth: 1.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                chipSpacing: 8.0,
                                rowSpacing: 8.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [Status.menunggu_pembayaran.name],
                                ),
                                wrapped: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 100.0),
                              child: StreamBuilder<List<OrdersRecord>>(
                                stream: queryOrdersRecord(
                                  queryBuilder: (ordersRecord) =>
                                      ordersRecord.where(
                                    'outlet_ref',
                                    isEqualTo:
                                        cOrderPageOutletsRecord?.reference,
                                  ),
                                ),
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
                                  List<OrdersRecord> listViewOrdersRecordList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewOrdersRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewOrdersRecord =
                                          listViewOrdersRecordList[
                                              listViewIndex];
                                      return StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewOrdersRecord.customerRef!),
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

                                          final xCardOrderPageUsersRecord =
                                              snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                DOrderDetailWidget.routeName,
                                                queryParameters: {
                                                  'id': serializeParam(
                                                    listViewOrdersRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: XCardOrderPageWidget(
                                              key: Key(
                                                  'Keyn5t_${listViewIndex}_of_${listViewOrdersRecordList.length}'),
                                              namaCustomer:
                                                  xCardOrderPageUsersRecord
                                                      .displayName,
                                              timeStamp: dateTimeFormat(
                                                  "d/M H:mm",
                                                  listViewOrdersRecord
                                                      .createdAt),
                                              idPesanan: listViewOrdersRecord
                                                  .reference.id,
                                              statusPesanan:
                                                  listViewOrdersRecord.status!,
                                              warnaStatus:
                                                  functions.getStatusColor(
                                                      listViewOrdersRecord
                                                          .status)!,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Text(
                          'Anda tidak terautentikasi',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        );
                      }
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              color: Color(0x1A000000),
                              offset: Offset(
                                0.0,
                                -2.0,
                              ),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.tabBarOutletModel,
                              updateCallback: () => safeSetState(() {}),
                              child: TabBarOutletWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
