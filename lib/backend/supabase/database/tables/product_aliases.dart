import '../database.dart';

class ProductAliasesTable extends SupabaseTable<ProductAliasesRow> {
  @override
  String get tableName => 'product_aliases';

  @override
  ProductAliasesRow createRow(Map<String, dynamic> data) =>
      ProductAliasesRow(data);
}

class ProductAliasesRow extends SupabaseDataRow {
  ProductAliasesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductAliasesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String get rawName => getField<String>('raw_name')!;
  set rawName(String value) => setField<String>('raw_name', value);
}
