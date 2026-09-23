import '/components/linha_adicionar_item/linha_adicionar_item_widget.dart';
import '/components/linha_opcao_produto/linha_opcao_produto_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_alternative_sheet_widget.dart'
    show ProductAlternativeSheetWidget;
import 'package:flutter/material.dart';

class ProductAlternativeSheetModel
    extends FlutterFlowModel<ProductAlternativeSheetWidget> {
  ///  Local state fields for this component.

  String? brandFilter;

  String? itemAdd;

  double? qtdAdd;

  String? itemIDAdd;

  String? itemUNAdd;

  String? tripItemID;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - FilterPopup] action in Icon widget.
  String? marcaSelecionada;
  // Model for LinhaOpcaoProduto component.
  late LinhaOpcaoProdutoModel linhaOpcaoProdutoModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for LinhaAdicionarItem component.
  late LinhaAdicionarItemModel linhaAdicionarItemModel2;

  @override
  void initState(BuildContext context) {
    linhaOpcaoProdutoModel2 =
        createModel(context, () => LinhaOpcaoProdutoModel());
    linhaAdicionarItemModel2 =
        createModel(context, () => LinhaAdicionarItemModel());
  }

  @override
  void dispose() {
    linhaOpcaoProdutoModel2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    linhaAdicionarItemModel2.dispose();
  }
}
