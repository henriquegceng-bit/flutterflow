import '../database.dart';

class ViewShoppingListGroupedTable
    extends SupabaseTable<ViewShoppingListGroupedRow> {
  @override
  String get tableName => 'view_shopping_list_grouped';

  @override
  ViewShoppingListGroupedRow createRow(Map<String, dynamic> data) =>
      ViewShoppingListGroupedRow(data);
}

class ViewShoppingListGroupedRow extends SupabaseDataRow {
  ViewShoppingListGroupedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewShoppingListGroupedTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  dynamic get categoriesJson => getField<dynamic>('categories_json');
  set categoriesJson(dynamic value) =>
      setField<dynamic>('categories_json', value);
}
