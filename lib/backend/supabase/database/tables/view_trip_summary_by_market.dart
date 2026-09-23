import '../database.dart';

class ViewTripSummaryByMarketTable
    extends SupabaseTable<ViewTripSummaryByMarketRow> {
  @override
  String get tableName => 'view_trip_summary_by_market';

  @override
  ViewTripSummaryByMarketRow createRow(Map<String, dynamic> data) =>
      ViewTripSummaryByMarketRow(data);
}

class ViewTripSummaryByMarketRow extends SupabaseDataRow {
  ViewTripSummaryByMarketRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewTripSummaryByMarketTable();

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String? get supermarketId => getField<String>('supermarket_id');
  set supermarketId(String? value) => setField<String>('supermarket_id', value);

  String? get supermarketName => getField<String>('supermarket_name');
  set supermarketName(String? value) =>
      setField<String>('supermarket_name', value);

  int? get totalItems => getField<int>('total_items');
  set totalItems(int? value) => setField<int>('total_items', value);

  int? get itemsInCart => getField<int>('items_in_cart');
  set itemsInCart(int? value) => setField<int>('items_in_cart', value);

  double? get totalEstimatedValue => getField<double>('total_estimated_value');
  set totalEstimatedValue(double? value) =>
      setField<double>('total_estimated_value', value);

  double? get currentCartValue => getField<double>('current_cart_value');
  set currentCartValue(double? value) =>
      setField<double>('current_cart_value', value);
}
