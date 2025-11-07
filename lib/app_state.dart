import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

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
}
