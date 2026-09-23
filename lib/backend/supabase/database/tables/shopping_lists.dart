import '../database.dart';

class ShoppingListsTable extends SupabaseTable<ShoppingListsRow> {
  @override
  String get tableName => 'shopping_lists';

  @override
  ShoppingListsRow createRow(Map<String, dynamic> data) =>
      ShoppingListsRow(data);
}

class ShoppingListsRow extends SupabaseDataRow {
  ShoppingListsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShoppingListsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get activeTripId => getField<String>('active_trip_id');
  set activeTripId(String? value) => setField<String>('active_trip_id', value);
}
