import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'p06_cadastro_widget.dart' show P06CadastroWidget;
import 'package:flutter/material.dart';

class P06CadastroModel extends FlutterFlowModel<P06CadastroWidget> {
  ///  Local state fields for this page.

  String? supermercado;

  bool addSupermercado = false;

  bool addRede = false;

  String? item;

  SupermarketsRow? supermercadoRow;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for TextField-SUPERM widget.
  FocusNode? textFieldSUPERMFocusNode1;
  TextEditingController? textFieldSUPERMTextController1;
  String? Function(BuildContext, String?)?
      textFieldSUPERMTextController1Validator;
  var barcode = '';
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<ProductsMasterRow>? produtoEncontrado;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField-SUPERM widget.
  FocusNode? textFieldSUPERMFocusNode2;
  TextEditingController? textFieldSUPERMTextController2;
  String? Function(BuildContext, String?)?
      textFieldSUPERMTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldSUPERMFocusNode1?.dispose();
    textFieldSUPERMTextController1?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    textFieldSUPERMFocusNode2?.dispose();
    textFieldSUPERMTextController2?.dispose();
  }
}
