// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? street,
    String? rt,
    String? rw,
    int? pos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _street = street,
        _rt = rt,
        _rw = rw,
        _pos = pos,
        super(firestoreUtilData);

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;

  bool hasStreet() => _street != null;

  // "rt" field.
  String? _rt;
  String get rt => _rt ?? '';
  set rt(String? val) => _rt = val;

  bool hasRt() => _rt != null;

  // "rw" field.
  String? _rw;
  String get rw => _rw ?? '';
  set rw(String? val) => _rw = val;

  bool hasRw() => _rw != null;

  // "pos" field.
  int? _pos;
  int get pos => _pos ?? 0;
  set pos(int? val) => _pos = val;

  void incrementPos(int amount) => pos = pos + amount;

  bool hasPos() => _pos != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        street: data['street'] as String?,
        rt: data['rt'] as String?,
        rw: data['rw'] as String?,
        pos: castToType<int>(data['pos']),
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'street': _street,
        'rt': _rt,
        'rw': _rw,
        'pos': _pos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'rt': serializeParam(
          _rt,
          ParamType.String,
        ),
        'rw': serializeParam(
          _rw,
          ParamType.String,
        ),
        'pos': serializeParam(
          _pos,
          ParamType.int,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        rt: deserializeParam(
          data['rt'],
          ParamType.String,
          false,
        ),
        rw: deserializeParam(
          data['rw'],
          ParamType.String,
          false,
        ),
        pos: deserializeParam(
          data['pos'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        street == other.street &&
        rt == other.rt &&
        rw == other.rw &&
        pos == other.pos;
  }

  @override
  int get hashCode => const ListEquality().hash([street, rt, rw, pos]);
}

AddressStruct createAddressStruct({
  String? street,
  String? rt,
  String? rw,
  int? pos,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      street: street,
      rt: rt,
      rw: rw,
      pos: pos,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
