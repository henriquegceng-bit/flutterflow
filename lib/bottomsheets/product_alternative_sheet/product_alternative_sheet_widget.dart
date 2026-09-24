import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/bottomsheets/cadastro_sheet/cadastro_sheet_widget.dart';
import '/components/filter_popup_widget.dart';
import '/components/linha_adicionar_item/linha_adicionar_item_widget.dart';
import '/components/linha_opcao_produto/linha_opcao_produto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_alternative_sheet_model.dart';
export 'product_alternative_sheet_model.dart';

class ProductAlternativeSheetWidget extends StatefulWidget {
  const ProductAlternativeSheetWidget({
    super.key,
    this.productInfo,
    this.supermarketID,
    this.tripID,
  });

  final ViewLiveTripItemsRow? productInfo;
  final String? supermarketID;
  final String? tripID;

  @override
  State<ProductAlternativeSheetWidget> createState() =>
      _ProductAlternativeSheetWidgetState();
}

class _ProductAlternativeSheetWidgetState
    extends State<ProductAlternativeSheetWidget> {
  late ProductAlternativeSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductAlternativeSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.brandFilter = null;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 650.0,
        constraints: BoxConstraints(
          maxWidth: 500.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      _model.itemAdd == null ||
                                              _model.itemAdd == ''
                                          ? valueOrDefault<String>(
                                              widget
                                                  .productInfo?.targetQuantity
                                                  ?.toString(),
                                              '0',
                                            )
                                          : _model.qtdAdd?.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.itemAdd == null ||
                                              _model.itemAdd == ''
                                          ? valueOrDefault<String>(
                                              widget.productInfo?.defaultUnit,
                                              'UN',
                                            )
                                          : valueOrDefault<String>(
                                              _model.itemUNAdd,
                                              'UN',
                                            ),
                                      'UN',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.itemAdd == null ||
                                                _model.itemAdd == ''
                                            ? valueOrDefault<String>(
                                                widget
                                                    .productInfo?.genericName,
                                                'Item',
                                              )
                                            : _model.itemAdd,
                                        'Item',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 2.0)),
                              ),
                              InkWell(
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
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: FilterPopupWidget(
                                          genericItemID: widget
                                              .productInfo?.genericItemId,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.marcaSelecionada = value));

                                  _model.brandFilter = _model.marcaSelecionada;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.filter_alt,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      if ((widget.productInfo != null) ||
                          (_model.tripItemID != null &&
                              _model.tripItemID != ''))
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: FutureBuilder<
                                List<ViewTripProductAlternativesRow>>(
                              future:
                                  ViewTripProductAlternativesTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'supermarket_id',
                                      widget.productInfo?.supermarketId,
                                    )
                                    .ilike(
                                      'product_name',
                                      _model.brandFilter != null &&
                                              _model.brandFilter != ''
                                          ? '%${_model.brandFilter}%'
                                          : '% %',
                                    )
                                    .eqOrNull(
                                      'trip_id',
                                      widget.tripID,
                                    )
                                    .eqOrNull(
                                      'family_id',
                                      widget.productInfo?.isCustom == true
                                          ? widget.productInfo?.id
                                          : (widget.productInfo != null
                                              ? widget
                                                  .productInfo?.genericItemId
                                              : _model.itemIDAdd),
                                    )
                                    .order('global_is_in_cart')
                                    .order('is_favorite')
                                    .order('live_total_cost', ascending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ViewTripProductAlternativesRow>
                                    listViewViewTripProductAlternativesRowList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    10.0,
                                    0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewViewTripProductAlternativesRowList
                                          .length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 5.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewViewTripProductAlternativesRow =
                                        listViewViewTripProductAlternativesRowList[
                                            listViewIndex];
                                    return LinhaOpcaoProdutoWidget(
                                      key: Key(
                                          'Keydqe_${listViewIndex}_of_${listViewViewTripProductAlternativesRowList.length}'),
                                      alternativeProductInfo:
                                          listViewViewTripProductAlternativesRow,
                                      selectedProductInfo: widget.productInfo,
                                      update: (linhaNova) async {
                                        _model.tripItemID = linhaNova;
                                        safeSetState(() {});
                                      },
                                      update2: () async {
                                        safeSetState(() {});
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      if (false)
                        Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Produto Selecionado',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.linhaOpcaoProdutoModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: LinhaOpcaoProdutoWidget(
                                  selectedProductInfo: widget.productInfo,
                                  update: (linhaNova) async {},
                                  update2: () async {},
                                ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      if ((_model.tripItemID == null ||
                              _model.tripItemID == '') &&
                          (widget.productInfo == null))
                        Expanded(
                          child: FutureBuilder<ApiCallResponse>(
                            future: BuscaSugestoesCall.call(
                              pSearchTerm: _model.textController.text,
                              authToken: currentJwtToken,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final containerBuscaSugestoesResponse =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
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
                                                    () => safeSetState(() {}),
                                                  ),
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
                                                    suffixIcon: _model
                                                            .textController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .textController
                                                                  ?.clear();
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final tipListItem =
                                                    getJsonField(
                                                  containerBuscaSugestoesResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                ).toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    5.0,
                                                    0,
                                                    5.0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: tipListItem.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 5.0),
                                                  itemBuilder: (context,
                                                      tipListItemIndex) {
                                                    final tipListItemItem =
                                                        tipListItem[
                                                            tipListItemIndex];
                                                    return LinhaAdicionarItemWidget(
                                                      key: Key(
                                                          'Keyly8_${tipListItemIndex}_of_${tipListItem.length}'),
                                                      paramNomeItem:
                                                          getJsonField(
                                                        tipListItemItem,
                                                        r'''$.item_name''',
                                                      ).toString(),
                                                      paramCategoria:
                                                          getJsonField(
                                                        tipListItemItem,
                                                        r'''$.category''',
                                                      ).toString(),
                                                      paramGenericId:
                                                          getJsonField(
                                                        tipListItemItem,
                                                        r'''$.generic_item_id''',
                                                      ).toString(),
                                                      paramListId: '',
                                                      paramUnit: getJsonField(
                                                        tipListItemItem,
                                                        r'''$.default_unit''',
                                                      ).toString(),
                                                      paramID: getJsonField(
                                                        tipListItemItem,
                                                        r'''$.list_item_id''',
                                                      ).toString(),
                                                      marketID:
                                                          widget.supermarketID,
                                                      tripID: widget.tripID,
                                                      qtdPadrao: getJsonField(
                                                        tipListItemItem,
                                                        r'''$.default_increment''',
                                                      ),
                                                      aoAdicionar: (newRowID,
                                                          qtd) async {
                                                        _model.itemAdd =
                                                            getJsonField(
                                                          tipListItemItem,
                                                          r'''$.item_name''',
                                                        ).toString();
                                                        _model.itemIDAdd =
                                                            getJsonField(
                                                          tipListItemItem,
                                                          r'''$.generic_item_id''',
                                                        ).toString();
                                                        _model.itemUNAdd =
                                                            getJsonField(
                                                          tipListItemItem,
                                                          r'''$.default_unit''',
                                                        ).toString();
                                                        _model.tripItemID =
                                                            valueOrDefault<
                                                                String>(
                                                          newRowID,
                                                          '0000',
                                                        );
                                                        _model.qtdAdd = qtd;
                                                        safeSetState(() {});
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            if (_model.textController.text !=
                                                    '')
                                              wrapWithModel(
                                                model: _model
                                                    .linhaAdicionarItemModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: LinhaAdicionarItemWidget(
                                                  paramNomeItem: _model
                                                      .textController.text,
                                                  paramListId: '',
                                                  paramUnit: 'un',
                                                  aoAdicionar:
                                                      (newRowID, qtd) async {},
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 5.0))
                                      .addToStart(SizedBox(height: 10.0)),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Voltar',
                    options: FFButtonOptions(
                      width: 120.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: (widget.productInfo != null) ||
                            (_model.tripItemID != null &&
                                _model.tripItemID != ''),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CadastroSheetWidget(
                                    itemID: widget.productInfo?.genericItemId,
                                    supermarketID:
                                        widget.productInfo?.supermarketId,
                                    produtos: true,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            safeSetState(() {});
                          },
                          text: '',
                          icon: Icon(
                            Icons.add,
                            size: 28.0,
                          ),
                          options: FFButtonOptions(
                            width: 55.0,
                            height: 55.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                7.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 8.0,
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
