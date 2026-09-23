import '../database.dart';

class SupermarketsTable extends SupabaseTable<SupermarketsRow> {
  @override
  String get tableName => 'supermarkets';

  @override
  SupermarketsRow createRow(Map<String, dynamic> data) => SupermarketsRow(data);
}

class SupermarketsRow extends SupabaseDataRow {
  SupermarketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupermarketsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get chainName => getField<String>('chain_name')!;
  set chainName(String value) => setField<String>('chain_name', value);

  String get branchName => getField<String>('branch_name')!;
  set branchName(String value) => setField<String>('branch_name', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);
}
