import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favoritos_sheet_widget.dart' show FavoritosSheetWidget;
import 'package:flutter/material.dart';

class FavoritosSheetModel extends FlutterFlowModel<FavoritosSheetWidget> {
  ///  Local state fields for this component.

  List<String> marcasSelecionadas = [];
  void addToMarcasSelecionadas(String item) => marcasSelecionadas.add(item);
  void removeFromMarcasSelecionadas(String item) =>
      marcasSelecionadas.remove(item);
  void removeAtIndexFromMarcasSelecionadas(int index) =>
      marcasSelecionadas.removeAt(index);
  void insertAtIndexInMarcasSelecionadas(int index, String item) =>
      marcasSelecionadas.insert(index, item);
  void updateMarcasSelecionadasAtIndex(int index, Function(String) updateFn) =>
      marcasSelecionadas[index] = updateFn(marcasSelecionadas[index]);

  List<String> produtosSelecionados = [];
  void addToProdutosSelecionados(String item) => produtosSelecionados.add(item);
  void removeFromProdutosSelecionados(String item) =>
      produtosSelecionados.remove(item);
  void removeAtIndexFromProdutosSelecionados(int index) =>
      produtosSelecionados.removeAt(index);
  void insertAtIndexInProdutosSelecionados(int index, String item) =>
      produtosSelecionados.insert(index, item);
  void updateProdutosSelecionadosAtIndex(
          int index, Function(String) updateFn) =>
      produtosSelecionados[index] = updateFn(produtosSelecionados[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (BuscaFavoritos)] action in FavoritosSheet widget.
  ApiCallResponse? resultadoAPI;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap1 = {};
  List<dynamic> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap2 = {};
  List<dynamic> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - API (SalvarUserFavoritos)] action in Button widget.
  ApiCallResponse? salvamentoFavoritos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
