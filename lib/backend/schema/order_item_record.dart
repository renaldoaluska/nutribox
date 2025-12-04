import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemRecord extends FirestoreRecord {
  OrderItemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "package_ref" field.
  DocumentReference? _packageRef;
  DocumentReference? get packageRef => _packageRef;
  bool hasPackageRef() => _packageRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price_per_unit" field.
  double? _pricePerUnit;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "order_ref" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  void _initializeFields() {
    _packageRef = snapshotData['package_ref'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _pricePerUnit = castToType<double>(snapshotData['price_per_unit']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _notes = snapshotData['notes'] as String?;
    _orderRef = snapshotData['order_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order_item');

  static Stream<OrderItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderItemRecord.fromSnapshot(s));

  static Future<OrderItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderItemRecord.fromSnapshot(s));

  static OrderItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderItemRecordData({
  DocumentReference? packageRef,
  String? name,
  double? pricePerUnit,
  int? quantity,
  double? subtotal,
  String? notes,
  DocumentReference? orderRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'package_ref': packageRef,
      'name': name,
      'price_per_unit': pricePerUnit,
      'quantity': quantity,
      'subtotal': subtotal,
      'notes': notes,
      'order_ref': orderRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderItemRecordDocumentEquality implements Equality<OrderItemRecord> {
  const OrderItemRecordDocumentEquality();

  @override
  bool equals(OrderItemRecord? e1, OrderItemRecord? e2) {
    return e1?.packageRef == e2?.packageRef &&
        e1?.name == e2?.name &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.quantity == e2?.quantity &&
        e1?.subtotal == e2?.subtotal &&
        e1?.notes == e2?.notes &&
        e1?.orderRef == e2?.orderRef;
  }

  @override
  int hash(OrderItemRecord? e) => const ListEquality().hash([
        e?.packageRef,
        e?.name,
        e?.pricePerUnit,
        e?.quantity,
        e?.subtotal,
        e?.notes,
        e?.orderRef
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderItemRecord;
}
