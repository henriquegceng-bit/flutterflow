import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RankingInteligenteCall {
  static Future<ApiCallResponse> call({
    String? listId = 'bc55fb2a-cfd0-4a1e-b8e7-0801d69c1e1b',
    int? qtdMarkets = 2,
    String? userId = '9cd51f54-9189-4e63-bcbd-c98d1b03fa40',
    double? userLat = -19.869282,
    double? userLon = -43.983742,
    double? maxRadius = 10.0,
  }) async {
    final ffApiRequestBody = '''
{
  "p_list_id": "${escapeStringForJson(listId)}",
  "p_qtd_markets": ${qtdMarkets},
  "p_user_id": "${escapeStringForJson(userId)}",
  "p_user_lat": ${userLat},
  "p_user_lon": ${userLon},
  "p_max_radius_km": ${maxRadius}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RankingInteligente',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/get_smart_ranking',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic listadecombos(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
      );
  static dynamic dadosdosmercados(dynamic response) => getJsonField(
        response,
        r'''$.markets_data''',
      );
  static double? market1(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.summary.min_cost_1''',
      ));
  static double? market2(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.summary.min_cost_2''',
      ));
  static double? market3(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.summary.min_cost_3''',
      ));
  static List? combos(dynamic response) => getJsonField(
        response,
        r'''$.combos''',
        true,
      ) as List?;
  static List<String>? maketNames(dynamic response) => (getJsonField(
        response,
        r'''$.combos[:].market_names''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? items(dynamic response) => (getJsonField(
        response,
        r'''$.combos[:].found_items''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class OpcoesDeProdutosCall {
  static Future<ApiCallResponse> call({
    String? pGenericItemId = '22222222-0000-0000-0000-000000000009',
    String? pSupermarketId = '11111111-0000-0000-0000-000000000001',
    double? pTargetQuantity = 5.0,
    String? pUserId = '9cd51f54-9189-4e63-bcbd-c98d1b03fa40',
  }) async {
    final ffApiRequestBody = '''
{
  "p_supermarket_id": "${escapeStringForJson(pSupermarketId)}",
  "p_generic_item_id": "${escapeStringForJson(pGenericItemId)}",
  "p_target_quantity": ${pTargetQuantity},
  "p_user_id": "${escapeStringForJson(pUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OpcoesDeProdutos',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/get_product_alternatives',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? listadealternativas(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  static dynamic iddoproduto(dynamic response) => getJsonField(
        response,
        r'''$.product_id''',
      );
  static dynamic nomedoproduto(dynamic response) => getJsonField(
        response,
        r'''$.product_name''',
      );
  static dynamic ultimopreco(dynamic response) => getJsonField(
        response,
        r'''$.last_price''',
      );
  static dynamic desatualizado(dynamic response) => getJsonField(
        response,
        r'''$.is_outdated''',
      );
}

class BuscaItensAdicionadosCall {
  static Future<ApiCallResponse> call({
    String? pListId = '44444444-0000-0000-0000-000000000001',
    String? pSearchTerm = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_list_id": "${escapeStringForJson(pListId)}",
  "p_search_term": "${escapeStringForJson(pSearchTerm)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BuscaItensAdicionados',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/search_added_items',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic resultadoagrupado(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
      );
}

class BuscaSugestoesCall {
  static Future<ApiCallResponse> call({
    String? pListId = '',
    String? pSearchTerm = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_list_id": "${escapeStringForJson(pListId)}",
  "p_search_term": "${escapeStringForJson(pSearchTerm)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BuscaSugestoes',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/search_suggestions',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic isAdded(dynamic response) => getJsonField(
        response,
        r'''$.is_added''',
      );
  static dynamic targetQuantity(dynamic response) => getJsonField(
        response,
        r'''$.target_quantity''',
      );
  static dynamic listItemId(dynamic response) => getJsonField(
        response,
        r'''$.list_item_id''',
      );
  static double? increment(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].default_increment''',
      ));
}

class BuscaFavoritosCall {
  static Future<ApiCallResponse> call({
    String? userId = '4668f96c-3d5b-4764-bbdd-03c8eccbc9ad',
    String? genericItemId = '22222222-0000-0000-0000-000000000014',
  }) async {
    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(userId)}",
  "p_generic_item_id": "${escapeStringForJson(genericItemId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BuscaFavoritos',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/get_favorites_data',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalvarUserFavoritosCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? genericItemId = '',
    List<String>? brandsListList,
    List<String>? productsListList,
  }) async {
    final brandsList = _serializeList(brandsListList);
    final productsList = _serializeList(productsListList);

    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(userId)}",
  "p_generic_item_id": "${escapeStringForJson(genericItemId)}",
  "p_brands": ${brandsList},
  "p_products": ${productsList}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SalvarUserFavoritos',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/save_user_favorites',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalvarComboTripCall {
  static Future<ApiCallResponse> call({
    String? tripId = 'e3b8e0f2-4c5a-42f7-b86f-e148eb1e68f4',
    dynamic comboJsonJson,
  }) async {
    final comboJson = _serializeJson(comboJsonJson);
    final ffApiRequestBody = '''
{
  "p_trip_id": "${escapeStringForJson(tripId)}",
  "p_combo_json": ${comboJson}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SalvarComboTrip',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/save_combo_trip',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IniciarModoCompraCall {
  static Future<ApiCallResponse> call({
    String? listId = '44444444-0000-0000-0000-000000000001',
    String? userId = '9cd51f54-9189-4e63-bcbd-c98d1b03fa40',
    dynamic comboJsonJson,
  }) async {
    final comboJson = _serializeJson(comboJsonJson);
    final ffApiRequestBody = '''
{
  "p_list_id": "${escapeStringForJson(listId)}",
  "p_user_id": "${escapeStringForJson(userId)}",
  "p_combo_json": ${comboJson}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'IniciarModoCompra',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/start_trip_mode',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic tripIdRetornado(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class FinalizarCompraCall {
  static Future<ApiCallResponse> call({
    String? tripId = 'be8d63ac-33f0-4607-8c0e-a6df20e8441f',
  }) async {
    final ffApiRequestBody = '''
{
  "p_trip_id": "${escapeStringForJson(tripId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FinalizarCompra',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/finalizar_compra',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RankingComboEscolhidoCall {
  static Future<ApiCallResponse> call({
    String? pListId = 'bc55fb2a-cfd0-4a1e-b8e7-0801d69c1e1b',
    String? pUserId = '9cd51f54-9189-4e63-bcbd-c98d1b03fa40',
    List<String>? pMarketIdsList,
  }) async {
    final pMarketIds = _serializeList(pMarketIdsList);

    final ffApiRequestBody = '''
{
  "p_list_id": "${escapeStringForJson(pListId)}",
  "p_market_ids": ${pMarketIds},
  "p_user_id": "${escapeStringForJson(pUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RankingComboEscolhido',
      apiUrl:
          'https://dalwlvuaqatjuggtwetf.supabase.co/rest/v1/rpc/get_combo_details',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhbHdsdnVhcWF0anVnZ3R3ZXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE5Mjc5NjUsImV4cCI6MjA4NzUwMzk2NX0.wZ0JVTLurVXsBo0EdpkOTUEM_XeHi64Dqhl6ekyoj0o',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
