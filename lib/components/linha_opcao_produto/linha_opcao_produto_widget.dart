import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'linha_opcao_produto_model.dart';
export 'linha_opcao_produto_model.dart';

class LinhaOpcaoProdutoWidget extends StatefulWidget {
  const LinhaOpcaoProdutoWidget({
    super.key,
    this.alternativeProductInfo,
    this.selectedProductInfo,
    this.update,
    this.update2,
    this.newItemID,
  });

  final ViewTripProductAlternativesRow? alternativeProductInfo;
  final ViewLiveTripItemsRow? selectedProductInfo;
  final Future Function(String? linhaNova)? update;
  final Future Function()? update2;
  final String? newItemID;

  @override
  State<LinhaOpcaoProdutoWidget> createState() =>
      _LinhaOpcaoProdutoWidgetState();
}

class _LinhaOpcaoProdutoWidgetState extends State<LinhaOpcaoProdutoWidget> {
  late LinhaOpcaoProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinhaOpcaoProdutoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedAlternative =
          widget.alternativeProductInfo?.productId != null &&
                  widget.alternativeProductInfo?.productId != ''
              ? false
              : true;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
      width: double.infinity,
      height: 85.0,
      decoration: BoxDecoration(
        color: widget.alternativeProductInfo?.globalIsInCart == true
            ? Color(0x66337A9D)
            : Color(0x7FE7CFAD),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: widget.alternativeProductInfo?.globalIsInCart == true
              ? FlutterFlowTheme.of(context).tertiary
              : FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: _model.confEdit || _model.addCart || _model.remCart ? 4 : 2,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!_model.confEdit &&
                              widget.alternativeProductInfo!.showGreenButton!)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).success,
                                icon: Icon(
                                  Icons.price_check,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.confEdit = true;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.confEdit)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.confEdit = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).success,
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (widget
                                          .alternativeProductInfo!.isCustom!) {
                                        await TripItemsTable().update(
                                          data: {
                                            'unit_price': (String prc) {
                                              return double.tryParse(
                                                  prc.replaceAll(',', '.'));
                                            }(_model.textController1.text),
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            widget.alternativeProductInfo?.id,
                                          ),
                                        );
                                      } else {
                                        await PriceLogsTable().insert({
                                          'product_id': widget
                                              .alternativeProductInfo
                                              ?.productId,
                                          'supermarket_id': widget
                                              .alternativeProductInfo
                                              ?.supermarketId,
                                          'user_id': currentUserUid,
                                          'price':
                                              (String prc, double inicial) {
                                            return double.tryParse(
                                                    prc.replaceAll(',', '.')) ??
                                                inicial;
                                          }(
                                                  _model.textController1.text,
                                                  widget
                                                      .alternativeProductInfo!
                                                      .liveUnitPrice!),
                                          'scan_date': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                          'is_promotion': _model.checkboxValue,
                                        });
                                      }

                                      await widget.update2?.call();
                                      _model.confEdit = false;
                                      safeSetState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Preço registrado.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                        ],
                      ),
                      if (_model.confEdit)
                        Text(
                          'Atualizar preço?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 9.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                    ]
                        .divide(SizedBox(height: 4.0))
                        .addToStart(SizedBox(height: 22.5)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((widget.alternativeProductInfo
                                      ?.enableBlueButton ==
                                  true) &&
                              !_model.addCart &&
                              !widget.alternativeProductInfo!.globalIsInCart!)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                icon: Icon(
                                  Icons.add_shopping_cart_sharp,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.addCart = true;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.addCart)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.addCart = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).success,
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (widget.selectedProductInfo != null) {
                                        if (widget
                                            .selectedProductInfo!.isCustom!) {
                                          await TripItemsTable().update(
                                            data: {
                                              'is_in_cart': true,
                                              'actual_packages': (String qtd,
                                                      double inicial) {
                                                return double.tryParse(
                                                        qtd.replaceAll(
                                                            ',', '.')) ??
                                                    inicial;
                                              }(
                                                  _model.textController2.text,
                                                  widget
                                                      .alternativeProductInfo!
                                                      .packagesNeeded!),
                                              'unit_price': widget
                                                  .alternativeProductInfo
                                                  ?.liveUnitPrice,
                                              'target_quantity': widget
                                                  .alternativeProductInfo
                                                  ?.calculatedTotalVolume,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.alternativeProductInfo
                                                  ?.targetUpdateId,
                                            ),
                                          );
                                          await widget.update2?.call();
                                        } else {
                                          if (widget.selectedProductInfo
                                                  ?.productId ==
                                              widget.alternativeProductInfo
                                                  ?.productId) {
                                            await TripItemsTable().update(
                                              data: {
                                                'actual_packages':
                                                    (String qtd) {
                                                  return double.tryParse(
                                                      qtd.replaceAll(',', '.'));
                                                }(_model.textController1.text),
                                                'is_in_cart': true,
                                              },
                                              matchingRows: (rows) =>
                                                  rows.eqOrNull(
                                                'id',
                                                widget.alternativeProductInfo
                                                    ?.targetUpdateId,
                                              ),
                                            );
                                            await widget.update2?.call();
                                          } else {
                                            if (!widget.selectedProductInfo!
                                                .isInCart!) {
                                              await TripItemsTable().delete(
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'id',
                                                  widget.alternativeProductInfo
                                                      ?.targetUpdateId,
                                                ),
                                              );
                                            }
                                            _model.linhaNova =
                                                await TripItemsTable().insert({
                                              'trip_id': widget
                                                  .alternativeProductInfo
                                                  ?.tripId,
                                              'supermarket_id': widget
                                                  .alternativeProductInfo
                                                  ?.supermarketId,
                                              'generic_item_id': widget
                                                  .alternativeProductInfo
                                                  ?.genericItemId,
                                              'product_id': widget
                                                  .alternativeProductInfo
                                                  ?.productId,
                                              'target_quantity': widget
                                                  .alternativeProductInfo
                                                  ?.calculatedTotalVolume,
                                              'actual_packages': (String qtd,
                                                      double inicial) {
                                                return double.tryParse(
                                                        qtd.replaceAll(
                                                            ',', '.')) ??
                                                    inicial;
                                              }(
                                                  _model.textController2.text,
                                                  widget
                                                      .alternativeProductInfo!
                                                      .packagesNeeded!),
                                              'unit_price': widget
                                                  .alternativeProductInfo
                                                  ?.liveUnitPrice,
                                              'is_in_cart': true,
                                              'packages_needed': double
                                                      .tryParse(_model
                                                          .textController2
                                                          .text) ??
                                                  (widget
                                                      .alternativeProductInfo!
                                                      .packagesNeeded!),
                                              'custom_name': widget
                                                  .alternativeProductInfo
                                                  ?.genericName,
                                            });
                                            await widget.update?.call(
                                              _model.linhaNova?.id,
                                            );
                                          }
                                        }
                                      } else {
                                        await TripItemsTable().delete(
                                          matchingRows: (rows) => rows
                                              .eqOrNull(
                                                'generic_item_id',
                                                widget.alternativeProductInfo
                                                    ?.genericItemId,
                                              )
                                              .isFilter(
                                                'product_id',
                                                null,
                                              ),
                                        );
                                        await TripItemsTable().insert({
                                          'trip_id': widget
                                              .alternativeProductInfo?.tripId,
                                          'supermarket_id': widget
                                              .alternativeProductInfo
                                              ?.supermarketId,
                                          'generic_item_id': widget
                                              .alternativeProductInfo
                                              ?.genericItemId,
                                          'product_id': widget
                                              .alternativeProductInfo
                                              ?.productId,
                                          'target_quantity': widget
                                              .alternativeProductInfo
                                              ?.calculatedTotalVolume,
                                          'actual_packages':
                                              (String qtd, double inicial) {
                                            return double.tryParse(
                                                    qtd.replaceAll(',', '.')) ??
                                                inicial;
                                          }(
                                                  _model.textController2.text,
                                                  widget
                                                      .alternativeProductInfo!
                                                      .packagesNeeded!),
                                          'unit_price': widget
                                              .alternativeProductInfo
                                              ?.liveUnitPrice,
                                          'is_in_cart': true,
                                          'packages_needed': double.tryParse(
                                                  _model
                                                      .textController2.text) ??
                                              (widget.alternativeProductInfo!
                                                  .packagesNeeded!),
                                          'custom_name': widget
                                              .alternativeProductInfo
                                              ?.genericName,
                                        });
                                        await widget.update2?.call();
                                      }

                                      _model.addCart = false;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                        ],
                      ),
                      if (_model.addCart)
                        Text(
                          'Inserir no carrinho?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 9.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                    ]
                        .divide(SizedBox(height: 4.0))
                        .addToStart(SizedBox(height: 22.5)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!_model.addCart &&
                              widget.alternativeProductInfo!.globalIsInCart! &&
                              !_model.remCart &&
                              (widget.alternativeProductInfo
                                      ?.enableBlueButton ==
                                  false) &&
                              (widget.alternativeProductInfo
                                      ?.showGreenButton ==
                                  false) &&
                              !_model.remList)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).alternate,
                                icon: Icon(
                                  Icons.remove_shopping_cart,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.remCart = true;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.remCart && !_model.remList)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.remCart = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).success,
                                      icon: Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.remList = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          if (_model.remList)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await TripItemsTable().update(
                                          data: {
                                            'is_in_cart': false,
                                            'actual_packages': 0.0,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            widget.alternativeProductInfo
                                                ?.targetUpdateId,
                                          ),
                                        );
                                        _model.remList = false;
                                        _model.remCart = false;
                                        safeSetState(() {});
                                        await widget.update2?.call();
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).success,
                                      icon: Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await TripItemsTable().delete(
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            widget.alternativeProductInfo
                                                ?.targetUpdateId,
                                          ),
                                        );
                                        _model.remList = false;
                                        _model.remCart = false;
                                        safeSetState(() {});
                                        await widget.update2?.call();
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                        ],
                      ),
                      if (_model.remCart && !_model.remList)
                        Text(
                          'Retirar do carrinho?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 9.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      if (_model.remList)
                        Text(
                          'Retirar da lista?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 9.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                    ]
                        .divide(SizedBox(height: 4.0))
                        .addToStart(SizedBox(height: 22.5)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: _model.confEdit || _model.addCart || _model.remCart ? 10 : 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    _model.selectedAlternative!
                        ? widget.selectedProductInfo?.productName
                        : valueOrDefault<String>(
                            widget.alternativeProductInfo?.productName,
                            'Produto',
                          ),
                    'Produto',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!(_model.confEdit || _model.addCart || _model.remCart))
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (false)
                                  Text(
                                    '[Total: ${_model.selectedAlternative! ? widget.selectedProductInfo?.calculatedTotalVolume.toString() : widget.alternativeProductInfo?.calculatedTotalVolume.toString()} ${_model.selectedAlternative! ? widget.selectedProductInfo?.defaultUnit : widget.alternativeProductInfo?.defaultUnit}]',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                Text(
                                  '[${_model.selectedAlternative! ? valueOrDefault<String>(
                                      formatNumber(
                                        widget.selectedProductInfo
                                            ?.livePricePerUnit,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'R\$ ',
                                      ),
                                      'R\$ 0,00',
                                    ) : valueOrDefault<String>(
                                      formatNumber(
                                        widget.alternativeProductInfo
                                            ?.livePricePerUnit,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'R\$ ',
                                      ),
                                      'R\$ 0,00',
                                    )} /${_model.selectedAlternative! ? widget.selectedProductInfo?.defaultUnit : widget.alternativeProductInfo?.defaultUnit}]',
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (false)
                                      Text(
                                        'Qtd:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Text(
                                      '${widget.alternativeProductInfo!.actualPackages! > 0.0 ? formatNumber(
                                          widget.alternativeProductInfo
                                              ?.actualPackages,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                        ) : formatNumber(
                                          widget.alternativeProductInfo
                                              ?.packagesNeeded,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                        )} X',
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
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
                                ),
                                Text(
                                  '${_model.selectedAlternative! ? valueOrDefault<String>(
                                      formatNumber(
                                        widget
                                            .selectedProductInfo?.liveUnitPrice,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'R\$ ',
                                      ),
                                      'R\$ 0,00',
                                    ) : valueOrDefault<String>(
                                      formatNumber(
                                        widget.alternativeProductInfo
                                            ?.liveUnitPrice,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'R\$ ',
                                      ),
                                      'R\$ 0,00',
                                    )}',
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 3.0)),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.confEdit)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'R\$ ',
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
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          width: 60.0,
                                          child: TextFormField(
                                            controller: _model.textController1,
                                            focusNode:
                                                _model.textFieldFocusNode1,
                                            autofocus: true,
                                            enabled: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                              hintText: valueOrDefault<String>(
                                                formatNumber(
                                                  widget.alternativeProductInfo
                                                      ?.liveUnitPrice,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                ),
                                                '0,00',
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                        fontSize: 18.0,
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
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                                  fontSize: 18.0,
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
                                            textAlign: TextAlign.start,
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            enableInteractiveSelection: false,
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Promoção',
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue = newValue!);
                                      },
                                      side: (FlutterFlowTheme.of(context)
                                                  .primary !=
                                              null)
                                          ? BorderSide(
                                              width: 2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            )
                                          : null,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        if (_model.addCart)
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Qtd: ',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          width: 60.0,
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode2,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController2',
                                              Duration(milliseconds: 500),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: true,
                                            enabled: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                              hintText: valueOrDefault<String>(
                                                widget.alternativeProductInfo
                                                    ?.packagesNeeded
                                                    ?.toString(),
                                                '0,00',
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                        fontSize: 18.0,
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
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                                  fontSize: 18.0,
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
                                            textAlign: TextAlign.start,
                                            keyboardType: const TextInputType
                                                .numberWithOptions(
                                                decimal: true),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            enableInteractiveSelection: false,
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          widget.alternativeProductInfo
                                              ?.liveUnitPrice,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                          currency: 'R\$ ',
                                        ),
                                        'R\$ 0,00',
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
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total:',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            (String qtd, double prc) {
                                              return (double.tryParse(
                                                          qtd.replaceAll(
                                                              ',', '.')) ??
                                                      0.00) *
                                                  prc;
                                            }(
                                                _model.textController2.text,
                                                widget.alternativeProductInfo!
                                                    .liveUnitPrice!),
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                            currency: 'R\$ ',
                                          ),
                                          'R\$ 0,00',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 5.0))
                                  .addToEnd(SizedBox(width: 15.0)),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ]
                  .divide(SizedBox(height: 2.0))
                  .addToStart(SizedBox(height: 5.0))
                  .addToEnd(SizedBox(height: 5.0)),
            ),
          ),
          if (!(_model.confEdit || _model.addCart || _model.remCart))
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Container(
                      height: 15.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if ((_model.selectedAlternative!
                                    ? widget
                                        .selectedProductInfo?.isPriceOutdated
                                    : widget.alternativeProductInfo
                                        ?.isPriceOutdated) ??
                                true)
                              FaIcon(
                                FontAwesomeIcons.tag,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 17.0,
                              ),
                            if ((_model.selectedAlternative!
                                    ? widget.selectedProductInfo?.isInCart
                                    : widget.alternativeProductInfo
                                        ?.globalIsInCart) ??
                                true)
                              Icon(
                                Icons.shopping_cart,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 17.0,
                              ),
                            if ((_model.selectedAlternative!
                                    ? widget.selectedProductInfo!
                                        .hasCheaperAlternative!
                                    : widget.alternativeProductInfo!
                                        .hasCheaperAlternative!) &&
                                (_model.selectedAlternative!
                                    ? widget.selectedProductInfo!.isFavorite!
                                    : widget
                                        .alternativeProductInfo!.isFavorite!))
                              Icon(
                                Icons.warning_outlined,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 17.0,
                              ),
                            if (_model.selectedAlternative!
                                ? !widget
                                    .selectedProductInfo!.hasCheaperAlternative!
                                : !widget.alternativeProductInfo!
                                    .hasCheaperAlternative!)
                              Icon(
                                Icons.download_for_offline,
                                color: FlutterFlowTheme.of(context).success,
                                size: 17.0,
                              ),
                            if ((_model.selectedAlternative!
                                    ? widget.selectedProductInfo?.isFavorite
                                    : widget
                                        .alternativeProductInfo?.isFavorite) ??
                                true)
                              Icon(
                                Icons.star_rate,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 17.0,
                              ),
                          ].divide(SizedBox(width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total:',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              _model.selectedAlternative!
                                  ? valueOrDefault<String>(
                                      formatNumber(
                                        widget
                                            .selectedProductInfo?.liveTotalCost,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'R\$ ',
                                      ),
                                      'R\$ 0,00',
                                    )
                                  : valueOrDefault<String>(
                                      formatNumber(
                                        widget.alternativeProductInfo
                                            ?.liveTotalCost,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'R\$ ',
                                      ),
                                      'R\$ 0,00',
                                    ),
                              'R\$ 0,00',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Text(
                        'Atualizado em: ${_model.selectedAlternative! ? dateTimeFormat("dd/MM/yy", widget.selectedProductInfo?.liveLastScanDate) : dateTimeFormat("dd/MM/yy", widget.alternativeProductInfo?.liveLastScanDate)}',
                        textAlign: TextAlign.end,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 2.0)),
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
