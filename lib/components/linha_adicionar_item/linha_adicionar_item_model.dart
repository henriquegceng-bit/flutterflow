import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'linha_adicionar_item_widget.dart' show LinhaAdicionarItemWidget;
import 'package:flutter/material.dart';

class LinhaAdicionarItemModel
    extends FlutterFlowModel<LinhaAdicionarItemWidget> {
  ///  Local state fields for this component.

  String? newIItemID;

  double? qtdAtual = 1.0;

  double? qtdPadrao;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  TripItemsRow? newItem;
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
