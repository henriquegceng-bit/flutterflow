import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_price_sheet_widget.dart' show ProductPriceSheetWidget;
import 'package:flutter/material.dart';

class ProductPriceSheetModel extends FlutterFlowModel<ProductPriceSheetWidget> {
  ///  Local state fields for this component.

  String? produtoFixadoID;

  dynamic combo;

  dynamic currentProduct;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (OpcoesDeProdutos)] action in ProductPriceSheet widget.
  ApiCallResponse? opcoesEncontradas;
  // Stores action output result for [Custom Action - modificarItemCombo] action in IconButton widget.
  dynamic jsonAtualizado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
