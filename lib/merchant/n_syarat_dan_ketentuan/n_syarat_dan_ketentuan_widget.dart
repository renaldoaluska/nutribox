import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'n_syarat_dan_ketentuan_model.dart';
export 'n_syarat_dan_ketentuan_model.dart';

/// Build a Syarat & Ketentuan page for NutriBox Merchant (UI-only).
///
/// Theme: white + orange. Palette: BG #FFFDF9, Card #FFFFFF, Primary #F4A259,
/// Text #1F2937. Use Inter, radius 16–20, spacing 12. Page scrollable.
///
/// Header: back icon + title “Syarat & Ketentuan”.
///
/// Content: one large rounded white card containing long-form text. Use clear
/// hierarchy:
///
/// Section titles (bold)
///
/// Paragraph text (regular)
///
/// Bullet lists
///
/// Divider between sections
/// Provide enough padding (20–24). Do not crop text; allow full scrolling.
///
/// Footer: small note “Dengan menggunakan layanan ini, Anda menyetujui
/// seluruh ketentuan yang berlaku.”
class NSyaratDanKetentuanWidget extends StatefulWidget {
  const NSyaratDanKetentuanWidget({super.key});

  static String routeName = 'N_Syarat_dan_Ketentuan';
  static String routePath = '/outlet/SyaratDanKetentuan';

  @override
  State<NSyaratDanKetentuanWidget> createState() =>
      _NSyaratDanKetentuanWidgetState();
}

class _NSyaratDanKetentuanWidgetState extends State<NSyaratDanKetentuanWidget> {
  late NSyaratDanKetentuanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NSyaratDanKetentuanModel());

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
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Container(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF1F2937),
                  size: 24.0,
                ),
              ),
            ),
          ),
          title: Container(
            child: Text(
              'Syarat & Ketentuan',
              style: GoogleFonts.inter(
                color: Color(0xFF1F2937),
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: Color(0x1A000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1. Ketentuan Umum',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'Dengan menggunakan aplikasi NutriBox Merchant, Anda setuju untuk terikat dengan syarat dan ketentuan yang berlaku. Aplikasi ini dirancang khusus untuk mitra merchant yang ingin bergabung dengan platform NutriBox dalam menyediakan layanan makanan sehat dan bergizi.',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Color(0xFFF3F4F6),
                                  ),
                                  Text(
                                    '2. Persyaratan Merchant',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'Untuk menjadi merchant NutriBox, Anda harus memenuhi persyaratan berikut:',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                  Text(
                                    '• Memiliki izin usaha yang sah dan masih berlaku\n• Menyediakan makanan yang memenuhi standar kesehatan dan gizi\n• Memiliki sertifikat halal untuk produk yang dijual\n• Berkomitmen untuk menjaga kualitas dan kebersihan produk\n• Memiliki kemampuan untuk memenuhi pesanan dalam waktu yang ditentukan',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.6,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Color(0xFFF3F4F6),
                                  ),
                                  Text(
                                    '3. Kewajiban Merchant',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'Sebagai merchant NutriBox, Anda berkewajiban untuk:',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                  Text(
                                    '• Menyediakan informasi produk yang akurat dan lengkap\n• Menjaga kualitas makanan sesuai dengan standar yang ditetapkan\n• Memproses pesanan dengan cepat dan tepat waktu\n• Memberikan pelayanan terbaik kepada pelanggan\n• Melaporkan setiap perubahan informasi bisnis kepada NutriBox\n• Mematuhi semua kebijakan dan prosedur yang ditetapkan',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.6,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Color(0xFFF3F4F6),
                                  ),
                                  Text(
                                    '4. Sistem Pembayaran',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'NutriBox akan melakukan pembayaran kepada merchant berdasarkan ketentuan berikut:',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                  Text(
                                    '• Pembayaran dilakukan setiap minggu untuk pesanan yang telah selesai\n• Komisi platform sebesar 15% dari total nilai pesanan\n• Biaya administrasi dan pajak sesuai dengan ketentuan yang berlaku\n• Pembayaran dilakukan melalui transfer bank yang telah terdaftar\n• Merchant dapat memantau pendapatan melalui dashboard aplikasi',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.6,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Color(0xFFF3F4F6),
                                  ),
                                  Text(
                                    '5. Kebijakan Pembatalan',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'Merchant dapat membatalkan pesanan dalam kondisi tertentu dengan ketentuan:',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                  Text(
                                    '• Pembatalan harus dilakukan maksimal 30 menit setelah pesanan diterima\n• Alasan pembatalan harus jelas dan dapat dipertanggungjawabkan\n• Pembatalan berulang dapat mengakibatkan penangguhan akun\n• Pelanggan akan mendapat notifikasi dan pengembalian dana otomatis\n• Merchant wajib memberikan penjelasan kepada tim customer service',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.6,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Color(0xFFF3F4F6),
                                  ),
                                  Text(
                                    '6. Penangguhan dan Pemutusan',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'NutriBox berhak melakukan penangguhan atau pemutusan kerjasama jika merchant:',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                  Text(
                                    '• Melanggar syarat dan ketentuan yang telah ditetapkan\n• Menerima komplain berulang dari pelanggan\n• Tidak memenuhi standar kualitas yang ditetapkan\n• Melakukan tindakan yang merugikan platform atau pelanggan\n• Tidak responsif terhadap komunikasi dari tim NutriBox',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.6,
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Color(0xFFF3F4F6),
                                  ),
                                  Text(
                                    '7. Perubahan Ketentuan',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    'NutriBox berhak mengubah syarat dan ketentuan ini sewaktu-waktu. Perubahan akan diberitahukan melalui aplikasi dan email terdaftar. Merchant yang tetap menggunakan layanan setelah perubahan dianggap menyetujui ketentuan yang baru.',
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF1F2937),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            child: Text(
                              'Dengan menggunakan layanan ini, Anda menyetujui seluruh ketentuan yang berlaku.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: Color(0xFF6B7280),
                                fontSize: 12.0,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
