import '../database.dart';

class ViewShoppingListDetailsTable
    extends SupabaseTable<ViewShoppingListDetailsRow> {
  @override
  String get tableName => 'view_shopping_list_details';

  @override
  ViewShoppingListDetailsRow createRow(Map<String, dynamic> data) =>
      ViewShoppingListDetailsRow(data);
}

class ViewShoppingListDetailsRow extends SupabaseDataRow {
  ViewShoppingListDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewShoppingListDetailsTable();

  String? get listItemId => getField<String>('list_item_id');
  set listItemId(String? value) => setField<String>('list_item_id', value);

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  double? get targetQuantity => getField<double>('target_quantity');
  set targetQuantity(double? value) =>
      setField<double>('target_quantity', value);

  String? get itemName => getField<String>('item_name');
  set itemName(String? value) => setField<String>('item_name', value);

  String? get defaultUnit => getField<String>('default_unit');
  set defaultUnit(String? value) => setField<String>('default_unit', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get genericItemId => getField<String>('generic_item_id');
  set genericItemId(String? value) =>
      setField<String>('generic_item_id', value);
}
