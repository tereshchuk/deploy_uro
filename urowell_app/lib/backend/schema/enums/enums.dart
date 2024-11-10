import 'package:collection/collection.dart';

enum TypeUsers {
  full,
  guest,
}

enum TypeSex {
  Male,
  Female,
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
    case (TypeUsers):
      return TypeUsers.values.deserialize(value) as T?;
    case (TypeSex):
      return TypeSex.values.deserialize(value) as T?;
    default:
      return null;
  }
}
