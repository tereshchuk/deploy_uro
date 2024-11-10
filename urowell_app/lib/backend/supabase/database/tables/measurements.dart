import '../database.dart';

class MeasurementsTable extends SupabaseTable<MeasurementsRow> {
  @override
  String get tableName => 'measurements';

  @override
  MeasurementsRow createRow(Map<String, dynamic> data) => MeasurementsRow(data);
}

class MeasurementsRow extends SupabaseDataRow {
  MeasurementsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MeasurementsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get device => getField<String>('device');
  set device(String? value) => setField<String>('device', value);

  dynamic? get dataField => getField<dynamic>('data');
  set dataField(dynamic? value) => setField<dynamic>('data', value);

  DateTime? get finishedAt => getField<DateTime>('finished_at');
  set finishedAt(DateTime? value) => setField<DateTime>('finished_at', value);

  String? get completionTrigger => getField<String>('completion_trigger');
  set completionTrigger(String? value) =>
      setField<String>('completion_trigger', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get externalUserId => getField<int>('external_user_id');
  set externalUserId(int? value) => setField<int>('external_user_id', value);
}
