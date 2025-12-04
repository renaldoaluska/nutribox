import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PackagesRecord extends FirestoreRecord {
  PackagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price_per_unit" field.
  double? _pricePerUnit;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "min_qty" field.
  int? _minQty;
  int get minQty => _minQty ?? 0;
  bool hasMinQty() => _minQty != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "max_qty" field.
  int? _maxQty;
  int get maxQty => _maxQty ?? 0;
  bool hasMaxQty() => _maxQty != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  // "outlet_ref" field.
  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  bool hasOutletRef() => _outletRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _pricePerUnit = castToType<double>(snapshotData['price_per_unit']);
    _minQty = castToType<int>(snapshotData['min_qty']);
    _available = snapshotData['available'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _maxQty = castToType<int>(snapshotData['max_qty']);
    _deleted = snapshotData['deleted'] as bool?;
    _outletRef = snapshotData['outlet_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('packages');

  static Stream<PackagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PackagesRecord.fromSnapshot(s));

  static Future<PackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PackagesRecord.fromSnapshot(s));

  static PackagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PackagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PackagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PackagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PackagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PackagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPackagesRecordData({
  String? name,
  String? description,
  double? pricePerUnit,
  int? minQty,
  bool? available,
  DateTime? createdAt,
  String? photoUrl,
  int? maxQty,
  bool? deleted,
  DocumentReference? outletRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price_per_unit': pricePerUnit,
      'min_qty': minQty,
      'available': available,
      'created_at': createdAt,
      'photo_url': photoUrl,
      'max_qty': maxQty,
      'deleted': deleted,
      'outlet_ref': outletRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PackagesRecordDocumentEquality implements Equality<PackagesRecord> {
  const PackagesRecordDocumentEquality();

  @override
  bool equals(PackagesRecord? e1, PackagesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.minQty == e2?.minQty &&
        e1?.available == e2?.available &&
        e1?.createdAt == e2?.createdAt &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.maxQty == e2?.maxQty &&
        e1?.deleted == e2?.deleted &&
        e1?.outletRef == e2?.outletRef;
  }

  @override
  int hash(PackagesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.pricePerUnit,
        e?.minQty,
        e?.available,
        e?.createdAt,
        e?.photoUrl,
        e?.maxQty,
        e?.deleted,
        e?.outletRef
      ]);

  @override
  bool isValidKey(Object? o) => o is PackagesRecord;
}
