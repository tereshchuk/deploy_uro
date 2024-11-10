import '../database.dart';

class ContentTable extends SupabaseTable<ContentRow> {
  @override
  String get tableName => 'content';

  @override
  ContentRow createRow(Map<String, dynamic> data) => ContentRow(data);
}

class ContentRow extends SupabaseDataRow {
  ContentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContentTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);
}
