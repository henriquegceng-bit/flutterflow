import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'compare_sheet_widget.dart' show CompareSheetWidget;
import 'package:flutter/material.dart';

class CompareSheetModel extends FlutterFlowModel<CompareSheetWidget> {
  ///  Local state fields for this component.

  int marketNumber = 1;

  List<LatLng> comboSelecionadoJson = [];
  void addToComboSelecionadoJson(LatLng item) => comboSelecionadoJson.add(item);
  void removeFromComboSelecionadoJson(LatLng item) =>
      comboSelecionadoJson.remove(item);
  void removeAtIndexFromComboSelecionadoJson(int index) =>
      comboSelecionadoJson.removeAt(index);
  void insertAtIndexInComboSelecionadoJson(int index, LatLng item) =>
      comboSelecionadoJson.insert(index, item);
  void updateComboSelecionadoJsonAtIndex(
          int index, Function(LatLng) updateFn) =>
      comboSelecionadoJson[index] = updateFn(comboSelecionadoJson[index]);

  int? comboClicadoId;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (RankingComboEscolhido)] action in Button widget.
  ApiCallResponse? combo;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
