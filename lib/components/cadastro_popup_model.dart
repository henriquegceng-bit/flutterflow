import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_popup_widget.dart' show CadastroPopupWidget;
import 'package:flutter/material.dart';

class CadastroPopupModel extends FlutterFlowModel<CadastroPopupWidget> {
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
