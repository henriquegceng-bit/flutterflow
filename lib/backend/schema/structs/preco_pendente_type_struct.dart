// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrecoPendenteTypeStruct extends BaseStruct {
  PrecoPendenteTypeStruct({
    String? barcode,
    double? price,
    String? chainName,
    String? branchName,
    DateTime? scanDate,
  })  : _barcode = barcode,
        _price = price,
        _chainName = chainName,
        _branchName = branchName,
        _scanDate = scanDate;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;

  bool hasBarcode() => _barcode != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "chain_name" field.
  String? _chainName;
  String get chainName => _chainName ?? '';
  set chainName(String? val) => _chainName = val;

  bool hasChainName() => _chainName != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "scan_date" field.
  DateTime? _scanDate;
  DateTime? get scanDate => _scanDate;
  set scanDate(DateTime? val) => _scanDate = val;

  bool hasScanDate() => _scanDate != null;

  static PrecoPendenteTypeStruct fromMap(Map<String, dynamic> data) =>
      PrecoPendenteTypeStruct(
        barcode: data['barcode'] as String?,
        price: castToType<double>(data['price']),
        chainName: data['chain_name'] as String?,
        branchName: data['branch_name'] as String?,
        scanDate: data['scan_date'] as DateTime?,
      );

  static PrecoPendenteTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? PrecoPendenteTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'barcode': _barcode,
        'price': _price,
        'chain_name': _chainName,
        'branch_name': _branchName,
        'scan_date': _scanDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'chain_name': serializeParam(
          _chainName,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'scan_date': serializeParam(
          _scanDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PrecoPendenteTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PrecoPendenteTypeStruct(
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        chainName: deserializeParam(
          data['chain_name'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        scanDate: deserializeParam(
          data['scan_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PrecoPendenteTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrecoPendenteTypeStruct &&
        barcode == other.barcode &&
        price == other.price &&
        chainName == other.chainName &&
        branchName == other.branchName &&
        scanDate == other.scanDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([barcode, price, chainName, branchName, scanDate]);
}

PrecoPendenteTypeStruct createPrecoPendenteTypeStruct({
  String? barcode,
  double? price,
  String? chainName,
  String? branchName,
  DateTime? scanDate,
}) =>
    PrecoPendenteTypeStruct(
      barcode: barcode,
      price: price,
      chainName: chainName,
      branchName: branchName,
      scanDate: scanDate,
    );
