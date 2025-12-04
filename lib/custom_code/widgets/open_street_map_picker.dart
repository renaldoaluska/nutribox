// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:geolocator/geolocator.dart';

class OpenStreetMapPicker extends StatefulWidget {
  const OpenStreetMapPicker({
    Key? key,
    this.width,
    this.height,
    required this.startLocation,
    this.onMapClick,
    this.readOnlyMode = false, // Defaultnya false (Mode Edit)
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng startLocation;
  final Future<dynamic> Function()? onMapClick;
  final bool readOnlyMode; // Parameter saklar

  @override
  _OpenStreetMapPickerState createState() => _OpenStreetMapPickerState();
}

class _OpenStreetMapPickerState extends State<OpenStreetMapPicker> {
  late final MapController mapController;
  double currentZoom = 15.0;
  late ll.LatLng pickedLocation;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    pickedLocation = ll.LatLng(
      widget.startLocation.latitude,
      widget.startLocation.longitude,
    );
  }

  void _zoom(double movement) {
    final newZoom = currentZoom + movement;
    if (newZoom >= 1 && newZoom <= 18) {
      setState(() {
        currentZoom = newZoom;
      });
      mapController.move(mapController.camera.center, newZoom);
    }
  }

  Future<void> _recenter() async {
    // Kalau read only, tombol ini gak bakal muncul, tapi kita jagain aja
    if (widget.readOnlyMode) return;

    setState(() => _isLoadingLocation = true);

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('Location services disabled.');

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) throw Exception('Denied');
      }

      Position position = await Geolocator.getCurrentPosition();
      final currentPos = ll.LatLng(position.latitude, position.longitude);

      setState(() {
        pickedLocation = currentPos;
        currentZoom = 17.0;
      });

      mapController.move(currentPos, 17.0);

      FFAppState().posisiPeta = LatLng(position.latitude, position.longitude);
      if (widget.onMapClick != null) {
        widget.onMapClick!();
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: pickedLocation,
              initialZoom: currentZoom,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
              // LOGIC SAKLAR DISINI:
              // Kalau ReadOnly: null (gak bisa diklik)
              // Kalau EditMode: function jalan normal
              onTap: widget.readOnlyMode
                  ? null
                  : (tapPosition, point) async {
                      setState(() {
                        pickedLocation = point;
                      });
                      FFAppState().posisiPeta =
                          LatLng(point.latitude, point.longitude);
                      if (widget.onMapClick != null) {
                        await widget.onMapClick!();
                      }
                    },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.flutterflow.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: pickedLocation,
                    width: 50,
                    height: 50,
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.location_on,
                      // Kalau ReadOnly warnanya bedain dikit (misal Biru), kalau Edit Merah
                      color: widget.readOnlyMode ? Colors.blue : Colors.red,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // TOMBOL KONTROL
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                // Tombol MyLocation CUMA MUNCUL kalau BUKAN ReadOnly
                if (!widget.readOnlyMode)
                  FloatingActionButton.small(
                    heroTag: "btnLocation",
                    backgroundColor: Colors.white,
                    onPressed: _isLoadingLocation ? null : _recenter,
                    child: _isLoadingLocation
                        ? SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : Icon(Icons.my_location, color: Colors.black87),
                  ),

                if (!widget.readOnlyMode) SizedBox(height: 10),

                // Tombol Zoom tetep ada di kedua mode (biar user bisa liat detail)
                FloatingActionButton.small(
                  heroTag: "btnZoomIn",
                  backgroundColor: Colors.white,
                  onPressed: () => _zoom(1),
                  child: Icon(Icons.add, color: Colors.black87),
                ),
                SizedBox(height: 10),
                FloatingActionButton.small(
                  heroTag: "btnZoomOut",
                  backgroundColor: Colors.white,
                  onPressed: () => _zoom(-1),
                  child: Icon(Icons.remove, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
