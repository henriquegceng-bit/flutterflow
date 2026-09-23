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

int calcularProporcaoTela(
  List<dynamic>? meuJson,
  List<dynamic>? outroJson,
  bool souListaAgrupada,
) {
  int contarItens(dynamic entrada, bool agrupada) {
    if (entrada == null) return 0;
    dynamic json = entrada;

    if (entrada is String) {
      try {
        json = jsonDecode(entrada);
      } catch (e) {
        return 0;
      }
    }

    List dados = [];
    if (json is Map && json.containsKey('data') && json['data'] is List) {
      dados = json['data'];
    } else if (json is List) {
      dados = json;
    } else {
      return 0;
    }

    int contagem = 0;
    if (agrupada) {
      for (var cat in dados) {
        if (cat is Map && cat.containsKey('items') && cat['items'] is List) {
          contagem += (cat['items'] as List).length;
        }
      }
    } else {
      contagem = dados.length;
    }
    return contagem;
  }

  // 2. Identificar quem é a Lista 1 (Cima) e a Lista 2 (Baixo)
  int itensLista1 = souListaAgrupada
      ? contarItens(meuJson, true)
      : contarItens(outroJson, true);
  int itensLista2 = souListaAgrupada
      ? contarItens(outroJson, false)
      : contarItens(meuJson, false);

  // 3. Calcular "Linhas Necessárias" reais de cada lista
  int req1 =
      (itensLista1 == 0) ? 2 : (itensLista1 + 2); // L1: Itens + 1 (Categoria)
  int req2 =
      itensLista2 + 2; // L2: Itens + 1 (Título) + 1 (Botão Personalizado)

  // 4. A Mágica da Distribuição (As 10 Linhas)
  int flexL1 = 0;
  int flexL2 = 0;

  if (req1 + req2 <= 11) {
    // CENÁRIO A: Tem espaço sobrando na tela!
    // L1 pega exatamente o que precisa. L2 engole todo o restante do espaço.
    flexL1 = req1;
    flexL2 = 11 - req1;
  } else {
    // CENÁRIO B: Falta espaço na tela (A soma passa de 10 linhas)
    // Usamos a necessidade real (req1 e req2) para ver se ambas precisam de bastante espaço
    if (req1 >= 6 && req2 >= 5) {
      // Ambas precisam de 5 ou mais linhas. Empate técnico!
      flexL1 = 6;
      flexL2 = 5;
    } else {
      // Uma lista é pequena e a outra é gigante.
      // A pequena tem prioridade. Ela pega o tamanho exato que precisa, e a gigante pega o resto.
      if (req1 < req2) {
        flexL1 = req1; // L1 é a pequena
        flexL2 = 11 - req1;
      } else {
        flexL2 = req2; // L2 é a pequena
        flexL1 = 11 - req2;
      }
    }
  }

  // 5. Devolver o resultado correto para quem perguntou
  return souListaAgrupada ? flexL1 : flexL2;
}
