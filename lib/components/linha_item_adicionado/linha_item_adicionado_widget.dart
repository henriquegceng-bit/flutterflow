import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'linha_item_adicionado_model.dart';
export 'linha_item_adicionado_model.dart';

class LinhaItemAdicionadoWidget extends StatefulWidget {
  const LinhaItemAdicionadoWidget({
    super.key,
    this.paramNomeItem,
    this.paramCategoria,
    this.paramGenericId,
    this.paramListId,
    this.paramUnit,
    this.paramQtd,
    this.aoEditar,
    this.paramID,
  });

  final String? paramNomeItem;
  final String? paramCategoria;
  final String? paramGenericId;
  final String? paramListId;
  final String? paramUnit;
  final double? paramQtd;
  final Future Function()? aoEditar;
  final String? paramID;

  @override
  State<LinhaItemAdicionadoWidget> createState() =>
      _LinhaItemAdicionadoWidgetState();
}

class _LinhaItemAdicionadoWidgetState extends State<LinhaItemAdicionadoWidget> {
  late LinhaItemAdicionadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinhaItemAdicionadoModel());

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
        color: Color(0x7FE7CFAD),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondary,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_model.editar)
                    Container(
                      width: 50.0,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        enabled: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText: formatNumber(
                            widget.paramQtd,
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.commaDecimal,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
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
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        textAlign: TextAlign.center,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        enableInteractiveSelection: true,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  if (!_model.editar)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            formatNumber(
                              widget.paramQtd,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.commaDecimal,
                            ),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.paramUnit,
                            'kg',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
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
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_model.confirmarCancelar)
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.cancel_rounded,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            _model.editarExcluir = false;
                            _model.confirmarCancelar = false;
                            _model.excluir = false;
                            _model.editar = false;
                            _model.expandir = true;
                            _model.recolher = false;
                            safeSetState(() {});
                            FFAppState().editar = false;
                            safeSetState(() {});
                          },
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            if ((_model.excluir == true) ||
                                    (_model.editar == true)
                                ? true
                                : false) {
                              if (_model.excluir == true ? true : false) {
                                await ListItemsTable().delete(
                                  matchingRows: (rows) => rows
                                      .eqOrNull(
                                        'list_id',
                                        widget.paramListId,
                                      )
                                      .eqOrNull(
                                        'id',
                                        widget.paramID,
                                      ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Item removido.',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              } else {
                                if (_model.editar == true ? true : false) {
                                  await ListItemsTable().update(
                                    data: {
                                      'target_quantity':
                                          (String qtd, double inicial) {
                                        return double.tryParse(
                                                qtd.replaceAll(',', '.')) ??
                                            inicial;
                                      }(_model.textController.text,
                                              widget.paramQtd!),
                                    },
                                    matchingRows: (rows) => rows
                                        .eqOrNull(
                                          'list_id',
                                          widget.paramListId,
                                        )
                                        .eqOrNull(
                                          'id',
                                          widget.paramID,
                                        ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Item modificado.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              }
                            }
                            _model.editarExcluir = false;
                            _model.confirmarCancelar = false;
                            _model.excluir = false;
                            _model.editar = false;
                            _model.expandir = true;
                            _model.recolher = false;
                            FFAppState().editar = false;
                            _model.textController?.clear();

                            await widget.aoEditar?.call();
                          },
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                if (_model.editarExcluir)
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.delete_forever,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            _model.editarExcluir = false;
                            _model.confirmarCancelar = true;
                            _model.excluir = true;
                            _model.editar = false;
                            safeSetState(() {});
                          },
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.edit,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            _model.editarExcluir = false;
                            _model.confirmarCancelar = true;
                            _model.editar = true;
                            _model.excluir = false;
                            safeSetState(() {});
                            FFAppState().editar = true;
                            safeSetState(() {});
                            safeSetState(() {
                              _model.textController?.text = '';
                              _model.textFieldFocusNode?.requestFocus();
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _model.textController?.selection =
                                    const TextSelection.collapsed(offset: 0);
                              });
                            });
                          },
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                Container(
                  width: 45.0,
                  height: 50.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_model.expandir)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.editarExcluir = true;
                            _model.excluir = false;
                            _model.editar = false;
                            _model.confirmarCancelar = false;
                            _model.expandir = false;
                            _model.recolher = true;
                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      if (_model.recolher)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.editarExcluir = false;
                            _model.excluir = false;
                            _model.editar = false;
                            _model.confirmarCancelar = false;
                            _model.expandir = true;
                            _model.recolher = false;
                            safeSetState(() {});
                            FFAppState().editar = false;
                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 0.0)),
            ),
          ),
        ]
            .divide(SizedBox(width: 5.0))
            .addToStart(SizedBox(width: 10.0))
            .addToEnd(SizedBox(width: 10.0)),
      ),
    );
  }
}
