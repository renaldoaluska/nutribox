import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender_ref" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "type" field.
  MessageType? _type;
  MessageType? get type => _type;
  bool hasType() => _type != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _type = snapshotData['type'] is MessageType
        ? snapshotData['type']
        : deserializeEnum<MessageType>(snapshotData['type']);
    _text = snapshotData['text'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isRead = snapshotData['is_read'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? senderRef,
  MessageType? type,
  String? text,
  String? imageUrl,
  LatLng? location,
  DateTime? timestamp,
  bool? isRead,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender_ref': senderRef,
      'type': type,
      'text': text,
      'image_url': imageUrl,
      'location': location,
      'timestamp': timestamp,
      'is_read': isRead,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.senderRef == e2?.senderRef &&
        e1?.type == e2?.type &&
        e1?.text == e2?.text &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.location == e2?.location &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isRead == e2?.isRead;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.senderRef,
        e?.type,
        e?.text,
        e?.imageUrl,
        e?.location,
        e?.timestamp,
        e?.isRead
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
