import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_Ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  bool hasCustomerRef() => _customerRef != null;

  // "outlet_ref" field.
  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  bool hasOutletRef() => _outletRef != null;

  // "total_amount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  // "scheduled_At" field.
  DateTime? _scheduledAt;
  DateTime? get scheduledAt => _scheduledAt;
  bool hasScheduledAt() => _scheduledAt != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "address_ref" field.
  DocumentReference? _addressRef;
  DocumentReference? get addressRef => _addressRef;
  bool hasAddressRef() => _addressRef != null;

  void _initializeFields() {
    _customerRef = snapshotData['customer_Ref'] as DocumentReference?;
    _outletRef = snapshotData['outlet_ref'] as DocumentReference?;
    _totalAmount = castToType<double>(snapshotData['total_amount']);
    _status = snapshotData['status'] is Status
        ? snapshotData['status']
        : deserializeEnum<Status>(snapshotData['status']);
    _scheduledAt = snapshotData['scheduled_At'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _addressRef = snapshotData['address_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? customerRef,
  DocumentReference? outletRef,
  double? totalAmount,
  Status? status,
  DateTime? scheduledAt,
  String? notes,
  DateTime? createdAt,
  DateTime? updatedAt,
  DocumentReference? addressRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_Ref': customerRef,
      'outlet_ref': outletRef,
      'total_amount': totalAmount,
      'status': status,
      'scheduled_At': scheduledAt,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'address_ref': addressRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.customerRef == e2?.customerRef &&
        e1?.outletRef == e2?.outletRef &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.status == e2?.status &&
        e1?.scheduledAt == e2?.scheduledAt &&
        e1?.notes == e2?.notes &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.addressRef == e2?.addressRef;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.customerRef,
        e?.outletRef,
        e?.totalAmount,
        e?.status,
        e?.scheduledAt,
        e?.notes,
        e?.createdAt,
        e?.updatedAt,
        e?.addressRef
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
