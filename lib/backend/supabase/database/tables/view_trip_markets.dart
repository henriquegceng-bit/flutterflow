import '../database.dart';

class ViewTripMarketsTable extends SupabaseTable<ViewTripMarketsRow> {
  @override
  String get tableName => 'view_trip_markets';

  @override
  ViewTripMarketsRow createRow(Map<String, dynamic> data) =>
      ViewTripMarketsRow(data);
}

class ViewTripMarketsRow extends SupabaseDataRow {
  ViewTripMarketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewTripMarketsTable();

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String? get supermarketId => getField<String>('supermarket_id');
  set supermarketId(String? value) => setField<String>('supermarket_id', value);

  String? get supermarketName => getField<String>('supermarket_name');
  set supermarketName(String? value) =>
      setField<String>('supermarket_name', value);
}
