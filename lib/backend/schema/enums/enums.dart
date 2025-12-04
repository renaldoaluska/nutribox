import 'package:collection/collection.dart';

enum Status {
  menunggu_pembayaran,
  terbayar,
  dikonfirmasi,
  diproses,
  sedang_dikirim,
  telah_dikirim,
  selesai,
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

enum PaymentMethod {
  bank_transfer,
  ewallet,
}

enum NotificationType {
  order_status,
  chat_message,
  promo,
  system,
}

enum OutletStatus {
  verified,
  pending,
  rejected,
}

enum StatusOutletBukaTutup {
  Buka,
  Tutup,
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
    case (PaymentMethod):
      return PaymentMethod.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (OutletStatus):
      return OutletStatus.values.deserialize(value) as T?;
    case (StatusOutletBukaTutup):
      return StatusOutletBukaTutup.values.deserialize(value) as T?;
    default:
      return null;
  }
}
