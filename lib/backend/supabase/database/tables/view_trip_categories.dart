import '../database.dart';

class ViewTripCategoriesTable extends SupabaseTable<ViewTripCategoriesRow> {
  @override
  String get tableName => 'view_trip_categories';

  @override
  ViewTripCategoriesRow createRow(Map<String, dynamic> data) =>
      ViewTripCategoriesRow(data);
}

class ViewTripCategoriesRow extends SupabaseDataRow {
  ViewTripCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewTripCategoriesTable();

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String? get supermarketId => getField<String>('supermarket_id');
  set supermarketId(String? value) => setField<String>('supermarket_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);
}
