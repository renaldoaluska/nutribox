import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _packageRef = snapshotData['package_ref'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _pricePerUnit = castToType<double>(snapshotData['price_per_unit']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _notes = snapshotData['notes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('items')
          : FirebaseFirestore.instance.collectionGroup('items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('items').doc(id);

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  DocumentReference? packageRef,
  String? name,
  double? pricePerUnit,
  int? quantity,
  double? subtotal,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'package_ref': packageRef,
      'name': name,
      'price_per_unit': pricePerUnit,
      'quantity': quantity,
      'subtotal': subtotal,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.packageRef == e2?.packageRef &&
        e1?.name == e2?.name &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.quantity == e2?.quantity &&
        e1?.subtotal == e2?.subtotal &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.packageRef,
        e?.name,
        e?.pricePerUnit,
        e?.quantity,
        e?.subtotal,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
