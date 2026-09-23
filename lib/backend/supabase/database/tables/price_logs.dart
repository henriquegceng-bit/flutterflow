import '../database.dart';

class PriceLogsTable extends SupabaseTable<PriceLogsRow> {
  @override
  String get tableName => 'price_logs';

  @override
  PriceLogsRow createRow(Map<String, dynamic> data) => PriceLogsRow(data);
}

class PriceLogsRow extends SupabaseDataRow {
  PriceLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PriceLogsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get supermarketId => getField<String>('supermarket_id');
  set supermarketId(String? value) => setField<String>('supermarket_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  double? get unitPriceCalculated => getField<double>('unit_price_calculated');
  set unitPriceCalculated(double? value) =>
      setField<double>('unit_price_calculated', value);

  bool? get isPromotion => getField<bool>('is_promotion');
  set isPromotion(bool? value) => setField<bool>('is_promotion', value);

  DateTime? get promotionEndDate => getField<DateTime>('promotion_end_date');
  set promotionEndDate(DateTime? value) =>
      setField<DateTime>('promotion_end_date', value);

  int? get minQuantityForDiscount => getField<int>('min_quantity_for_discount');
  set minQuantityForDiscount(int? value) =>
      setField<int>('min_quantity_for_discount', value);

  double? get bulkPrice => getField<double>('bulk_price');
  set bulkPrice(double? value) => setField<double>('bulk_price', value);

  DateTime? get scanDate => getField<DateTime>('scan_date');
  set scanDate(DateTime? value) => setField<DateTime>('scan_date', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);
}
