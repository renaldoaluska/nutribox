import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/modal_map_view/modal_map_view_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map_view_page_model.dart';
export 'map_view_page_model.dart';

/// Create a new screen named "Delivery Status Page".
///
/// The background should be a static white layout (no map view). At the top,
/// add a custom header with:  A back arrow button on the top left,  Centered
/// title text: "Delivered your order".  Below the header, display a static
/// delivery route image or icon placeholders representing the delivery path.
/// At the bottom of the screen, include a bottom modal-style view with the
/// following layout:  A delivery person info section showing:  Circular
/// profile picture,  Name: Cristopert Dastin,  ID: 213752,  Two action icons:
/// Chat and Call.  A Delivery Time section with icons and estimated time:
/// Estimated 8:30 - 9:15 PM.  An Order Summary section showing:  Order items:
/// 2 Burger With Meat  Total: $283.  Design should use white and black
/// backgrounds, rounded corners, and orange accent colors for icons and
/// buttons.
class MapViewPageWidget extends StatefulWidget {
  const MapViewPageWidget({super.key});

  static String routeName = 'Map_View_page';
  static String routePath = '/mapViewPage';

  @override
  State<MapViewPageWidget> createState() => _MapViewPageWidgetState();
}

class _MapViewPageWidgetState extends State<MapViewPageWidget> {
  late MapViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapViewPageModel());

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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Image.asset(
                              'assets/images/Map.png',
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 44.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 1200.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).orange,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                            HomePageWidget.routeName);
                                      },
                                    ),
                                    Text(
                                      'Delivered your order',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Container(
                                      width: 40.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: wrapWithModel(
                model: _model.modalMapViewModel,
                updateCallback: () => safeSetState(() {}),
                child: ModalMapViewWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
