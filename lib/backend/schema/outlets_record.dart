import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OutletsRecord extends FirestoreRecord {
  OutletsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "geo" field.
  LatLng? _geo;
  LatLng? get geo => _geo;
  bool hasGeo() => _geo != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "status" field.
  OutletStatus? _status;
  OutletStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "harga_per_km" field.
  double? _hargaPerKm;
  double get hargaPerKm => _hargaPerKm ?? 0.0;
  bool hasHargaPerKm() => _hargaPerKm != null;

  // "status_outlet_buka_tutup" field.
  StatusOutletBukaTutup? _statusOutletBukaTutup;
  StatusOutletBukaTutup? get statusOutletBukaTutup => _statusOutletBukaTutup;
  bool hasStatusOutletBukaTutup() => _statusOutletBukaTutup != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _geo = snapshotData['geo'] as LatLng?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _desc = snapshotData['desc'] as String?;
    _status = snapshotData['status'] is OutletStatus
        ? snapshotData['status']
        : deserializeEnum<OutletStatus>(snapshotData['status']);
    _hargaPerKm = castToType<double>(snapshotData['harga_per_km']);
    _statusOutletBukaTutup =
        snapshotData['status_outlet_buka_tutup'] is StatusOutletBukaTutup
            ? snapshotData['status_outlet_buka_tutup']
            : deserializeEnum<StatusOutletBukaTutup>(
                snapshotData['status_outlet_buka_tutup']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('outlets');

  static Stream<OutletsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutletsRecord.fromSnapshot(s));

  static Future<OutletsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OutletsRecord.fromSnapshot(s));

  static OutletsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OutletsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutletsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutletsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutletsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutletsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutletsRecordData({
  String? name,
  DocumentReference? ownerRef,
  String? address,
  LatLng? geo,
  DateTime? createdAt,
  String? photoUrl,
  String? desc,
  OutletStatus? status,
  double? hargaPerKm,
  StatusOutletBukaTutup? statusOutletBukaTutup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'owner_ref': ownerRef,
      'address': address,
      'geo': geo,
      'created_at': createdAt,
      'photo_url': photoUrl,
      'desc': desc,
      'status': status,
      'harga_per_km': hargaPerKm,
      'status_outlet_buka_tutup': statusOutletBukaTutup,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutletsRecordDocumentEquality implements Equality<OutletsRecord> {
  const OutletsRecordDocumentEquality();

  @override
  bool equals(OutletsRecord? e1, OutletsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.ownerRef == e2?.ownerRef &&
        e1?.address == e2?.address &&
        e1?.geo == e2?.geo &&
        e1?.createdAt == e2?.createdAt &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.desc == e2?.desc &&
        e1?.status == e2?.status &&
        e1?.hargaPerKm == e2?.hargaPerKm &&
        e1?.statusOutletBukaTutup == e2?.statusOutletBukaTutup;
  }

  @override
  int hash(OutletsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.ownerRef,
        e?.address,
        e?.geo,
        e?.createdAt,
        e?.photoUrl,
        e?.desc,
        e?.status,
        e?.hargaPerKm,
        e?.statusOutletBukaTutup
      ]);

  @override
  bool isValidKey(Object? o) => o is OutletsRecord;
}
