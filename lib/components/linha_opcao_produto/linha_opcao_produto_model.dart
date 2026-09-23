import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'linha_opcao_produto_widget.dart' show LinhaOpcaoProdutoWidget;
import 'package:flutter/material.dart';

class LinhaOpcaoProdutoModel extends FlutterFlowModel<LinhaOpcaoProdutoWidget> {
  ///  Local state fields for this component.

  bool? selectedAlternative;

  bool confEdit = false;

  bool addCart = false;

  bool remCart = false;

  bool remList = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  TripItemsRow? linhaNova;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
