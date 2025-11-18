import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressesRecord extends FirestoreRecord {
  AddressesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  // "default_address" field.
  bool? _defaultAddress;
  bool get defaultAddress => _defaultAddress ?? false;
  bool hasDefaultAddress() => _defaultAddress != null;

  // "geo" field.
  LatLng? _geo;
  LatLng? get geo => _geo;
  bool hasGeo() => _geo != null;

  // "phone_number" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  bool hasLabel() => _label != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _archived = snapshotData['archived'] as bool?;
    _defaultAddress = snapshotData['default_address'] as bool?;
    _geo = snapshotData['geo'] as LatLng?;
    _phoneNumber = castToType<int>(snapshotData['phone_number']);
    _label = snapshotData['label'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _address = snapshotData['address'] is AddressStruct
        ? snapshotData['address']
        : AddressStruct.maybeFromMap(snapshotData['address']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('addresses');

  static Stream<AddressesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddressesRecord.fromSnapshot(s));

  static Future<AddressesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddressesRecord.fromSnapshot(s));

  static AddressesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddressesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddressesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddressesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddressesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddressesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddressesRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? archived,
  bool? defaultAddress,
  LatLng? geo,
  int? phoneNumber,
  String? label,
  DocumentReference? userRef,
  AddressStruct? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'archived': archived,
      'default_address': defaultAddress,
      'geo': geo,
      'phone_number': phoneNumber,
      'label': label,
      'user_ref': userRef,
      'address': AddressStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}

class AddressesRecordDocumentEquality implements Equality<AddressesRecord> {
  const AddressesRecordDocumentEquality();

  @override
  bool equals(AddressesRecord? e1, AddressesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.archived == e2?.archived &&
        e1?.defaultAddress == e2?.defaultAddress &&
        e1?.geo == e2?.geo &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.label == e2?.label &&
        e1?.userRef == e2?.userRef &&
        e1?.address == e2?.address;
  }

  @override
  int hash(AddressesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.archived,
        e?.defaultAddress,
        e?.geo,
        e?.phoneNumber,
        e?.label,
        e?.userRef,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is AddressesRecord;
}
