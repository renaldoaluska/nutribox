import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tambah_alamat_widget.dart' show TambahAlamatWidget;
import 'package:flutter/material.dart';

class TambahAlamatModel extends FlutterFlowModel<TambahAlamatWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for LabelField widget.
  FocusNode? labelFieldFocusNode;
  TextEditingController? labelFieldTextController;
  String? Function(BuildContext, String?)? labelFieldTextControllerValidator;
  // State field(s) for JalanField widget.
  FocusNode? jalanFieldFocusNode;
  TextEditingController? jalanFieldTextController;
  String? Function(BuildContext, String?)? jalanFieldTextControllerValidator;
  // State field(s) for RtField widget.
  FocusNode? rtFieldFocusNode;
  TextEditingController? rtFieldTextController;
  String? Function(BuildContext, String?)? rtFieldTextControllerValidator;
  // State field(s) for RwField widget.
  FocusNode? rwFieldFocusNode;
  TextEditingController? rwFieldTextController;
  String? Function(BuildContext, String?)? rwFieldTextControllerValidator;
  // State field(s) for KodePosField widget.
  FocusNode? kodePosFieldFocusNode;
  TextEditingController? kodePosFieldTextController;
  String? Function(BuildContext, String?)? kodePosFieldTextControllerValidator;
  // State field(s) for NoTelpField widget.
  FocusNode? noTelpFieldFocusNode;
  TextEditingController? noTelpFieldTextController;
  String? Function(BuildContext, String?)? noTelpFieldTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<AddressesRecord>? oldDefaultAddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    labelFieldFocusNode?.dispose();
    labelFieldTextController?.dispose();

    jalanFieldFocusNode?.dispose();
    jalanFieldTextController?.dispose();

    rtFieldFocusNode?.dispose();
    rtFieldTextController?.dispose();

    rwFieldFocusNode?.dispose();
    rwFieldTextController?.dispose();

    kodePosFieldFocusNode?.dispose();
    kodePosFieldTextController?.dispose();

    noTelpFieldFocusNode?.dispose();
    noTelpFieldTextController?.dispose();
  }
}
