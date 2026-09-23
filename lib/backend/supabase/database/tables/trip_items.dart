import '../database.dart';

class TripItemsTable extends SupabaseTable<TripItemsRow> {
  @override
  String get tableName => 'trip_items';

  @override
  TripItemsRow createRow(Map<String, dynamic> data) => TripItemsRow(data);
}

class TripItemsRow extends SupabaseDataRow {
  TripItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripItemsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String? get supermarketId => getField<String>('supermarket_id');
  set supermarketId(String? value) => setField<String>('supermarket_id', value);

  String? get genericItemId => getField<String>('generic_item_id');
  set genericItemId(String? value) =>
      setField<String>('generic_item_id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  double? get targetQuantity => getField<double>('target_quantity');
  set targetQuantity(double? value) =>
      setField<double>('target_quantity', value);

  double? get packagesNeeded => getField<double>('packages_needed');
  set packagesNeeded(double? value) =>
      setField<double>('packages_needed', value);

  double? get actualPackages => getField<double>('actual_packages');
  set actualPackages(double? value) =>
      setField<double>('actual_packages', value);

  double? get unitPrice => getField<double>('unit_price');
  set unitPrice(double? value) => setField<double>('unit_price', value);

  bool? get isInCart => getField<bool>('is_in_cart');
  set isInCart(bool? value) => setField<bool>('is_in_cart', value);

  String? get customName => getField<String>('custom_name');
  set customName(String? value) => setField<String>('custom_name', value);
}
