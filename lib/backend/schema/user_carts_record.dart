import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCartsRecord extends FirestoreRecord {
  UserCartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "package_ref" field.
  DocumentReference? _packageRef;
  DocumentReference? get packageRef => _packageRef;
  bool hasPackageRef() => _packageRef != null;

  // "outlet_ref" field.
  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  bool hasOutletRef() => _outletRef != null;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  bool hasQty() => _qty != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "is_checked" field.
  bool? _isChecked;
  bool get isChecked => _isChecked ?? false;
  bool hasIsChecked() => _isChecked != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _packageRef = snapshotData['package_ref'] as DocumentReference?;
    _outletRef = snapshotData['outlet_ref'] as DocumentReference?;
    _qty = castToType<int>(snapshotData['qty']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isChecked = snapshotData['is_checked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_carts');

  static Stream<UserCartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCartsRecord.fromSnapshot(s));

  static Future<UserCartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCartsRecord.fromSnapshot(s));

  static UserCartsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCartsRecordData({
  DocumentReference? userRef,
  DocumentReference? packageRef,
  DocumentReference? outletRef,
  int? qty,
  DateTime? createdTime,
  bool? isChecked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'package_ref': packageRef,
      'outlet_ref': outletRef,
      'qty': qty,
      'created_time': createdTime,
      'is_checked': isChecked,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCartsRecordDocumentEquality implements Equality<UserCartsRecord> {
  const UserCartsRecordDocumentEquality();

  @override
  bool equals(UserCartsRecord? e1, UserCartsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.packageRef == e2?.packageRef &&
        e1?.outletRef == e2?.outletRef &&
        e1?.qty == e2?.qty &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isChecked == e2?.isChecked;
  }

  @override
  int hash(UserCartsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.packageRef,
        e?.outletRef,
        e?.qty,
        e?.createdTime,
        e?.isChecked
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCartsRecord;
}
