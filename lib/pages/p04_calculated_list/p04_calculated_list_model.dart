import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'p04_calculated_list_widget.dart' show P04CalculatedListWidget;
import 'package:flutter/material.dart';

class P04CalculatedListModel extends FlutterFlowModel<P04CalculatedListWidget> {
  ///  Local state fields for this page.

  dynamic comboSelecionado;

  String? tripID;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (IniciarModoCompra)] action in Button widget.
  ApiCallResponse? resultadoAPI;
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
