import '../database.dart';

class LegalTable extends SupabaseTable<LegalRow> {
  @override
  String get tableName => 'legal';

  @override
  LegalRow createRow(Map<String, dynamic> data) => LegalRow(data);
}

class LegalRow extends SupabaseDataRow {
  LegalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LegalTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get file => getField<String>('file');
  set file(String? value) => setField<String>('file', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  String? get iconsPng => getField<String>('icons_png');
  set iconsPng(String? value) => setField<String>('icons_png', value);
}
