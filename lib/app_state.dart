import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _myCart = prefs
              .getStringList('ff_myCart')
              ?.map((x) {
                try {
                  return CartItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _myCart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _Nav = 0;
  int get Nav => _Nav;
  set Nav(int value) {
    _Nav = value;
  }

  int _Tabbar = 0;
  int get Tabbar => _Tabbar;
  set Tabbar(int value) {
    _Tabbar = value;
  }

  bool _callmic = true;
  bool get callmic => _callmic;
  set callmic(bool value) {
    _callmic = value;
  }

  List<CartItemStruct> _myCart = [];
  List<CartItemStruct> get myCart => _myCart;
  set myCart(List<CartItemStruct> value) {
    _myCart = value;
    prefs.setStringList('ff_myCart', value.map((x) => x.serialize()).toList());
  }

  void addToMyCart(CartItemStruct value) {
    myCart.add(value);
    prefs.setStringList(
        'ff_myCart', _myCart.map((x) => x.serialize()).toList());
  }

  void removeFromMyCart(CartItemStruct value) {
    myCart.remove(value);
    prefs.setStringList(
        'ff_myCart', _myCart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMyCart(int index) {
    myCart.removeAt(index);
    prefs.setStringList(
        'ff_myCart', _myCart.map((x) => x.serialize()).toList());
  }

  void updateMyCartAtIndex(
    int index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    myCart[index] = updateFn(_myCart[index]);
    prefs.setStringList(
        'ff_myCart', _myCart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMyCart(int index, CartItemStruct value) {
    myCart.insert(index, value);
    prefs.setStringList(
        'ff_myCart', _myCart.map((x) => x.serialize()).toList());
  }

  LatLng? _posisiPeta;
  LatLng? get posisiPeta => _posisiPeta;
  set posisiPeta(LatLng? value) {
    _posisiPeta = value;
  }

  /// qty * hargapaket untuk semua paket yg masuk
  double _totalHargaPaket = 0.0;
  double get totalHargaPaket => _totalHargaPaket;
  set totalHargaPaket(double value) {
    _totalHargaPaket = value;
  }

  /// harga kirim di outlet * km
  double _totalHargaKirim = 0.0;
  double get totalHargaKirim => _totalHargaKirim;
  set totalHargaKirim(double value) {
    _totalHargaKirim = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
