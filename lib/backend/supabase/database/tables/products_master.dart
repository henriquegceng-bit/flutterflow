import '../database.dart';

class ProductsMasterTable extends SupabaseTable<ProductsMasterRow> {
  @override
  String get tableName => 'products_master';

  @override
  ProductsMasterRow createRow(Map<String, dynamic> data) =>
      ProductsMasterRow(data);
}

class ProductsMasterRow extends SupabaseDataRow {
  ProductsMasterRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsMasterTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get genericItemId => getField<String>('generic_item_id');
  set genericItemId(String? value) =>
      setField<String>('generic_item_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get brand => getField<String>('brand');
  set brand(String? value) => setField<String>('brand', value);

  String? get barcode => getField<String>('barcode');
  set barcode(String? value) => setField<String>('barcode', value);

  String? get measurementUnit => getField<String>('measurement_unit');
  set measurementUnit(String? value) =>
      setField<String>('measurement_unit', value);

  double? get volume => getField<double>('volume');
  set volume(double? value) => setField<double>('volume', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get observation => getField<String>('observation');
  set observation(String? value) => setField<String>('observation', value);
}
