import 'package:collection/collection.dart';

enum Status {
  pending,
  dikonfirmasi,
  diproses,
  sedang_dikirim,
  telah_dikirim,
  selesai,
  menunggu_pembayaran,
  dibatalkan,
}

enum UserRole {
  customer,
  outlet,
  admin,
}

enum PaymentStatus {
  unpaid,
  pending,
  paid,
  refund,
  failed,
}

enum DeliveryType {
  delivery,
  pickup,
}

enum PaymentMethod {
  bank_transfer,
  ewallet,
  cash_on_delivery,
}

enum MessageType {
  text,
  image,
  location,
  file,
}

enum NotificationType {
  order_status,
  chat_message,
  promo,
  system,
}

enum OrderType {
  instant,
  preorder,
  subscription,
}

enum PackageType {
  once,
  subscription,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (UserRole):
      return UserRole.values.deserialize(value) as T?;
    case (PaymentStatus):
      return PaymentStatus.values.deserialize(value) as T?;
    case (DeliveryType):
      return DeliveryType.values.deserialize(value) as T?;
    case (PaymentMethod):
      return PaymentMethod.values.deserialize(value) as T?;
    case (MessageType):
      return MessageType.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (OrderType):
      return OrderType.values.deserialize(value) as T?;
    case (PackageType):
      return PackageType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
