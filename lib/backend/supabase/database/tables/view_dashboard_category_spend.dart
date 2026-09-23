import '../database.dart';

class ViewDashboardCategorySpendTable
    extends SupabaseTable<ViewDashboardCategorySpendRow> {
  @override
  String get tableName => 'view_dashboard_category_spend';

  @override
  ViewDashboardCategorySpendRow createRow(Map<String, dynamic> data) =>
      ViewDashboardCategorySpendRow(data);
}

class ViewDashboardCategorySpendRow extends SupabaseDataRow {
  ViewDashboardCategorySpendRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewDashboardCategorySpendTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  double? get totalSpent => getField<double>('total_spent');
  set totalSpent(double? value) => setField<double>('total_spent', value);
}
