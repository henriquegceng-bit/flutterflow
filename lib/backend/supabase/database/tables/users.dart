import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get xpPoints => getField<int>('xp_points');
  set xpPoints(int? value) => setField<int>('xp_points', value);

  String? get userLevel => getField<String>('user_level');
  set userLevel(String? value) => setField<String>('user_level', value);

  double? get trustScore => getField<double>('trust_score');
  set trustScore(double? value) => setField<double>('trust_score', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get baselineSupermarketId =>
      getField<String>('baseline_supermarket_id');
  set baselineSupermarketId(String? value) =>
      setField<String>('baseline_supermarket_id', value);

  double? get totalSavings => getField<double>('total_savings');
  set totalSavings(double? value) => setField<double>('total_savings', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);
}
