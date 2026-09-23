import '../database.dart';

class ViewUserDashboardTable extends SupabaseTable<ViewUserDashboardRow> {
  @override
  String get tableName => 'view_user_dashboard';

  @override
  ViewUserDashboardRow createRow(Map<String, dynamic> data) =>
      ViewUserDashboardRow(data);
}

class ViewUserDashboardRow extends SupabaseDataRow {
  ViewUserDashboardRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserDashboardTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get xpPoints => getField<int>('xp_points');
  set xpPoints(int? value) => setField<int>('xp_points', value);

  String? get userLevel => getField<String>('user_level');
  set userLevel(String? value) => setField<String>('user_level', value);

  double? get totalSavings => getField<double>('total_savings');
  set totalSavings(double? value) => setField<double>('total_savings', value);

  String? get baselineSupermarketId =>
      getField<String>('baseline_supermarket_id');
  set baselineSupermarketId(String? value) =>
      setField<String>('baseline_supermarket_id', value);

  int? get nextLevelXp => getField<int>('next_level_xp');
  set nextLevelXp(int? value) => setField<int>('next_level_xp', value);
}
