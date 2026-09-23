import '/backend/supabase/supabase.dart';
import '/bottomsheets/cadastro_sheet/cadastro_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_sheet_widget.dart' show CadastroSheetWidget;
import 'package:flutter/material.dart';

class CadastroSheetModel extends FlutterFlowModel<CadastroSheetWidget> {
  ///  Local state fields for this component.

  bool addRede = false;

  bool addCateg = false;

  String? redeSelected;

  String? categSelected;

  bool addMarca = false;

  String? marcaSelected;

  String? itemSelected;

  String? supermSelected;

  String? barcodeScanned;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // Stores action output result for [Bottom Sheet - CadastroPopup] action in Container widget.
  String? redeSelectCopy;
  // State field(s) for TextField-SM-REDE widget.
  FocusNode? textFieldSMREDEFocusNode;
  TextEditingController? textFieldSMREDETextController;
  String? Function(BuildContext, String?)?
      textFieldSMREDETextControllerValidator;
  // State field(s) for TextField-SM-BAIRRO widget.
  FocusNode? textFieldSMBAIRROFocusNode;
  TextEditingController? textFieldSMBAIRROTextController;
  String? Function(BuildContext, String?)?
      textFieldSMBAIRROTextControllerValidator;
  // State field(s) for TextField-SM-LAT widget.
  FocusNode? textFieldSMLATFocusNode;
  TextEditingController? textFieldSMLATTextController;
  String? Function(BuildContext, String?)?
      textFieldSMLATTextControllerValidator;
  // State field(s) for TextField-SM-LONG widget.
  FocusNode? textFieldSMLONGFocusNode;
  TextEditingController? textFieldSMLONGTextController;
  String? Function(BuildContext, String?)?
      textFieldSMLONGTextControllerValidator;
  // State field(s) for TextField-SM-ENDER widget.
  FocusNode? textFieldSMENDERFocusNode;
  TextEditingController? textFieldSMENDERTextController;
  String? Function(BuildContext, String?)?
      textFieldSMENDERTextControllerValidator;
  // State field(s) for TextField-IT-GENER widget.
  FocusNode? textFieldITGENERFocusNode;
  TextEditingController? textFieldITGENERTextController;
  String? Function(BuildContext, String?)?
      textFieldITGENERTextControllerValidator;
  // Stores action output result for [Bottom Sheet - CadastroPopup] action in Container widget.
  String? categSelect;
  // State field(s) for TextField-IT-CATEG widget.
  FocusNode? textFieldITCATEGFocusNode;
  TextEditingController? textFieldITCATEGTextController;
  String? Function(BuildContext, String?)?
      textFieldITCATEGTextControllerValidator;
  // State field(s) for TextField-IT-INCREM widget.
  FocusNode? textFieldITINCREMFocusNode;
  TextEditingController? textFieldITINCREMTextController;
  String? Function(BuildContext, String?)?
      textFieldITINCREMTextControllerValidator;
  // State field(s) for TextField-IT-UNID widget.
  FocusNode? textFieldITUNIDFocusNode;
  TextEditingController? textFieldITUNIDTextController;
  String? Function(BuildContext, String?)?
      textFieldITUNIDTextControllerValidator;
  // Stores action output result for [Bottom Sheet - CadastroPopup] action in Container widget.
  String? itemSelect;
  // State field(s) for TextField-PD-DESC widget.
  FocusNode? textFieldPDDESCFocusNode;
  TextEditingController? textFieldPDDESCTextController;
  String? Function(BuildContext, String?)?
      textFieldPDDESCTextControllerValidator;
  String? _textFieldPDDESCTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - CadastroPopup] action in Container widget.
  String? marcaSelect;
  // State field(s) for TextField-PD-MARCA widget.
  FocusNode? textFieldPDMARCAFocusNode;
  TextEditingController? textFieldPDMARCATextController;
  String? Function(BuildContext, String?)?
      textFieldPDMARCATextControllerValidator;
  String? _textFieldPDMARCATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField-PD-OBS widget.
  FocusNode? textFieldPDOBSFocusNode;
  TextEditingController? textFieldPDOBSTextController;
  String? Function(BuildContext, String?)?
      textFieldPDOBSTextControllerValidator;
  // State field(s) for TextField-PD-QTD widget.
  FocusNode? textFieldPDQTDFocusNode;
  TextEditingController? textFieldPDQTDTextController;
  String? Function(BuildContext, String?)?
      textFieldPDQTDTextControllerValidator;
  String? _textFieldPDQTDTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField-PD-UNID widget.
  FocusNode? textFieldPDUNIDFocusNode;
  TextEditingController? textFieldPDUNIDTextController;
  String? Function(BuildContext, String?)?
      textFieldPDUNIDTextControllerValidator;
  String? _textFieldPDUNIDTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  var barcode = '';
  // Stores action output result for [Bottom Sheet - CadastroPopup] action in Container widget.
  String? supermSelect;
  // State field(s) for TextField-PD-PREC widget.
  FocusNode? textFieldPDPRECFocusNode;
  TextEditingController? textFieldPDPRECTextController;
  String? Function(BuildContext, String?)?
      textFieldPDPRECTextControllerValidator;
  String? _textFieldPDPRECTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Checkbox-PD-PROM widget.
  bool? checkboxPDPROMValue;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ProductsMasterRow? newRow;

  @override
  void initState(BuildContext context) {
    textFieldPDDESCTextControllerValidator =
        _textFieldPDDESCTextControllerValidator;
    textFieldPDMARCATextControllerValidator =
        _textFieldPDMARCATextControllerValidator;
    textFieldPDQTDTextControllerValidator =
        _textFieldPDQTDTextControllerValidator;
    textFieldPDUNIDTextControllerValidator =
        _textFieldPDUNIDTextControllerValidator;
    textFieldPDPRECTextControllerValidator =
        _textFieldPDPRECTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldSMREDEFocusNode?.dispose();
    textFieldSMREDETextController?.dispose();

    textFieldSMBAIRROFocusNode?.dispose();
    textFieldSMBAIRROTextController?.dispose();

    textFieldSMLATFocusNode?.dispose();
    textFieldSMLATTextController?.dispose();

    textFieldSMLONGFocusNode?.dispose();
    textFieldSMLONGTextController?.dispose();

    textFieldSMENDERFocusNode?.dispose();
    textFieldSMENDERTextController?.dispose();

    textFieldITGENERFocusNode?.dispose();
    textFieldITGENERTextController?.dispose();

    textFieldITCATEGFocusNode?.dispose();
    textFieldITCATEGTextController?.dispose();

    textFieldITINCREMFocusNode?.dispose();
    textFieldITINCREMTextController?.dispose();

    textFieldITUNIDFocusNode?.dispose();
    textFieldITUNIDTextController?.dispose();

    textFieldPDDESCFocusNode?.dispose();
    textFieldPDDESCTextController?.dispose();

    textFieldPDMARCAFocusNode?.dispose();
    textFieldPDMARCATextController?.dispose();

    textFieldPDOBSFocusNode?.dispose();
    textFieldPDOBSTextController?.dispose();

    textFieldPDQTDFocusNode?.dispose();
    textFieldPDQTDTextController?.dispose();

    textFieldPDUNIDFocusNode?.dispose();
    textFieldPDUNIDTextController?.dispose();

    textFieldPDPRECFocusNode?.dispose();
    textFieldPDPRECTextController?.dispose();
  }
}
