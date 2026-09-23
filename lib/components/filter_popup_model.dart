import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_popup_widget.dart' show FilterPopupWidget;
import 'package:flutter/material.dart';

class FilterPopupModel extends FlutterFlowModel<FilterPopupWidget> {
  ///  Local state fields for this component.

  List<String> marcasGeneric = [];
  void addToMarcasGeneric(String item) => marcasGeneric.add(item);
  void removeFromMarcasGeneric(String item) => marcasGeneric.remove(item);
  void removeAtIndexFromMarcasGeneric(int index) =>
      marcasGeneric.removeAt(index);
  void insertAtIndexInMarcasGeneric(int index, String item) =>
      marcasGeneric.insert(index, item);
  void updateMarcasGenericAtIndex(int index, Function(String) updateFn) =>
      marcasGeneric[index] = updateFn(marcasGeneric[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (BuscaFavoritos)] action in FilterPopup widget.
  ApiCallResponse? marcasAPI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
