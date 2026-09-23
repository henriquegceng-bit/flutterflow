// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

dynamic modificarItemCombo(
  dynamic comboAtual,
  String listItemId,
  String acao,
  dynamic novoProduto,
) {
  // Faz uma cópia profunda do JSON atual para podermos modificar livremente
  Map<String, dynamic> comboModificado = Map<String, dynamic>.from(comboAtual);

  double novoCustoJusto = 0.0;
  bool itemModificado = false;

  // 1. Entra na lista de Mercados
  List<dynamic> markets =
      List<dynamic>.from(comboModificado['markets_data'] ?? []);

  for (int m = 0; m < markets.length; m++) {
    Map<String, dynamic> market = Map<String, dynamic>.from(markets[m]);
    double marketTotalCost = 0.0;

    // 2. Entra na lista de Categorias
    List<dynamic> categories = List<dynamic>.from(market['categories'] ?? []);

    for (int c = 0; c < categories.length; c++) {
      Map<String, dynamic> category = Map<String, dynamic>.from(categories[c]);

      // 3. Entra na lista de Itens
      List<dynamic> items = List<dynamic>.from(category['items'] ?? []);
      List<dynamic> itemsFiltrados = [];

      for (int i = 0; i < items.length; i++) {
        Map<String, dynamic> item = Map<String, dynamic>.from(items[i]);

        // ACHAMOS O ITEM!
        if (item['list_item_id'] == listItemId) {
          itemModificado = true;

          if (acao == 'excluir') {
            // Se for excluir, simplesmente não adicionamos ele na lista filtrada
            continue;
          } else if (acao == 'trocar' && novoProduto != null) {
            // Se for trocar, substituímos os dados pelo novo produto que veio do Bottom Sheet
            item['product_id'] = novoProduto['product_id'];
            item['product_name'] = novoProduto['product_name'];
            item['unit_price'] = novoProduto['unit_price'];
            item['package_volume'] = novoProduto['package_volume'];
            // Recalcula o custo total deste item
            item['total_cost'] = (novoProduto['unit_price'] as num).toDouble() *
                (item['packages_needed'] as num).toDouble();
            itemsFiltrados.add(item);
          }
        } else {
          // Mantém os outros itens intactos
          itemsFiltrados.add(item);
        }

        // Soma o custo deste item ao total do mercado
        marketTotalCost +=
            (itemsFiltrados.isNotEmpty && itemsFiltrados.last == item)
                ? (item['total_cost'] as num).toDouble()
                : 0.0;
      }

      category['items'] = itemsFiltrados;
      categories[c] = category;
    }

    market['categories'] = categories;
    market['market_total_cost'] = marketTotalCost;
    markets[m] = market;

    // Soma o total do mercado ao custo total do combo
    novoCustoJusto += marketTotalCost;
  }

  comboModificado['markets_data'] = markets;
  comboModificado['fair_total_cost'] = novoCustoJusto;

  return comboModificado;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
