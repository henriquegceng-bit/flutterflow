import '/flutter_flow/flutter_flow_util.dart';
import 'historico_popup_widget.dart' show HistoricoPopupWidget;
import 'package:flutter/material.dart';

class HistoricoPopupModel extends FlutterFlowModel<HistoricoPopupWidget> {
  ///  Local state fields for this component.

  String? titulo;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
