import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'cart_counter_button_model.dart';
export 'cart_counter_button_model.dart';

class CartCounterButtonWidget extends StatefulWidget {
  const CartCounterButtonWidget({
    super.key,
    required this.packageRefNya,
    this.outletRefNya,
    this.qtyNya,
    required this.cartRefNya,
  });

  final DocumentReference? packageRefNya;
  final DocumentReference? outletRefNya;
  final int? qtyNya;
  final DocumentReference? cartRefNya;

  @override
  State<CartCounterButtonWidget> createState() =>
      _CartCounterButtonWidgetState();
}

class _CartCounterButtonWidgetState extends State<CartCounterButtonWidget> {
  late CartCounterButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartCounterButtonModel());

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
