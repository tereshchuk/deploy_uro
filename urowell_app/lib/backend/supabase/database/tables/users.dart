import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  int get usages => getField<int>('usages')!;
  set usages(int value) => setField<int>('usages', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get doctor => getField<String>('doctor');
  set doctor(String? value) => setField<String>('doctor', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get used => getField<int>('used');
  set used(int? value) => setField<int>('used', value);

  bool? get deleted => getField<bool>('deleted');
  set deleted(bool? value) => setField<bool>('deleted', value);
}
