import '../database.dart';

class LocationsTable extends SupabaseTable<LocationsRow> {
  @override
  String get tableName => 'locations';

  @override
  LocationsRow createRow(Map<String, dynamic> data) => LocationsRow(data);
}

class LocationsRow extends SupabaseDataRow {
  LocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  int? get locationId => getField<int>('location_id');
  set locationId(int? value) => setField<int>('location_id', value);
}
