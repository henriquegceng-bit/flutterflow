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

List<String> extrairFavoritos(
  dynamic jsonList,
  String chaveValor,
) {
  List<String> favoritos = [];
  if (jsonList == null) return favoritos;

  // O FlutterFlow entrega o JSON List como Iterable
  for (var item in jsonList) {
    if (item['is_favorite'] == true) {
      favoritos.add(item[chaveValor].toString());
    }
  }
  return favoritos;
}
