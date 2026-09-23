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

String formatarDataBrasil(String? dataIso) {
  // Se a data vier vazia da API, devolvemos um padrão visual seguro
  if (dataIso == null || dataIso.isEmpty) {
    return '--/--/--';
  }

  try {
    // 1. O Dart lê a String e entende que está em UTC (+00:00)
    DateTime data = DateTime.parse(dataIso);

    // 2. Converte automaticamente para o fuso horário do celular (Ex: Brasília)
    DateTime dataLocal = data.toLocal();

    // 3. Formata para o padrão brasileiro: Dia/Mês/Ano (2 dígitos)
    return DateFormat('dd/MM/yy').format(dataLocal);
  } catch (e) {
    // Se a API mandar um formato corrompido, devolvemos como veio para não quebrar a tela
    return dataIso;
  }
}
