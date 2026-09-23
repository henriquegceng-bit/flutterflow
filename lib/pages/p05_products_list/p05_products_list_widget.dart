import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/bottomsheets/product_alternative_sheet/product_alternative_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'p05_products_list_model.dart';
export 'p05_products_list_model.dart';

class P05ProductsListWidget extends StatefulWidget {
  const P05ProductsListWidget({
    super.key,
    this.tripListID,
    this.listName,
    this.tripListData,
  });

  final String? tripListID;
  final String? listName;
  final dynamic tripListData;

  static String routeName = 'p05_ProductsList';
  static String routePath = '/p05ProductsList';

  @override
  State<P05ProductsListWidget> createState() => _P05ProductsListWidgetState();
}

class _P05ProductsListWidgetState extends State<P05ProductsListWidget> {
  late P05ProductsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P05ProductsListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.marketID = getJsonField(
        widget.tripListData,
        r'''$.supermarket_id''',
      ).toString();
      safeSetState(() {});
    });

    _model.switchValue = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ViewTripMarketsRow>>(
      future: ViewTripMarketsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'trip_id',
              widget.tripListID,
            )
            .order('supermarket_name', ascending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ViewTripMarketsRow> p05ProductsListViewTripMarketsRowList =
            snapshot.data!;

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
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
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
                          child: ProductAlternativeSheetWidget(
                            supermarketID: p05ProductsListViewTripMarketsRowList
                                .elementAtOrNull(_model.pageViewCurrentIndex)
                                ?.supermarketId,
                            tripID: widget.tripListID,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.goNamed(
                                                    P02ShoppingListWidget
                                                        .routeName);
                                              },
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Lista de Compras',
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget.listName,
                                                        'PRODUTOS',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
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
                                        Icon(
                                          Icons.shopping_cart_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 30.0,
                                        ),
                                        Switch.adaptive(
                                          value: _model.switchValue!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.switchValue = newValue);
                                            if (newValue) {
                                              _model.hideCart = true;
                                              safeSetState(() {});
                                            } else {
                                              _model.hideCart = false;
                                              safeSetState(() {});
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                _model.aPIResultado =
                                                    await FinalizarCompraCall
                                                        .call();

                                                if ((_model.aPIResultado
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Lista finalizada.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              text: 'Finalizar',
                                              options: FFButtonOptions(
                                                width: 110.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
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
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final tripMarkets =
                                            p05ProductsListViewTripMarketsRowList
                                                .toList();

                                        return Container(
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  tripMarkets
                                                                          .length -
                                                                      1))),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: tripMarkets.length,
                                                  itemBuilder: (context,
                                                      tripMarketsIndex) {
                                                    final tripMarketsItem =
                                                        tripMarkets[
                                                            tripMarketsIndex];
                                                    return Stack(
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                tripMarketsItem
                                                                    .supermarketName,
                                                                'Supermercado',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Divider(
                                                              thickness: 2.0,
                                                              indent: 20.0,
                                                              endIndent: 20.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child: FutureBuilder<
                                                                            List<ViewTripCategoriesRow>>(
                                                                          future:
                                                                              ViewTripCategoriesTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eqOrNull(
                                                                                  'supermarket_id',
                                                                                  tripMarketsItem.supermarketId,
                                                                                )
                                                                                .order('category_name', ascending: true),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<ViewTripCategoriesRow>
                                                                                listViewViewTripCategoriesRowList =
                                                                                snapshot.data!;

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                5.0,
                                                                                0,
                                                                                0,
                                                                              ),
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewViewTripCategoriesRowList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewViewTripCategoriesRow = listViewViewTripCategoriesRowList[listViewIndex];
                                                                                return StickyHeader(
                                                                                  overlapHeaders: false,
                                                                                  header: Align(
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
                                                                                            valueOrDefault<String>(
                                                                                              listViewViewTripCategoriesRow.categoryName,
                                                                                              'Categoria',
                                                                                            ),
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
                                                                                  content: FutureBuilder<List<ViewLiveTripItemsRow>>(
                                                                                    future: ViewLiveTripItemsTable().queryRows(
                                                                                      queryFn: (q) => q
                                                                                          .eqOrNull(
                                                                                            'trip_id',
                                                                                            listViewViewTripCategoriesRow.tripId,
                                                                                          )
                                                                                          .eqOrNull(
                                                                                            'supermarket_id',
                                                                                            listViewViewTripCategoriesRow.supermarketId,
                                                                                          )
                                                                                          .eqOrNull(
                                                                                            'category_name',
                                                                                            listViewViewTripCategoriesRow.categoryName,
                                                                                          )
                                                                                          .order('is_in_cart', ascending: true)
                                                                                          .order('product_name', ascending: true),
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
                                                                                      List<ViewLiveTripItemsRow> listViewViewLiveTripItemsRowList = snapshot.data!;

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
                                                                                        itemCount: listViewViewLiveTripItemsRowList.length,
                                                                                        separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                        itemBuilder: (context, listViewIndex) {
                                                                                          final listViewViewLiveTripItemsRow = listViewViewLiveTripItemsRowList[listViewIndex];
                                                                                          return Visibility(
                                                                                            visible: () {
                                                                                              if (listViewViewLiveTripItemsRow.isInCart == false) {
                                                                                                return true;
                                                                                              } else if (!_model.switchValue!) {
                                                                                                return false;
                                                                                              } else {
                                                                                                return true;
                                                                                              }
                                                                                            }(),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () {
                                                                                                        FocusScope.of(context).unfocus();
                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                      },
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                        child: ProductAlternativeSheetWidget(
                                                                                                          productInfo: listViewViewLiveTripItemsRow,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
                                                                                              },
                                                                                              onLongPress: () async {
                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                      context: context,
                                                                                                      builder: (alertDialogContext) {
                                                                                                        return AlertDialog(
                                                                                                          title: Text('Remover produto'),
                                                                                                          content: Text('Deseja remover este produto da lista?'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                              child: Text('Cancelar'),
                                                                                                            ),
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                              child: Text('Confirmar'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        );
                                                                                                      },
                                                                                                    ) ??
                                                                                                    false;
                                                                                                if (confirmDialogResponse) {
                                                                                                  await TripItemsTable().delete(
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'id',
                                                                                                      listViewViewLiveTripItemsRow.id,
                                                                                                    ),
                                                                                                  );
                                                                                                  safeSetState(() {});
                                                                                                }
                                                                                              },
                                                                                              child: Container(
                                                                                                height: 60.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: listViewViewLiveTripItemsRow.isInCart == true ? Color(0x66337A9D) : Color(0x7FE7CFAD),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  border: Border.all(
                                                                                                    color: listViewViewLiveTripItemsRow.isInCart == true ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).alternate,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      flex: 3,
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          '${formatNumber(
                                                                                                            listViewViewLiveTripItemsRow.calculatedTotalVolume,
                                                                                                            formatType: FormatType.decimal,
                                                                                                            decimalType: DecimalType.commaDecimal,
                                                                                                          )} ${listViewViewLiveTripItemsRow.defaultUnit}',
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      flex: 8,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                listViewViewLiveTripItemsRow.productName,
                                                                                                                'Produto',
                                                                                                              ),
                                                                                                              textAlign: TextAlign.start,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      flex: 4,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            '${listViewViewLiveTripItemsRow.actualPackages! > 0.0 ? formatNumber(
                                                                                                                listViewViewLiveTripItemsRow.actualPackages,
                                                                                                                formatType: FormatType.decimal,
                                                                                                                decimalType: DecimalType.commaDecimal,
                                                                                                              ) : formatNumber(
                                                                                                                listViewViewLiveTripItemsRow.packagesNeeded,
                                                                                                                formatType: FormatType.decimal,
                                                                                                                decimalType: DecimalType.commaDecimal,
                                                                                                              )} X ',
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              formatNumber(
                                                                                                                listViewViewLiveTripItemsRow.liveUnitPrice,
                                                                                                                formatType: FormatType.decimal,
                                                                                                                decimalType: DecimalType.commaDecimal,
                                                                                                                currency: 'R\$ ',
                                                                                                              ),
                                                                                                              'R\$ 0,00',
                                                                                                            ),
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 2.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      flex: 5,
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                                            child: Container(
                                                                                                              width: 75.0,
                                                                                                              height: 15.0,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Align(
                                                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  children: [
                                                                                                                    if (listViewViewLiveTripItemsRow.isPriceOutdated ?? true)
                                                                                                                      FaIcon(
                                                                                                                        FontAwesomeIcons.tag,
                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                        size: 15.0,
                                                                                                                      ),
                                                                                                                    if (!listViewViewLiveTripItemsRow.hasCheaperAlternative!)
                                                                                                                      Icon(
                                                                                                                        Icons.download_for_offline,
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 15.0,
                                                                                                                      ),
                                                                                                                    if (listViewViewLiveTripItemsRow.hasCheaperAlternative ?? true)
                                                                                                                      Icon(
                                                                                                                        Icons.report_problem_rounded,
                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                        size: 15.0,
                                                                                                                      ),
                                                                                                                    if (listViewViewLiveTripItemsRow.isFavorite ?? true)
                                                                                                                      Icon(
                                                                                                                        Icons.star,
                                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                        size: 15.0,
                                                                                                                      ),
                                                                                                                  ].divide(SizedBox(width: 1.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                            child: Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                formatNumber(
                                                                                                                  listViewViewLiveTripItemsRow.liveTotalCost,
                                                                                                                  formatType: FormatType.decimal,
                                                                                                                  decimalType: DecimalType.commaDecimal,
                                                                                                                  currency: 'R\$ ',
                                                                                                                ),
                                                                                                                'R\$ 0,00',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                              child: Text(
                                                                                                                'Atualizado em: ${dateTimeFormat("dd/MM/yy", listViewViewLiveTripItemsRow.liveLastScanDate)}',
                                                                                                                textAlign: TextAlign.end,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      fontSize: 10.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 1.0)).addToStart(SizedBox(height: 2.0)).addToEnd(SizedBox(height: 2.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 5.0)).addToStart(SizedBox(width: 10.0)).addToEnd(SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ),
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
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                            Opacity(
                                                              opacity: 0.8,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        ViewTripSummaryByMarketRow>>(
                                                                  future: ViewTripSummaryByMarketTable()
                                                                      .querySingleRow(
                                                                    queryFn: (q) => q
                                                                        .eqOrNull(
                                                                          'trip_id',
                                                                          widget
                                                                              .tripListID,
                                                                        )
                                                                        .eqOrNull(
                                                                          'supermarket_id',
                                                                          tripMarketsItem
                                                                              .supermarketId,
                                                                        ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ViewTripSummaryByMarketRow>
                                                                        containerViewTripSummaryByMarketRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    final containerViewTripSummaryByMarketRow = containerViewTripSummaryByMarketRowList
                                                                            .isNotEmpty
                                                                        ? containerViewTripSummaryByMarketRowList
                                                                            .first
                                                                        : null;

                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          10.0,
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            75.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xCD337A9D),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 10.0,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              offset: Offset(
                                                                                0.0,
                                                                                -2.0,
                                                                              ),
                                                                              spreadRadius: 2.0,
                                                                            )
                                                                          ],
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Resumo da compra',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.w800,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w800,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 45.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          'Produtos: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        '${containerViewTripSummaryByMarketRow?.itemsInCart?.toString()} / ${containerViewTripSummaryByMarketRow?.totalItems?.toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          'Valor: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        '${formatNumber(
                                                                                          containerViewTripSummaryByMarketRow?.currentCartValue,
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.commaDecimal,
                                                                                          currency: 'R\$ ',
                                                                                        )} / ${formatNumber(
                                                                                          containerViewTripSummaryByMarketRow?.totalEstimatedValue,
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.commaDecimal,
                                                                                          currency: 'R\$ ',
                                                                                        )}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 5.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    tripMarkets
                                                                            .length -
                                                                        1))),
                                                    count: tripMarkets.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    effect:
                                                        smooth_page_indicator
                                                            .SlideEffect(
                                                      spacing: 8.0,
                                                      radius: 8.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
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
      },
    );
  }
}
