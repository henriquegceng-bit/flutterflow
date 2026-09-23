import '../database.dart';

class ViewTripProductAlternativesTable
    extends SupabaseTable<ViewTripProductAlternativesRow> {
  @override
  String get tableName => 'view_trip_product_alternatives';

  @override
  ViewTripProductAlternativesRow createRow(Map<String, dynamic> data) =>
      ViewTripProductAlternativesRow(data);
}

class ViewTripProductAlternativesRow extends SupabaseDataRow {
  ViewTripProductAlternativesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewTripProductAlternativesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get targetUpdateId => getField<String>('target_update_id');
  set targetUpdateId(String? value) =>
      setField<String>('target_update_id', value);

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String? get familyId => getField<String>('family_id');
  set familyId(String? value) => setField<String>('family_id', value);

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

  String? get defaultUnit => getField<String>('default_unit');
  set defaultUnit(String? value) => setField<String>('default_unit', value);

  double? get packageVolume => getField<double>('package_volume');
  set packageVolume(double? value) => setField<double>('package_volume', value);

  double? get targetQuantity => getField<double>('target_quantity');
  set targetQuantity(double? value) =>
      setField<double>('target_quantity', value);

  double? get actualPackages => getField<double>('actual_packages');
  set actualPackages(double? value) =>
      setField<double>('actual_packages', value);

  double? get liveUnitPrice => getField<double>('live_unit_price');
  set liveUnitPrice(double? value) =>
      setField<double>('live_unit_price', value);

  DateTime? get liveLastScanDate => getField<DateTime>('live_last_scan_date');
  set liveLastScanDate(DateTime? value) =>
      setField<DateTime>('live_last_scan_date', value);

  double? get livePricePerUnit => getField<double>('live_price_per_unit');
  set livePricePerUnit(double? value) =>
      setField<double>('live_price_per_unit', value);

  double? get packagesNeeded => getField<double>('packages_needed');
  set packagesNeeded(double? value) =>
      setField<double>('packages_needed', value);

  double? get liveTotalCost => getField<double>('live_total_cost');
  set liveTotalCost(double? value) =>
      setField<double>('live_total_cost', value);

  double? get calculatedTotalVolume =>
      getField<double>('calculated_total_volume');
  set calculatedTotalVolume(double? value) =>
      setField<double>('calculated_total_volume', value);

  bool? get isCustom => getField<bool>('is_custom');
  set isCustom(bool? value) => setField<bool>('is_custom', value);

  bool? get isFavorite => getField<bool>('is_favorite');
  set isFavorite(bool? value) => setField<bool>('is_favorite', value);

  bool? get hasCheaperAlternative => getField<bool>('has_cheaper_alternative');
  set hasCheaperAlternative(bool? value) =>
      setField<bool>('has_cheaper_alternative', value);

  double? get cheaperAlternativeDiff =>
      getField<double>('cheaper_alternative_diff');
  set cheaperAlternativeDiff(double? value) =>
      setField<double>('cheaper_alternative_diff', value);

  bool? get isPriceOutdated => getField<bool>('is_price_outdated');
  set isPriceOutdated(bool? value) =>
      setField<bool>('is_price_outdated', value);

  String? get priceLogId => getField<String>('price_log_id');
  set priceLogId(String? value) => setField<String>('price_log_id', value);

  int? get confirmsToday => getField<int>('confirms_today');
  set confirmsToday(int? value) => setField<int>('confirms_today', value);

  bool? get userAlreadyConfirmed => getField<bool>('user_already_confirmed');
  set userAlreadyConfirmed(bool? value) =>
      setField<bool>('user_already_confirmed', value);

  bool? get showGreenButton => getField<bool>('show_green_button');
  set showGreenButton(bool? value) =>
      setField<bool>('show_green_button', value);

  bool? get globalIsInCart => getField<bool>('global_is_in_cart');
  set globalIsInCart(bool? value) => setField<bool>('global_is_in_cart', value);

  bool? get enableBlueButton => getField<bool>('enable_blue_button');
  set enableBlueButton(bool? value) =>
      setField<bool>('enable_blue_button', value);
}
