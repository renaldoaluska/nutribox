import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

Color? getStatusColor(Status? status) {
  switch (status) {
    case 'menunggu_pembayaran':
      return Color(0xFFFFC107); // Amber/Kuning (Warning/Waiting)

    case 'dikonfirmasi':
      return Color(0xFF42A5F5); // Biru Muda (Info)

    case 'diproses':
      return Color(0xFF1E88E5); // Biru (Active)

    case 'sedang_dikirim':
      return Color(0xFFAB47BC); // Ungu (Transit)

    case 'telah_dikirim':
      return Color(0xFF26A69A); // Teal/Tosca (Arrived)

    case 'selesai':
      return Color(0xFF4CAF50); // Hijau (Success)

    case 'dibatalkan':
      return Color(0xFFE53935); // Merah (Danger/Error)

    default:
      return Color(0xFF9E9E9E); // Abu-abu (Kalo status ga dikenal/error)
  }
}

Color? getVerifyOutletColor(OutletStatus? status) {
  switch (status) {
    case 'pending':
      return Color(0xFFFFC107); // Amber/Kuning (Warning/Waiting)

    case 'verified':
      return Color(0xFF4CAF50); // Hijau (Success)

    case 'rejected':
      return Color(0xFFE53935); // Merah (Danger/Error)

    default:
      return Color(0xFF9E9E9E); // Abu-abu (Kalo status ga dikenal/error)
  }
}

Color? getVerifyPaymentColor(PaymentStatus? status) {
  switch (status) {
    case 'pending':
      return Color(0xFFFFC107); // Amber/Kuning (Warning/Waiting)

    case 'unpaid':
      return Color(0xFF42A5F5); // Biru Muda (Info)

    case 'refund':
      return Color(0xFFAB47BC); // Ungu (Transit)

    case 'paid':
      return Color(0xFF4CAF50); // Hijau (Success)

    case 'failed':
      return Color(0xFFE53935); // Merah (Danger/Error)

    default:
      return Color(0xFF9E9E9E); // Abu-abu (Kalo status ga dikenal/error)
  }
}

dynamic calculateCartTotal(
  List<UserCartsRecord> myCart,
  List<PackagesRecord> allPackages,
  LatLng outletLoc,
  LatLng customerLoc,
  double costPerKm,
) {
  double itemSubtotal = 0.0;
  double shippingCost = 0.0;
  double grandTotal = 0.0;
  double distanceKm = 0.0;

  // --- 1. HITUNG HARGA BARANG ---
  for (var cartItem in myCart) {
    if (cartItem.packageRef != null) {
      try {
        var matchingPackage = allPackages
            .firstWhere((pkg) => pkg.reference == cartItem.packageRef);
        itemSubtotal += (matchingPackage.pricePerUnit * cartItem.qty);
      } catch (e) {
        // skip
      }
    }
  }

  // --- 2. HITUNG JARAK (HAVERSINE) ---
  var p = 0.017453292519943295;
  var c = math.cos;
  var a = 0.5 -
      c((customerLoc.latitude - outletLoc.latitude) * p) / 2 +
      c(outletLoc.latitude * p) *
          c(customerLoc.latitude * p) *
          (1 - c((customerLoc.longitude - outletLoc.longitude) * p)) /
          2;
  double rawDistance = 12742 * math.asin(math.sqrt(a));

  // Kita ambil 1 desimal aja biar rapi tapi tetep real
  // Misal: 1.2345 -> 1.2 km.
  // Misal: 1.567 -> 1.6 km.
  distanceKm = double.parse(rawDistance.toStringAsFixed(1));

  // --- LOGIC MINIMUM 1 KM ---
  // Kalau jarak di bawah 1 km, kita anggep 1 km.
  // Kalau jarak 1.2 km, ya tetep 1.2 km (gak dibuletin ke 2).
  if (distanceKm < 1.0) {
    distanceKm = 1.0;
  }

  // --- 3. HITUNG ONGKIR ---
  // Rumus: Jarak Real x Harga
  double rawShipping = distanceKm * costPerKm;

  // --- HILANGIN KOMA (CEILING) ---
  // Misal hasil: 6250.5 -> Jadi 6251.0
  // Misal hasil: 7000.1 -> Jadi 7001.0
  shippingCost = rawShipping.ceilToDouble();

  grandTotal = itemSubtotal + shippingCost;

  return {
    "subtotal": itemSubtotal,
    "shipping": shippingCost,
    "total": grandTotal,
    "km": distanceKm
  };
}
