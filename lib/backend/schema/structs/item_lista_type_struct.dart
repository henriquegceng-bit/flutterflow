// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemListaTypeStruct extends BaseStruct {
  ItemListaTypeStruct({
    String? tripItemId,
    String? tripId,
    String? genericItemId,
    String? productId,
    String? customName,
    String? categoryName,
    String? supermarketName,
    String? supermarketId,
    double? targetQuantity,
    double? packagesNeeded,
    double? actualPackages,
    double? unitPrice,
    bool? isInCart,
    String? barcode,
    String? imageUrl,
  })  : _tripItemId = tripItemId,
        _tripId = tripId,
        _genericItemId = genericItemId,
        _productId = productId,
        _customName = customName,
        _categoryName = categoryName,
        _supermarketName = supermarketName,
        _supermarketId = supermarketId,
        _targetQuantity = targetQuantity,
        _packagesNeeded = packagesNeeded,
        _actualPackages = actualPackages,
        _unitPrice = unitPrice,
        _isInCart = isInCart,
        _barcode = barcode,
        _imageUrl = imageUrl;

  // "trip_item_id" field.
  String? _tripItemId;
  String get tripItemId => _tripItemId ?? '';
  set tripItemId(String? val) => _tripItemId = val;

  bool hasTripItemId() => _tripItemId != null;

  // "trip_id" field.
  String? _tripId;
  String get tripId => _tripId ?? '';
  set tripId(String? val) => _tripId = val;

  bool hasTripId() => _tripId != null;

  // "generic_item_id" field.
  String? _genericItemId;
  String get genericItemId => _genericItemId ?? '';
  set genericItemId(String? val) => _genericItemId = val;

  bool hasGenericItemId() => _genericItemId != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "custom_name" field.
  String? _customName;
  String get customName => _customName ?? '';
  set customName(String? val) => _customName = val;

  bool hasCustomName() => _customName != null;

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;

  bool hasCategoryName() => _categoryName != null;

  // "supermarket_name" field.
  String? _supermarketName;
  String get supermarketName => _supermarketName ?? '';
  set supermarketName(String? val) => _supermarketName = val;

  bool hasSupermarketName() => _supermarketName != null;

  // "supermarket_id" field.
  String? _supermarketId;
  String get supermarketId => _supermarketId ?? '';
  set supermarketId(String? val) => _supermarketId = val;

  bool hasSupermarketId() => _supermarketId != null;

  // "target_quantity" field.
  double? _targetQuantity;
  double get targetQuantity => _targetQuantity ?? 0.0;
  set targetQuantity(double? val) => _targetQuantity = val;

  void incrementTargetQuantity(double amount) =>
      targetQuantity = targetQuantity + amount;

  bool hasTargetQuantity() => _targetQuantity != null;

  // "packages_needed" field.
  double? _packagesNeeded;
  double get packagesNeeded => _packagesNeeded ?? 0.0;
  set packagesNeeded(double? val) => _packagesNeeded = val;

  void incrementPackagesNeeded(double amount) =>
      packagesNeeded = packagesNeeded + amount;

  bool hasPackagesNeeded() => _packagesNeeded != null;

  // "actual_packages" field.
  double? _actualPackages;
  double get actualPackages => _actualPackages ?? 0.0;
  set actualPackages(double? val) => _actualPackages = val;

  void incrementActualPackages(double amount) =>
      actualPackages = actualPackages + amount;

  bool hasActualPackages() => _actualPackages != null;

  // "unit_price" field.
  double? _unitPrice;
  double get unitPrice => _unitPrice ?? 0.0;
  set unitPrice(double? val) => _unitPrice = val;

  void incrementUnitPrice(double amount) => unitPrice = unitPrice + amount;

  bool hasUnitPrice() => _unitPrice != null;

  // "is_in_cart" field.
  bool? _isInCart;
  bool get isInCart => _isInCart ?? false;
  set isInCart(bool? val) => _isInCart = val;

  bool hasIsInCart() => _isInCart != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;

  bool hasBarcode() => _barcode != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  static ItemListaTypeStruct fromMap(Map<String, dynamic> data) =>
      ItemListaTypeStruct(
        tripItemId: data['trip_item_id'] as String?,
        tripId: data['trip_id'] as String?,
        genericItemId: data['generic_item_id'] as String?,
        productId: data['product_id'] as String?,
        customName: data['custom_name'] as String?,
        categoryName: data['category_name'] as String?,
        supermarketName: data['supermarket_name'] as String?,
        supermarketId: data['supermarket_id'] as String?,
        targetQuantity: castToType<double>(data['target_quantity']),
        packagesNeeded: castToType<double>(data['packages_needed']),
        actualPackages: castToType<double>(data['actual_packages']),
        unitPrice: castToType<double>(data['unit_price']),
        isInCart: data['is_in_cart'] as bool?,
        barcode: data['barcode'] as String?,
        imageUrl: data['image_url'] as String?,
      );

  static ItemListaTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemListaTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'trip_item_id': _tripItemId,
        'trip_id': _tripId,
        'generic_item_id': _genericItemId,
        'product_id': _productId,
        'custom_name': _customName,
        'category_name': _categoryName,
        'supermarket_name': _supermarketName,
        'supermarket_id': _supermarketId,
        'target_quantity': _targetQuantity,
        'packages_needed': _packagesNeeded,
        'actual_packages': _actualPackages,
        'unit_price': _unitPrice,
        'is_in_cart': _isInCart,
        'barcode': _barcode,
        'image_url': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'trip_item_id': serializeParam(
          _tripItemId,
          ParamType.String,
        ),
        'trip_id': serializeParam(
          _tripId,
          ParamType.String,
        ),
        'generic_item_id': serializeParam(
          _genericItemId,
          ParamType.String,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'custom_name': serializeParam(
          _customName,
          ParamType.String,
        ),
        'category_name': serializeParam(
          _categoryName,
          ParamType.String,
        ),
        'supermarket_name': serializeParam(
          _supermarketName,
          ParamType.String,
        ),
        'supermarket_id': serializeParam(
          _supermarketId,
          ParamType.String,
        ),
        'target_quantity': serializeParam(
          _targetQuantity,
          ParamType.double,
        ),
        'packages_needed': serializeParam(
          _packagesNeeded,
          ParamType.double,
        ),
        'actual_packages': serializeParam(
          _actualPackages,
          ParamType.double,
        ),
        'unit_price': serializeParam(
          _unitPrice,
          ParamType.double,
        ),
        'is_in_cart': serializeParam(
          _isInCart,
          ParamType.bool,
        ),
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemListaTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemListaTypeStruct(
        tripItemId: deserializeParam(
          data['trip_item_id'],
          ParamType.String,
          false,
        ),
        tripId: deserializeParam(
          data['trip_id'],
          ParamType.String,
          false,
        ),
        genericItemId: deserializeParam(
          data['generic_item_id'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        customName: deserializeParam(
          data['custom_name'],
          ParamType.String,
          false,
        ),
        categoryName: deserializeParam(
          data['category_name'],
          ParamType.String,
          false,
        ),
        supermarketName: deserializeParam(
          data['supermarket_name'],
          ParamType.String,
          false,
        ),
        supermarketId: deserializeParam(
          data['supermarket_id'],
          ParamType.String,
          false,
        ),
        targetQuantity: deserializeParam(
          data['target_quantity'],
          ParamType.double,
          false,
        ),
        packagesNeeded: deserializeParam(
          data['packages_needed'],
          ParamType.double,
          false,
        ),
        actualPackages: deserializeParam(
          data['actual_packages'],
          ParamType.double,
          false,
        ),
        unitPrice: deserializeParam(
          data['unit_price'],
          ParamType.double,
          false,
        ),
        isInCart: deserializeParam(
          data['is_in_cart'],
          ParamType.bool,
          false,
        ),
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemListaTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemListaTypeStruct &&
        tripItemId == other.tripItemId &&
        tripId == other.tripId &&
        genericItemId == other.genericItemId &&
        productId == other.productId &&
        customName == other.customName &&
        categoryName == other.categoryName &&
        supermarketName == other.supermarketName &&
        supermarketId == other.supermarketId &&
        targetQuantity == other.targetQuantity &&
        packagesNeeded == other.packagesNeeded &&
        actualPackages == other.actualPackages &&
        unitPrice == other.unitPrice &&
        isInCart == other.isInCart &&
        barcode == other.barcode &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tripItemId,
        tripId,
        genericItemId,
        productId,
        customName,
        categoryName,
        supermarketName,
        supermarketId,
        targetQuantity,
        packagesNeeded,
        actualPackages,
        unitPrice,
        isInCart,
        barcode,
        imageUrl
      ]);
}

ItemListaTypeStruct createItemListaTypeStruct({
  String? tripItemId,
  String? tripId,
  String? genericItemId,
  String? productId,
  String? customName,
  String? categoryName,
  String? supermarketName,
  String? supermarketId,
  double? targetQuantity,
  double? packagesNeeded,
  double? actualPackages,
  double? unitPrice,
  bool? isInCart,
  String? barcode,
  String? imageUrl,
}) =>
    ItemListaTypeStruct(
      tripItemId: tripItemId,
      tripId: tripId,
      genericItemId: genericItemId,
      productId: productId,
      customName: customName,
      categoryName: categoryName,
      supermarketName: supermarketName,
      supermarketId: supermarketId,
      targetQuantity: targetQuantity,
      packagesNeeded: packagesNeeded,
      actualPackages: actualPackages,
      unitPrice: unitPrice,
      isInCart: isInCart,
      barcode: barcode,
      imageUrl: imageUrl,
    );
