import '../database.dart';

class ViewDashboardMarketSpendTable
    extends SupabaseTable<ViewDashboardMarketSpendRow> {
  @override
  String get tableName => 'view_dashboard_market_spend';

  @override
  ViewDashboardMarketSpendRow createRow(Map<String, dynamic> data) =>
      ViewDashboardMarketSpendRow(data);
}

class ViewDashboardMarketSpendRow extends SupabaseDataRow {
  ViewDashboardMarketSpendRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewDashboardMarketSpendTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get supermarketName => getField<String>('supermarket_name');
  set supermarketName(String? value) =>
      setField<String>('supermarket_name', value);

  double? get totalSpent => getField<double>('total_spent');
  set totalSpent(double? value) => setField<double>('total_spent', value);
}
