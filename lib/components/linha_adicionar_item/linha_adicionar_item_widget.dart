import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'linha_adicionar_item_model.dart';
export 'linha_adicionar_item_model.dart';

class LinhaAdicionarItemWidget extends StatefulWidget {
  const LinhaAdicionarItemWidget({
    super.key,
    this.paramNomeItem,
    this.paramCategoria,
    this.paramGenericId,
    this.paramListId,
    this.paramUnit,
    this.aoAdicionar,
    this.paramID,
    this.marketID,
    this.tripID,
    this.qtdPadrao,
  });

  final String? paramNomeItem;
  final String? paramCategoria;
  final String? paramGenericId;
  final String? paramListId;
  final String? paramUnit;
  final Future Function(String? newRowID, double? qtd)? aoAdicionar;
  final String? paramID;
  final String? marketID;
  final String? tripID;
  final double? qtdPadrao;

  @override
  State<LinhaAdicionarItemWidget> createState() =>
      _LinhaAdicionarItemWidgetState();
}

class _LinhaAdicionarItemWidgetState extends State<LinhaAdicionarItemWidget> {
  late LinhaAdicionarItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinhaAdicionarItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.qtdPadrao = widget.qtdPadrao;
      _model.qtdAtual = widget.qtdPadrao;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondary,
          width: 1.0,
        ),
      ),
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              fillColor:
                  widget.paramGenericId != null && widget.paramGenericId != ''
                      ? FlutterFlowTheme.of(context).tertiary
                      : FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).info,
                size: 20.0,
              ),
              onPressed: () async {
                if (widget.paramListId != null && widget.paramListId != '') {
                  await ListItemsTable().insert({
                    'list_id': widget.paramListId,
                    'generic_item_id': widget.paramGenericId,
                    'target_quantity': (String qtd) {
                      return double.tryParse(qtd.replaceAll(',', '.')) ?? 1.0;
                    }(_model.qtdAtual!.toString()),
                    'custom_item_name': widget.paramNomeItem,
                  });
                  await widget.aoAdicionar?.call(
                    _model.newIItemID,
                    double.tryParse(_model.textController.text) ?? 1.0,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Item adicionado.',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                    ),
                  );
                } else {
                  _model.newItem = await TripItemsTable().insert({
                    'trip_id': widget.tripID,
                    'supermarket_id': widget.marketID,
                    'generic_item_id': widget.paramGenericId,
                    'target_quantity': (String qtd) {
                      return double.tryParse(qtd.replaceAll(',', '.')) ?? 1.0;
                    }(_model.qtdAtual!.toString()),
                    'is_in_cart': false,
                    'custom_name': widget.paramNomeItem,
                    'actual_packages': 0.0,
                  });
                  _model.newIItemID = _model.newItem?.id;
                  safeSetState(() {});
                  await widget.aoAdicionar?.call(
                    _model.newIItemID,
                    double.tryParse(_model.qtdAtual!.toString()) ?? 1.0,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'novo Item adicionado.',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                    ),
                  );
                }

                safeSetState(() {});
              },
            ),
          ),
          Expanded(
            flex: 12,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.paramNomeItem,
                      'item',
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.paramGenericId != null &&
                              widget.paramGenericId != ''
                          ? widget.paramCategoria
                          : 'Personalizado',
                      'categoria',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 30.0,
                    fillColor: Color(0x7FB83F12),
                    icon: Icon(
                      Icons.remove_sharp,
                      color: FlutterFlowTheme.of(context).info,
                      size: 12.0,
                    ),
                    onPressed: () async {
                      _model.qtdAtual = _model.qtdAtual! +
                          (_model.qtdAtual! >= widget.qtdPadrao!
                              ? ((_model.qtdPadrao!) * -1)
                              : 0.0);
                      safeSetState(() {});
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 500),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: _model.qtdAtual != null
                                        ? formatNumber(
                                            _model.qtdAtual,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                          )
                                        : '1.0',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  textAlign: TextAlign.end,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.paramUnit,
                                'kg',
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 30.0,
                    fillColor: Color(0x7F35493D),
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).info,
                      size: 12.0,
                    ),
                    onPressed: () async {
                      _model.qtdAtual = _model.qtdAtual! + widget.qtdPadrao!;
                      safeSetState(() {});
                    },
                  ),
                ].divide(SizedBox(width: 5.0)),
              ),
            ),
          ),
        ]
            .divide(SizedBox(width: 10.0))
            .addToStart(SizedBox(width: 10.0))
            .addToEnd(SizedBox(width: 10.0)),
      ),
    );
  }
}
