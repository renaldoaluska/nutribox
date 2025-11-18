import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "package_type" field.
  PackageType? _packageType;
  PackageType? get packageType => _packageType;
  bool hasPackageType() => _packageType != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _pricePerUnit = castToType<double>(snapshotData['price_per_unit']);
    _minQty = castToType<int>(snapshotData['min_qty']);
    _available = snapshotData['available'] as bool?;
    _imageUrl = snapshotData['image_url'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _packageType = snapshotData['package_type'] is PackageType
        ? snapshotData['package_type']
        : deserializeEnum<PackageType>(snapshotData['package_type']);
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('packages')
          : FirebaseFirestore.instance.collectionGroup('packages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('packages').doc(id);

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
  String? imageUrl,
  DateTime? createdAt,
  PackageType? packageType,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price_per_unit': pricePerUnit,
      'min_qty': minQty,
      'available': available,
      'image_url': imageUrl,
      'created_at': createdAt,
      'package_type': packageType,
      'photo_url': photoUrl,
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
        e1?.imageUrl == e2?.imageUrl &&
        e1?.createdAt == e2?.createdAt &&
        e1?.packageType == e2?.packageType &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(PackagesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.pricePerUnit,
        e?.minQty,
        e?.available,
        e?.imageUrl,
        e?.createdAt,
        e?.packageType,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is PackagesRecord;
}
