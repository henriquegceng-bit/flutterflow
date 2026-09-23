import '/flutter_flow/flutter_flow_util.dart';
import 'linha_item_adicionado_widget.dart' show LinhaItemAdicionadoWidget;
import 'package:flutter/material.dart';

class LinhaItemAdicionadoModel
    extends FlutterFlowModel<LinhaItemAdicionadoWidget> {
  ///  Local state fields for this component.

  bool editarExcluir = false;

  bool confirmarCancelar = false;

  bool excluir = false;

  bool editar = false;

  bool expandir = true;

  bool recolher = false;

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
