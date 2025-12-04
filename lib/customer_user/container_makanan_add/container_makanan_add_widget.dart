import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'container_makanan_add_model.dart';
export 'container_makanan_add_model.dart';

class ContainerMakananAddWidget extends StatefulWidget {
  const ContainerMakananAddWidget({
    super.key,
    this.imgPackage,
    this.namaPackage,
    this.descPackage,
    this.hargaPackage,
    this.refPackage,
  });

  final String? imgPackage;
  final String? namaPackage;
  final String? descPackage;
  final double? hargaPackage;
  final DocumentReference? refPackage;

  @override
  State<ContainerMakananAddWidget> createState() =>
      _ContainerMakananAddWidgetState();
}

class _ContainerMakananAddWidgetState extends State<ContainerMakananAddWidget> {
  late ContainerMakananAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContainerMakananAddModel());

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
