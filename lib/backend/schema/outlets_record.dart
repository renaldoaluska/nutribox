import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

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

  // "lead_time_days" field.
  int? _leadTimeDays;
  int get leadTimeDays => _leadTimeDays ?? 0;
  bool hasLeadTimeDays() => _leadTimeDays != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

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

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _geo = snapshotData['geo'] as LatLng?;
    _leadTimeDays = castToType<int>(snapshotData['lead_time_days']);
    _rating = castToType<int>(snapshotData['rating']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _desc = snapshotData['desc'] as String?;
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
  int? leadTimeDays,
  int? rating,
  DateTime? createdAt,
  String? photoUrl,
  String? desc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'owner_ref': ownerRef,
      'address': address,
      'geo': geo,
      'lead_time_days': leadTimeDays,
      'rating': rating,
      'created_at': createdAt,
      'photo_url': photoUrl,
      'desc': desc,
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
        e1?.leadTimeDays == e2?.leadTimeDays &&
        e1?.rating == e2?.rating &&
        e1?.createdAt == e2?.createdAt &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.desc == e2?.desc;
  }

  @override
  int hash(OutletsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.ownerRef,
        e?.address,
        e?.geo,
        e?.leadTimeDays,
        e?.rating,
        e?.createdAt,
        e?.photoUrl,
        e?.desc
      ]);

  @override
  bool isValidKey(Object? o) => o is OutletsRecord;
}
