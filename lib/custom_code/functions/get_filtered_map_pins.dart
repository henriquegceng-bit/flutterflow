import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<LatLng>? getFilteredMapPins(
  dynamic fullJsonResponse,
  int? selectedComboId,
) {
  List<dynamic> combosList = [];
  try {
    // A MÁGICA DA PURIFICAÇÃO:
    // Transforma qualquer objeto oculto do FlutterFlow em um JSON puro do Dart.
    String pureJsonString = fullJsonResponse is String
        ? fullJsonResponse
        : jsonEncode(fullJsonResponse);

    var decoded = jsonDecode(pureJsonString);

    if (decoded is Map && decoded.containsKey('combos')) {
      combosList = decoded['combos'];
    } else if (decoded is List) {
      combosList = decoded;
    }
  } catch (e) {
    // Plano de backup caso a purificação falhe
    if (fullJsonResponse is List) {
      combosList = fullJsonResponse;
    } else {
      return [];
    }
  }

  Map<String, LatLng> uniqueMarkets = {};

  // Varre a lista purificada
  for (var combo in combosList) {
    int currentComboId = -1;

    if (combo['combo_id'] != null) {
      currentComboId = int.tryParse(combo['combo_id'].toString()) ?? -1;
    }

    if (selectedComboId != null && currentComboId != selectedComboId) {
      continue;
    }

    var markets = combo['markets_data'];
    if (markets != null && markets is List) {
      for (var market in markets) {
        var lat = market['latitude'];
        var lng = market['longitude'];
        String marketId = market['supermarket_id'].toString();

        if (lat != null &&
            lng != null &&
            marketId != '00000000-0000-0000-0000-000000000000') {
          double? latDouble = double.tryParse(lat.toString());
          double? lngDouble = double.tryParse(lng.toString());

          if (latDouble != null && lngDouble != null) {
            uniqueMarkets[marketId] = LatLng(latDouble, lngDouble);
          }
        }
      }
    }
  }

  return uniqueMarkets.values.toList();
}
