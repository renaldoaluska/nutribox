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

  // "type" field.
  OrderType? _type;
  OrderType? get type => _type;
  bool hasType() => _type != null;

  // "total_amount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  // "payment_status" field.
  PaymentStatus? _paymentStatus;
  PaymentStatus? get paymentStatus => _paymentStatus;
  bool hasPaymentStatus() => _paymentStatus != null;

  // "delivery_type" field.
  DeliveryType? _deliveryType;
  DeliveryType? get deliveryType => _deliveryType;
  bool hasDeliveryType() => _deliveryType != null;

  // "scheduled_At" field.
  DateTime? _scheduledAt;
  DateTime? get scheduledAt => _scheduledAt;
  bool hasScheduledAt() => _scheduledAt != null;

  // "subscription_start_date" field.
  DateTime? _subscriptionStartDate;
  DateTime? get subscriptionStartDate => _subscriptionStartDate;
  bool hasSubscriptionStartDate() => _subscriptionStartDate != null;

  // "subscription_end_date" field.
  DateTime? _subscriptionEndDate;
  DateTime? get subscriptionEndDate => _subscriptionEndDate;
  bool hasSubscriptionEndDate() => _subscriptionEndDate != null;

  // "scheduled" field.
  String? _scheduled;
  String get scheduled => _scheduled ?? '';
  bool hasScheduled() => _scheduled != null;

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

  void _initializeFields() {
    _customerRef = snapshotData['customer_Ref'] as DocumentReference?;
    _outletRef = snapshotData['outlet_ref'] as DocumentReference?;
    _type = snapshotData['type'] is OrderType
        ? snapshotData['type']
        : deserializeEnum<OrderType>(snapshotData['type']);
    _totalAmount = castToType<double>(snapshotData['total_amount']);
    _status = snapshotData['status'] is Status
        ? snapshotData['status']
        : deserializeEnum<Status>(snapshotData['status']);
    _paymentStatus = snapshotData['payment_status'] is PaymentStatus
        ? snapshotData['payment_status']
        : deserializeEnum<PaymentStatus>(snapshotData['payment_status']);
    _deliveryType = snapshotData['delivery_type'] is DeliveryType
        ? snapshotData['delivery_type']
        : deserializeEnum<DeliveryType>(snapshotData['delivery_type']);
    _scheduledAt = snapshotData['scheduled_At'] as DateTime?;
    _subscriptionStartDate =
        snapshotData['subscription_start_date'] as DateTime?;
    _subscriptionEndDate = snapshotData['subscription_end_date'] as DateTime?;
    _scheduled = snapshotData['scheduled'] as String?;
    _notes = snapshotData['notes'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
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
  OrderType? type,
  double? totalAmount,
  Status? status,
  PaymentStatus? paymentStatus,
  DeliveryType? deliveryType,
  DateTime? scheduledAt,
  DateTime? subscriptionStartDate,
  DateTime? subscriptionEndDate,
  String? scheduled,
  String? notes,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_Ref': customerRef,
      'outlet_ref': outletRef,
      'type': type,
      'total_amount': totalAmount,
      'status': status,
      'payment_status': paymentStatus,
      'delivery_type': deliveryType,
      'scheduled_At': scheduledAt,
      'subscription_start_date': subscriptionStartDate,
      'subscription_end_date': subscriptionEndDate,
      'scheduled': scheduled,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
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
        e1?.type == e2?.type &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.status == e2?.status &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.deliveryType == e2?.deliveryType &&
        e1?.scheduledAt == e2?.scheduledAt &&
        e1?.subscriptionStartDate == e2?.subscriptionStartDate &&
        e1?.subscriptionEndDate == e2?.subscriptionEndDate &&
        e1?.scheduled == e2?.scheduled &&
        e1?.notes == e2?.notes &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.customerRef,
        e?.outletRef,
        e?.type,
        e?.totalAmount,
        e?.status,
        e?.paymentStatus,
        e?.deliveryType,
        e?.scheduledAt,
        e?.subscriptionStartDate,
        e?.subscriptionEndDate,
        e?.scheduled,
        e?.notes,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
