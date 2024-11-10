import '../database.dart';

class DoctorsTable extends SupabaseTable<DoctorsRow> {
  @override
  String get tableName => 'doctors';

  @override
  DoctorsRow createRow(Map<String, dynamic> data) => DoctorsRow(data);
}

class DoctorsRow extends SupabaseDataRow {
  DoctorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DoctorsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get clinic => getField<String>('clinic');
  set clinic(String? value) => setField<String>('clinic', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get reviewerName => getField<String>('reviewer_name');
  set reviewerName(String? value) => setField<String>('reviewer_name', value);

  String? get reviewerEmail => getField<String>('reviewer_email');
  set reviewerEmail(String? value) => setField<String>('reviewer_email', value);
}
