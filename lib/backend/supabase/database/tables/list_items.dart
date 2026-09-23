import '../database.dart';

class ListItemsTable extends SupabaseTable<ListItemsRow> {
  @override
  String get tableName => 'list_items';

  @override
  ListItemsRow createRow(Map<String, dynamic> data) => ListItemsRow(data);
}

class ListItemsRow extends SupabaseDataRow {
  ListItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListItemsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get genericItemId => getField<String>('generic_item_id');
  set genericItemId(String? value) =>
      setField<String>('generic_item_id', value);

  double get targetQuantity => getField<double>('target_quantity')!;
  set targetQuantity(double value) =>
      setField<double>('target_quantity', value);

  String? get customItemName => getField<String>('custom_item_name');
  set customItemName(String? value) =>
      setField<String>('custom_item_name', value);
}
