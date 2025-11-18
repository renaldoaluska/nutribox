import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notifi_id" field.
  String? _notifiId;
  String get notifiId => _notifiId ?? '';
  bool hasNotifiId() => _notifiId != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "type" field.
  NotificationType? _type;
  NotificationType? get type => _type;
  bool hasType() => _type != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _notifiId = snapshotData['notifi_id'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _type = snapshotData['type'] is NotificationType
        ? snapshotData['type']
        : deserializeEnum<NotificationType>(snapshotData['type']);
    _isRead = snapshotData['is_read'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notifiId,
  DocumentReference? userRef,
  String? title,
  String? body,
  NotificationType? type,
  bool? isRead,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notifi_id': notifiId,
      'user_ref': userRef,
      'title': title,
      'body': body,
      'type': type,
      'is_read': isRead,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.notifiId == e2?.notifiId &&
        e1?.userRef == e2?.userRef &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        e1?.type == e2?.type &&
        e1?.isRead == e2?.isRead &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.notifiId,
        e?.userRef,
        e?.title,
        e?.body,
        e?.type,
        e?.isRead,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
