import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'p05_products_list_widget.dart' show P05ProductsListWidget;
import 'package:flutter/material.dart';

class P05ProductsListModel extends FlutterFlowModel<P05ProductsListWidget> {
  ///  Local state fields for this page.

  String? tripID;

  bool hideCart = true;

  String? marketID;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (FinalizarCompra)] action in Button widget.
  ApiCallResponse? aPIResultado;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
