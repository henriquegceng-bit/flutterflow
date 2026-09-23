import '../database.dart';

class GenericItemsTable extends SupabaseTable<GenericItemsRow> {
  @override
  String get tableName => 'generic_items';

  @override
  GenericItemsRow createRow(Map<String, dynamic> data) => GenericItemsRow(data);
}

class GenericItemsRow extends SupabaseDataRow {
  GenericItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GenericItemsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get defaultUnit => getField<String>('default_unit');
  set defaultUnit(String? value) => setField<String>('default_unit', value);

  double? get defaultIncrement => getField<double>('default_increment');
  set defaultIncrement(double? value) =>
      setField<double>('default_increment', value);
}
