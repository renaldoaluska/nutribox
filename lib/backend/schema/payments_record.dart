import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "payment_id" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "order_ref" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "method" field.
  PaymentMethod? _method;
  PaymentMethod? get method => _method;
  bool hasMethod() => _method != null;

  // "status" field.
  PaymentStatus? _status;
  PaymentStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "receipt_url" field.
  String? _receiptUrl;
  String get receiptUrl => _receiptUrl ?? '';
  bool hasReceiptUrl() => _receiptUrl != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _paymentId = snapshotData['payment_id'] as String?;
    _orderRef = snapshotData['order_ref'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _method = snapshotData['method'] is PaymentMethod
        ? snapshotData['method']
        : deserializeEnum<PaymentMethod>(snapshotData['method']);
    _status = snapshotData['status'] is PaymentStatus
        ? snapshotData['status']
        : deserializeEnum<PaymentStatus>(snapshotData['status']);
    _receiptUrl = snapshotData['receipt_url'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  String? paymentId,
  DocumentReference? orderRef,
  double? amount,
  PaymentMethod? method,
  PaymentStatus? status,
  String? receiptUrl,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'payment_id': paymentId,
      'order_ref': orderRef,
      'amount': amount,
      'method': method,
      'status': status,
      'receipt_url': receiptUrl,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.paymentId == e2?.paymentId &&
        e1?.orderRef == e2?.orderRef &&
        e1?.amount == e2?.amount &&
        e1?.method == e2?.method &&
        e1?.status == e2?.status &&
        e1?.receiptUrl == e2?.receiptUrl &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.paymentId,
        e?.orderRef,
        e?.amount,
        e?.method,
        e?.status,
        e?.receiptUrl,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
