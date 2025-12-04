import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'konfirmasi_bayar_model.dart';
export 'konfirmasi_bayar_model.dart';

/// New Component Gen
class KonfirmasiBayarWidget extends StatefulWidget {
  const KonfirmasiBayarWidget({super.key});

  @override
  State<KonfirmasiBayarWidget> createState() => _KonfirmasiBayarWidgetState();
}

class _KonfirmasiBayarWidgetState extends State<KonfirmasiBayarWidget> {
  late KonfirmasiBayarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KonfirmasiBayarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
