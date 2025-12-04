import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/merchant/x_component_menu_makanan/x_component_menu_makanan_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'g_kelola_paket_model.dart';
export 'g_kelola_paket_model.dart';

/// Build a Kelola Paket page for NutriBox Merchant (UI-only) using a clean
/// white + orange theme.
///
/// Palet: BG #FFFDF9, Card #FFFFFF, Primary #F4A259, Border #F2E8DA, Text
/// #1F2937. Gunakan Inter, radius 16–20, spacing 8–12, soft shadow. Buat
/// halaman scrollable.
///
/// Header: back icon + judul “Kelola Paket”.
///
/// Section A — Paket Langganan: judul section + CTA kecil + Buat Paket
/// Langganan (Primary). Tampilkan daftar paket sebagai compact cards
/// (thumbnail kiri, judul, durasi like “3 hari”, harga per cycle, status
/// pill, kebab menu Edit/Duplicate/Delete). Jika kosong tampilkan ilustrasi +
/// CTA.
///
/// Section B — Paket Event: judul + CTA + Buat Paket Event. Tampilkan list
/// paket event dengan meta: harga per pax, min pax, thumbnail, actions.
///
/// Gunakan card radius 12–16, padding 10–12. Pastikan CTA jelas dan tiap card
/// tap → buka detail/edit. Bottom nav tetap.
class GKelolaPaketWidget extends StatefulWidget {
  const GKelolaPaketWidget({
    super.key,
    this.id,
  });

  final DocumentReference? id;

  static String routeName = 'G_Kelola_Paket';
  static String routePath = '/outlet/KelolaPaket';

  @override
  State<GKelolaPaketWidget> createState() => _GKelolaPaketWidgetState();
}

class _GKelolaPaketWidgetState extends State<GKelolaPaketWidget> {
  late GKelolaPaketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GKelolaPaketModel());

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
          backgroundColor: Color(0xFFFFFDF9),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF1F2937),
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Kelola Paket',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: Color(0xFF1F2937),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (currentUserDocument?.role == UserRole.outlet) {
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: StreamBuilder<List<OutletsRecord>>(
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
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFFF8C00),
                              ),
                            ),
                          ),
                        );
                      }
                      List<OutletsRecord> columnOutletsRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnOutletsRecord =
                          columnOutletsRecordList.isNotEmpty
                              ? columnOutletsRecordList.first
                              : null;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Paket Event',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF1F2937),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context
                                        .pushNamed(HBuatPaketWidget.routeName);
                                  },
                                  text: 'Buat Paket Event',
                                  icon: Icon(
                                    Icons.add_rounded,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48.0,
                                    padding: EdgeInsets.all(8.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: Colors.white,
                                    color: Color(0xFFF4A259),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                StreamBuilder<List<PackagesRecord>>(
                                  stream: queryPackagesRecord(
                                    queryBuilder: (packagesRecord) =>
                                        packagesRecord.where(
                                      'outlet_ref',
                                      isEqualTo: columnOutletsRecord?.reference,
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
                                    List<PackagesRecord>
                                        listViewPackagesRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewPackagesRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewPackagesRecord =
                                            listViewPackagesRecordList[
                                                listViewIndex];
                                        return XComponentMenuMakananWidget(
                                          key: Key(
                                              'Key2el_${listViewIndex}_of_${listViewPackagesRecordList.length}'),
                                          namaPaket:
                                              listViewPackagesRecord.name,
                                          hargaPaket: listViewPackagesRecord
                                              .pricePerUnit,
                                          minPax: listViewPackagesRecord.minQty,
                                          imgUrl:
                                              listViewPackagesRecord.photoUrl,
                                          refPaket:
                                              listViewPackagesRecord.reference,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ]
                              .divide(SizedBox(height: 24.0))
                              .addToStart(SizedBox(height: 16.0))
                              .addToEnd(SizedBox(height: 100.0)),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text(
                  'Anda tidak terautentikasi',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
