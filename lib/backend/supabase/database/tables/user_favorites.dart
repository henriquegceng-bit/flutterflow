import '../database.dart';

class UserFavoritesTable extends SupabaseTable<UserFavoritesRow> {
  @override
  String get tableName => 'user_favorites';

  @override
  UserFavoritesRow createRow(Map<String, dynamic> data) =>
      UserFavoritesRow(data);
}

class UserFavoritesRow extends SupabaseDataRow {
  UserFavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFavoritesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get genericItemId => getField<String>('generic_item_id')!;
  set genericItemId(String value) => setField<String>('generic_item_id', value);

  String get favoriteType => getField<String>('favorite_type')!;
  set favoriteType(String value) => setField<String>('favorite_type', value);

  String get favoriteValue => getField<String>('favorite_value')!;
  set favoriteValue(String value) => setField<String>('favorite_value', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
