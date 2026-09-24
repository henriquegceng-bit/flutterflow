import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/bottomsheets/compare_sheet/compare_sheet_widget.dart';
import '/bottomsheets/favoritos_sheet/favoritos_sheet_widget.dart';
import '/components/linha_adicionar_item/linha_adicionar_item_widget.dart';
import '/components/linha_item_adicionado/linha_item_adicionado_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p03_item_list_model.dart';
export 'p03_item_list_model.dart';

class P03ItemListWidget extends StatefulWidget {
  const P03ItemListWidget({
    super.key,
    this.listId,
    this.listName,
    this.dadosDosMercados,
  });

  final String? listId;
  final String? listName;
  final dynamic dadosDosMercados;

  static String routeName = 'p03_ItemList';
  static String routePath = '/p03ItemList';

  @override
  State<P03ItemListWidget> createState() => _P03ItemListWidgetState();
}

class _P03ItemListWidgetState extends State<P03ItemListWidget> {
  late P03ItemListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P03ItemListModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          floatingActionButton: Visibility(
            visible: false,
            child: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Icon(
                Icons.add_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 55.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.safePop();
                                          },
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lista de Itens',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    widget.listName,
                                                    'ITENS DA LISTA',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 2.0))
                                              .addToStart(
                                                  SizedBox(height: 7.0)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: CompareSheetWidget(
                                                      listID: widget.listId,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Calcular',
                                          options: FFButtonOptions(
                                            width: 110.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 5.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE7CFAD),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.search_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    Duration(milliseconds: 500),
                                                    () async {
                                                      FFAppState().itemAddTemp =
                                                          _model.textController
                                                              .text;
                                                      FFAppState()
                                                          .update(() {});
                                                      _model.outAdicionadosCopyCopy =
                                                          await BuscaItensAdicionadosCall
                                                              .call(
                                                        pListId: widget.listId,
                                                        pSearchTerm: _model
                                                            .textController
                                                            .text,
                                                      );

                                                      if ((_model
                                                              .outAdicionadosCopyCopy
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.outSugestoesCopyCopy =
                                                            await BuscaSugestoesCall
                                                                .call(
                                                          pListId:
                                                              widget.listId,
                                                          pSearchTerm: _model
                                                              .textController
                                                              .text,
                                                          authToken:
                                                              currentJwtToken,
                                                        );

                                                        if ((_model
                                                                .outSugestoesCopyCopy
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.itensAdicionados =
                                                              getJsonField(
                                                            (_model.outAdicionadosCopyCopy
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.data''',
                                                            true,
                                                          )!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                          _model.itensSugeridos =
                                                              getJsonField(
                                                            (_model.outSugestoesCopyCopy
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.data''',
                                                            true,
                                                          )!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                          safeSetState(() {});
                                                        }
                                                        _model.resultadoLista1 =
                                                            functions.calcularProporcaoTela(
                                                                _model
                                                                    .itensAdicionados
                                                                    .toList(),
                                                                _model
                                                                    .itensSugeridos
                                                                    .toList(),
                                                                true);
                                                        _model.resultadoLista2 =
                                                            functions.calcularProporcaoTela(
                                                                _model
                                                                    .itensSugeridos
                                                                    .toList(),
                                                                _model
                                                                    .itensAdicionados
                                                                    .toList(),
                                                                false);
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  onFieldSubmitted: (_) async {
                                                    FFAppState().itemAddTemp =
                                                        _model.textController
                                                            .text;
                                                    FFAppState().update(() {});
                                                    _model.outAdicionadosCopy =
                                                        await BuscaItensAdicionadosCall
                                                            .call(
                                                      pListId: widget.listId,
                                                      pSearchTerm: _model
                                                          .textController.text,
                                                    );

                                                    if ((_model
                                                            .outAdicionadosCopy
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.outSugestoesCopy =
                                                          await BuscaSugestoesCall
                                                              .call(
                                                        pListId: widget.listId,
                                                        pSearchTerm: _model
                                                            .textController
                                                            .text,
                                                        authToken:
                                                            currentJwtToken,
                                                      );

                                                      if ((_model
                                                              .outSugestoesCopy
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.itensAdicionados =
                                                            getJsonField(
                                                          (_model.outAdicionadosCopy
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data''',
                                                          true,
                                                        )!
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                        _model.itensSugeridos =
                                                            getJsonField(
                                                          (_model.outSugestoesCopy
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data''',
                                                          true,
                                                        )!
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                        safeSetState(() {});
                                                      }
                                                      _model.resultadoLista1 = functions
                                                          .calcularProporcaoTela(
                                                              _model
                                                                  .itensAdicionados
                                                                  .toList(),
                                                              _model
                                                                  .itensSugeridos
                                                                  .toList(),
                                                              true);
                                                      _model.resultadoLista2 = functions
                                                          .calcularProporcaoTela(
                                                              _model
                                                                  .itensSugeridos
                                                                  .toList(),
                                                              _model
                                                                  .itensAdicionados
                                                                  .toList(),
                                                              false);
                                                      safeSetState(() {});
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  autofocus: false,
                                                  enabled: true,
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .sentences,
                                                  textInputAction:
                                                      TextInputAction.go,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    hintText:
                                                        'Item ou Categoria',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    suffixIcon:
                                                        _model.textController!
                                                                .text.isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .textController
                                                                      ?.clear();
                                                                  FFAppState()
                                                                          .itemAddTemp =
                                                                      _model
                                                                          .textController
                                                                          .text;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  _model.outAdicionadosCopyCopy =
                                                                      await BuscaItensAdicionadosCall
                                                                          .call(
                                                                    pListId: widget
                                                                        .listId,
                                                                    pSearchTerm:
                                                                        _model
                                                                            .textController
                                                                            .text,
                                                                  );

                                                                  if ((_model
                                                                          .outAdicionadosCopyCopy
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model.outSugestoesCopyCopy =
                                                                        await BuscaSugestoesCall
                                                                            .call(
                                                                      pListId:
                                                                          widget
                                                                              .listId,
                                                                      pSearchTerm: _model
                                                                          .textController
                                                                          .text,
                                                                      authToken:
                                                                          currentJwtToken,
                                                                    );

                                                                    if ((_model
                                                                            .outSugestoesCopyCopy
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model
                                                                          .itensAdicionados = getJsonField(
                                                                        (_model.outAdicionadosCopyCopy?.jsonBody ??
                                                                            ''),
                                                                        r'''$.data''',
                                                                        true,
                                                                      )!
                                                                          .toList()
                                                                          .cast<dynamic>();
                                                                      _model
                                                                          .itensSugeridos = getJsonField(
                                                                        (_model.outSugestoesCopyCopy?.jsonBody ??
                                                                            ''),
                                                                        r'''$.data''',
                                                                        true,
                                                                      )!
                                                                          .toList()
                                                                          .cast<dynamic>();
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    _model.resultadoLista1 = functions.calcularProporcaoTela(
                                                                        _model
                                                                            .itensAdicionados
                                                                            .toList(),
                                                                        _model
                                                                            .itensSugeridos
                                                                            .toList(),
                                                                        true);
                                                                    _model.resultadoLista2 = functions.calcularProporcaoTela(
                                                                        _model
                                                                            .itensSugeridos
                                                                            .toList(),
                                                                        _model
                                                                            .itensAdicionados
                                                                            .toList(),
                                                                        false);
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  size: 24.0,
                                                                ),
                                                              )
                                                            : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  enableInteractiveSelection:
                                                      false,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    if (!isAndroid && !isiOS)
                                                      TextInputFormatter
                                                          .withFunction(
                                                              (oldValue,
                                                                  newValue) {
                                                        return TextEditingValue(
                                                          selection: newValue
                                                              .selection,
                                                          text: newValue.text
                                                              .toCapitalization(
                                                                  TextCapitalization
                                                                      .sentences),
                                                        );
                                                      }),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ]
                                              .divide(SizedBox(width: 10.0))
                                              .addToStart(SizedBox(width: 10.0))
                                              .addToEnd(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!(isWeb
                                                    ? MediaQuery.viewInsetsOf(
                                                                context)
                                                            .bottom >
                                                        0
                                                    : _isKeyboardVisible) ||
                                                FFAppState().editar)
                                              Expanded(
                                                flex: valueOrDefault<int>(
                                                  _model.resultadoLista1,
                                                  1,
                                                ),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future:
                                                      BuscaItensAdicionadosCall
                                                          .call(
                                                    pListId: widget.listId,
                                                    pSearchTerm: _model
                                                        .textController.text,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerADICIONADOSBuscaItensAdicionadosResponse =
                                                        snapshot.data!;

                                                    return Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.1,
                                                        maxHeight:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.55,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                          Text(
                                                            'Itens adicionados',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listaCategorias =
                                                                          getJsonField(
                                                                        containerADICIONADOSBuscaItensAdicionadosResponse
                                                                            .jsonBody,
                                                                        r'''$.data''',
                                                                      ).toList();

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listaCategorias.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 5.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listaCategoriasIndex) {
                                                                          final listaCategoriasItem =
                                                                              listaCategorias[listaCategoriasIndex];
                                                                          return StickyHeader(
                                                                            overlapHeaders:
                                                                                false,
                                                                            header:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 25.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        listaCategoriasItem,
                                                                                        r'''$.category''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                            font: GoogleFonts.interTight(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            content:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final listaProdutos2 = getJsonField(
                                                                                  listaCategoriasItem,
                                                                                  r'''$.items''',
                                                                                ).toList();

                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.fromLTRB(
                                                                                    0,
                                                                                    5.0,
                                                                                    0,
                                                                                    0,
                                                                                  ),
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: listaProdutos2.length,
                                                                                  separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                  itemBuilder: (context, listaProdutos2Index) {
                                                                                    final listaProdutos2Item = listaProdutos2[listaProdutos2Index];
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          enableDrag: false,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(context).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: FavoritosSheetWidget(
                                                                                                  genericItemID: getJsonField(
                                                                                                    listaProdutos2Item,
                                                                                                    r'''$.generic_item_id''',
                                                                                                  ).toString(),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));
                                                                                      },
                                                                                      child: LinhaItemAdicionadoWidget(
                                                                                        key: Key('Keyasl_${listaProdutos2Index}_of_${listaProdutos2.length}'),
                                                                                        paramNomeItem: getJsonField(
                                                                                          listaProdutos2Item,
                                                                                          r'''$.item_name''',
                                                                                        ).toString(),
                                                                                        paramCategoria: '',
                                                                                        paramListId: widget.listId,
                                                                                        paramUnit: getJsonField(
                                                                                          listaProdutos2Item,
                                                                                          r'''$.default_unit''',
                                                                                        ).toString(),
                                                                                        paramQtd: double.tryParse(getJsonField(
                                                                                              listaProdutos2Item,
                                                                                              r'''$.target_quantity''',
                                                                                            ).toString()) ??
                                                                                            0.0,
                                                                                        paramID: getJsonField(
                                                                                          listaProdutos2Item,
                                                                                          r'''$.list_item_id''',
                                                                                        ).toString(),
                                                                                        aoEditar: () async {
                                                                                          _model.resultadoLista1 = 8;
                                                                                          _model.resultadoLista2 = 1;
                                                                                          safeSetState(() {});
                                                                                          FFAppState().itemAddTemp = _model.textController.text;
                                                                                          FFAppState().update(() {});
                                                                                          _model.outAdicionados1 = await BuscaItensAdicionadosCall.call(
                                                                                            pListId: widget.listId,
                                                                                            pSearchTerm: _model.textController.text,
                                                                                          );

                                                                                          if ((_model.outAdicionados1?.succeeded ?? true)) {
                                                                                            _model.outSugestoes1 = await BuscaSugestoesCall.call(
                                                                                              pListId: widget.listId,
                                                                                              pSearchTerm: _model.textController.text,
                                                                                              authToken: currentJwtToken,
                                                                                            );

                                                                                            if ((_model.outSugestoes1?.succeeded ?? true)) {
                                                                                              _model.resultadoLista1 = 8;
                                                                                              _model.resultadoLista2 = 1;
                                                                                              safeSetState(() {});
                                                                                              _model.itensAdicionados = getJsonField(
                                                                                                (_model.outAdicionados1?.jsonBody ?? ''),
                                                                                                r'''$.data''',
                                                                                                true,
                                                                                              )!
                                                                                                  .toList()
                                                                                                  .cast<dynamic>();
                                                                                              _model.itensSugeridos = getJsonField(
                                                                                                (_model.outSugestoes1?.jsonBody ?? ''),
                                                                                                r'''$.data''',
                                                                                                true,
                                                                                              )!
                                                                                                  .toList()
                                                                                                  .cast<dynamic>();
                                                                                            }
                                                                                            _model.resultadoLista1 = functions.calcularProporcaoTela(_model.itensAdicionados.toList(), _model.itensSugeridos.toList(), true);
                                                                                            _model.resultadoLista2 = functions.calcularProporcaoTela(_model.itensSugeridos.toList(), _model.itensAdicionados.toList(), false);
                                                                                          }
                                                                                          safeSetState(() {});

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            if ((_model.textController
                                                            .text !=
                                                        '') ||
                                                ((_model.textFieldFocusNode
                                                            ?.hasFocus ??
                                                        false) &&
                                                    (_model.textController
                                                                .text ==
                                                            '') &&
                                                    !FFAppState().editar &&
                                                    (isWeb
                                                        ? MediaQuery.viewInsetsOf(
                                                                    context)
                                                                .bottom >
                                                            0
                                                        : _isKeyboardVisible)))
                                              Expanded(
                                                flex: valueOrDefault<int>(
                                                  _model.resultadoLista2,
                                                  1,
                                                ),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future:
                                                      BuscaSugestoesCall.call(
                                                    pListId: widget.listId,
                                                    pSearchTerm: _model
                                                        .textController.text,
                                                    authToken: currentJwtToken,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerADICIONARBuscaSugestoesResponse =
                                                        snapshot.data!;

                                                    return Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.15,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                          Text(
                                                            'Itens para adicionar',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listaItens =
                                                                          getJsonField(
                                                                        containerADICIONARBuscaSugestoesResponse
                                                                            .jsonBody,
                                                                        r'''$.data''',
                                                                      ).toList();

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.fromLTRB(
                                                                          0,
                                                                          5.0,
                                                                          0,
                                                                          5.0,
                                                                        ),
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listaItens.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 5.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listaItensIndex) {
                                                                          final listaItensItem =
                                                                              listaItens[listaItensIndex];
                                                                          return LinhaAdicionarItemWidget(
                                                                            key:
                                                                                Key('Key2ez_${listaItensIndex}_of_${listaItens.length}'),
                                                                            paramNomeItem:
                                                                                getJsonField(
                                                                              listaItensItem,
                                                                              r'''$.item_name''',
                                                                            ).toString(),
                                                                            paramCategoria:
                                                                                getJsonField(
                                                                              listaItensItem,
                                                                              r'''$.category''',
                                                                            ).toString(),
                                                                            paramGenericId:
                                                                                getJsonField(
                                                                              listaItensItem,
                                                                              r'''$.generic_item_id''',
                                                                            ).toString(),
                                                                            paramListId:
                                                                                widget.listId,
                                                                            paramUnit:
                                                                                getJsonField(
                                                                              listaItensItem,
                                                                              r'''$.default_unit''',
                                                                            ).toString(),
                                                                            paramID:
                                                                                getJsonField(
                                                                              listaItensItem,
                                                                              r'''$.list_item_id''',
                                                                            ).toString(),
                                                                            qtdPadrao:
                                                                                getJsonField(
                                                                              listaItensItem,
                                                                              r'''$.default_increment''',
                                                                            ),
                                                                            aoAdicionar:
                                                                                (newRowID, qtd) async {
                                                                              _model.outAdicionados = await BuscaItensAdicionadosCall.call(
                                                                                pListId: widget.listId,
                                                                                pSearchTerm: _model.textController.text,
                                                                              );

                                                                              if ((_model.outAdicionados?.succeeded ?? true)) {
                                                                                _model.outSugestoes = await BuscaSugestoesCall.call(
                                                                                  pListId: widget.listId,
                                                                                  pSearchTerm: _model.textController.text,
                                                                                  authToken: currentJwtToken,
                                                                                );

                                                                                if ((_model.outSugestoes?.succeeded ?? true)) {
                                                                                  _model.resultadoLista1 = 8;
                                                                                  _model.resultadoLista2 = 1;
                                                                                  _model.itensAdicionados = getJsonField(
                                                                                    (_model.outAdicionados?.jsonBody ?? ''),
                                                                                    r'''$.data''',
                                                                                    true,
                                                                                  )!
                                                                                      .toList()
                                                                                      .cast<dynamic>();
                                                                                  _model.itensSugeridos = getJsonField(
                                                                                    (_model.outSugestoes?.jsonBody ?? ''),
                                                                                    r'''$.data''',
                                                                                    true,
                                                                                  )!
                                                                                      .toList()
                                                                                      .cast<dynamic>();
                                                                                }
                                                                                _model.resultadoLista1 = functions.calcularProporcaoTela(_model.itensAdicionados.toList(), _model.itensSugeridos.toList(), true);
                                                                                _model.resultadoLista2 = functions.calcularProporcaoTela(_model.itensSugeridos.toList(), _model.itensAdicionados.toList(), false);
                                                                              }
                                                                              safeSetState(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                  if (_model.textController
                                                                              .text !=
                                                                          '')
                                                                    wrapWithModel(
                                                                      model: _model
                                                                          .linhaAdicionarItemModel2,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          LinhaAdicionarItemWidget(
                                                                        paramNomeItem: _model
                                                                            .textController
                                                                            .text,
                                                                        paramListId:
                                                                            widget.listId,
                                                                        paramUnit:
                                                                            'un',
                                                                        aoAdicionar:
                                                                            (newRowID,
                                                                                qtd) async {
                                                                          _model.outAdicionados2 =
                                                                              await BuscaItensAdicionadosCall.call(
                                                                            pListId:
                                                                                widget.listId,
                                                                            pSearchTerm:
                                                                                _model.textController.text,
                                                                          );

                                                                          if ((_model.outAdicionados2?.succeeded ??
                                                                              true)) {
                                                                            _model.outSugestoes2 =
                                                                                await BuscaSugestoesCall.call(
                                                                              pListId: widget.listId,
                                                                              pSearchTerm: _model.textController.text,
                                                                              authToken: currentJwtToken,
                                                                            );

                                                                            if ((_model.outSugestoes2?.succeeded ??
                                                                                true)) {
                                                                              _model.resultadoLista1 = 8;
                                                                              _model.resultadoLista2 = 1;
                                                                              _model.itensAdicionados = getJsonField(
                                                                                (_model.outAdicionados2?.jsonBody ?? ''),
                                                                                r'''$.data''',
                                                                                true,
                                                                              )!
                                                                                  .toList()
                                                                                  .cast<dynamic>();
                                                                              _model.itensSugeridos = getJsonField(
                                                                                (_model.outSugestoes2?.jsonBody ?? ''),
                                                                                r'''$.data''',
                                                                                true,
                                                                              )!
                                                                                  .toList()
                                                                                  .cast<dynamic>();
                                                                            }
                                                                            _model.resultadoLista1 = functions.calcularProporcaoTela(
                                                                                _model.itensAdicionados.toList(),
                                                                                _model.itensSugeridos.toList(),
                                                                                true);
                                                                            _model.resultadoLista2 = functions.calcularProporcaoTela(
                                                                                _model.itensSugeridos.toList(),
                                                                                _model.itensAdicionados.toList(),
                                                                                false);
                                                                          }
                                                                          safeSetState(
                                                                              () {});

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
