import '/backend/api_requests/api_calls.dart';
import '/components/linha_adicionar_item/linha_adicionar_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p03_item_list_widget.dart' show P03ItemListWidget;
import 'package:flutter/material.dart';

class P03ItemListModel extends FlutterFlowModel<P03ItemListWidget> {
  ///  Local state fields for this page.

  List<dynamic> itensAdicionados = [];
  void addToItensAdicionados(dynamic item) => itensAdicionados.add(item);
  void removeFromItensAdicionados(dynamic item) =>
      itensAdicionados.remove(item);
  void removeAtIndexFromItensAdicionados(int index) =>
      itensAdicionados.removeAt(index);
  void insertAtIndexInItensAdicionados(int index, dynamic item) =>
      itensAdicionados.insert(index, item);
  void updateItensAdicionadosAtIndex(int index, Function(dynamic) updateFn) =>
      itensAdicionados[index] = updateFn(itensAdicionados[index]);

  List<dynamic> itensSugeridos = [];
  void addToItensSugeridos(dynamic item) => itensSugeridos.add(item);
  void removeFromItensSugeridos(dynamic item) => itensSugeridos.remove(item);
  void removeAtIndexFromItensSugeridos(int index) =>
      itensSugeridos.removeAt(index);
  void insertAtIndexInItensSugeridos(int index, dynamic item) =>
      itensSugeridos.insert(index, item);
  void updateItensSugeridosAtIndex(int index, Function(dynamic) updateFn) =>
      itensSugeridos[index] = updateFn(itensSugeridos[index]);

  int? resultadoLista1 = 8;

  int? resultadoLista2 = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (BuscaItensAdicionados)] action in TextField widget.
  ApiCallResponse? outAdicionadosCopy;
  // Stores action output result for [Backend Call - API (BuscaSugestoes)] action in TextField widget.
  ApiCallResponse? outSugestoesCopy;
  // Stores action output result for [Backend Call - API (BuscaItensAdicionados)] action in TextField widget.
  ApiCallResponse? outAdicionadosCopyCopy;
  // Stores action output result for [Backend Call - API (BuscaSugestoes)] action in TextField widget.
  ApiCallResponse? outSugestoesCopyCopy;
  // Stores action output result for [Backend Call - API (BuscaItensAdicionados)] action in LinhaItemAdicionado widget.
  ApiCallResponse? outAdicionados1;
  // Stores action output result for [Backend Call - API (BuscaSugestoes)] action in LinhaItemAdicionado widget.
  ApiCallResponse? outSugestoes1;
  // Stores action output result for [Backend Call - API (BuscaItensAdicionados)] action in LinhaAdicionarItem widget.
  ApiCallResponse? outAdicionados;
  // Stores action output result for [Backend Call - API (BuscaSugestoes)] action in LinhaAdicionarItem widget.
  ApiCallResponse? outSugestoes;
  // Model for LinhaAdicionarItem component.
  late LinhaAdicionarItemModel linhaAdicionarItemModel2;
  // Stores action output result for [Backend Call - API (BuscaItensAdicionados)] action in LinhaAdicionarItem widget.
  ApiCallResponse? outAdicionados2;
  // Stores action output result for [Backend Call - API (BuscaSugestoes)] action in LinhaAdicionarItem widget.
  ApiCallResponse? outSugestoes2;

  @override
  void initState(BuildContext context) {
    linhaAdicionarItemModel2 =
        createModel(context, () => LinhaAdicionarItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    linhaAdicionarItemModel2.dispose();
  }
}
