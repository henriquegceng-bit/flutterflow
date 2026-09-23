import '../database.dart';

class ShoppingTripsTable extends SupabaseTable<ShoppingTripsRow> {
  @override
  String get tableName => 'shopping_trips';

  @override
  ShoppingTripsRow createRow(Map<String, dynamic> data) =>
      ShoppingTripsRow(data);
}

class ShoppingTripsRow extends SupabaseDataRow {
  ShoppingTripsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShoppingTripsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get listId => getField<String>('list_id')!;
  set listId(String value) => setField<String>('list_id', value);

  String? get comboName => getField<String>('combo_name');
  set comboName(String? value) => setField<String>('combo_name', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);

  double? get totalCost => getField<double>('total_cost');
  set totalCost(double? value) => setField<double>('total_cost', value);
}
