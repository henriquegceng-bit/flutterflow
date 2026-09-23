import '../database.dart';

class ViewLiveTripItemsTable extends SupabaseTable<ViewLiveTripItemsRow> {
  @override
  String get tableName => 'view_live_trip_items';

  @override
  ViewLiveTripItemsRow createRow(Map<String, dynamic> data) =>
      ViewLiveTripItemsRow(data);
}

class ViewLiveTripItemsRow extends SupabaseDataRow {
  ViewLiveTripItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewLiveTripItemsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String? get supermarketId => getField<String>('supermarket_id');
  set supermarketId(String? value) => setField<String>('supermarket_id', value);

  String? get supermarketName => getField<String>('supermarket_name');
  set supermarketName(String? value) =>
      setField<String>('supermarket_name', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get genericItemId => getField<String>('generic_item_id');
  set genericItemId(String? value) =>
      setField<String>('generic_item_id', value);

  String? get genericName => getField<String>('generic_name');
  set genericName(String? value) => setField<String>('generic_name', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get brand => getField<String>('brand');
  set brand(String? value) => setField<String>('brand', value);

  double? get targetQuantity => getField<double>('target_quantity');
  set targetQuantity(double? value) =>
      setField<double>('target_quantity', value);

  double? get packagesNeeded => getField<double>('packages_needed');
  set packagesNeeded(double? value) =>
      setField<double>('packages_needed', value);

  double? get actualPackages => getField<double>('actual_packages');
  set actualPackages(double? value) =>
      setField<double>('actual_packages', value);

  String? get defaultUnit => getField<String>('default_unit');
  set defaultUnit(String? value) => setField<String>('default_unit', value);

  double? get packageVolume => getField<double>('package_volume');
  set packageVolume(double? value) => setField<double>('package_volume', value);

  double? get liveUnitPrice => getField<double>('live_unit_price');
  set liveUnitPrice(double? value) =>
      setField<double>('live_unit_price', value);

  double? get liveTotalCost => getField<double>('live_total_cost');
  set liveTotalCost(double? value) =>
      setField<double>('live_total_cost', value);

  DateTime? get liveLastScanDate => getField<DateTime>('live_last_scan_date');
  set liveLastScanDate(DateTime? value) =>
      setField<DateTime>('live_last_scan_date', value);

  double? get calculatedTotalVolume =>
      getField<double>('calculated_total_volume');
  set calculatedTotalVolume(double? value) =>
      setField<double>('calculated_total_volume', value);

  double? get livePricePerUnit => getField<double>('live_price_per_unit');
  set livePricePerUnit(double? value) =>
      setField<double>('live_price_per_unit', value);

  bool? get isInCart => getField<bool>('is_in_cart');
  set isInCart(bool? value) => setField<bool>('is_in_cart', value);

  bool? get isCustom => getField<bool>('is_custom');
  set isCustom(bool? value) => setField<bool>('is_custom', value);

  bool? get isFavorite => getField<bool>('is_favorite');
  set isFavorite(bool? value) => setField<bool>('is_favorite', value);

  bool? get hasCheaperAlternative => getField<bool>('has_cheaper_alternative');
  set hasCheaperAlternative(bool? value) =>
      setField<bool>('has_cheaper_alternative', value);

  bool? get isPriceOutdated => getField<bool>('is_price_outdated');
  set isPriceOutdated(bool? value) =>
      setField<bool>('is_price_outdated', value);
}
