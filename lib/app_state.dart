import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _listaDeComprasAtual = prefs
              .getStringList('ff_listaDeComprasAtual')
              ?.map((x) {
                try {
                  return ItemListaTypeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listaDeComprasAtual;
    });
    _safeInit(() {
      _filaDePrecos = prefs
              .getStringList('ff_filaDePrecos')
              ?.map((x) {
                try {
                  return PrecoPendenteTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _filaDePrecos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _listaTeste = '44444444-0000-0000-0000-000000000001';
  String get listaTeste => _listaTeste;
  set listaTeste(String value) {
    _listaTeste = value;
  }

  double _userLat = -19.921;
  double get userLat => _userLat;
  set userLat(double value) {
    _userLat = value;
  }

  double _userLong = -43.945;
  double get userLong => _userLong;
  set userLong(double value) {
    _userLong = value;
  }

  String _itemAddTemp = '';
  String get itemAddTemp => _itemAddTemp;
  set itemAddTemp(String value) {
    _itemAddTemp = value;
  }

  bool _editar = false;
  bool get editar => _editar;
  set editar(bool value) {
    _editar = value;
  }

  List<ItemListaTypeStruct> _listaDeComprasAtual = [];
  List<ItemListaTypeStruct> get listaDeComprasAtual => _listaDeComprasAtual;
  set listaDeComprasAtual(List<ItemListaTypeStruct> value) {
    _listaDeComprasAtual = value;
    prefs.setStringList(
        'ff_listaDeComprasAtual', value.map((x) => x.serialize()).toList());
  }

  void addToListaDeComprasAtual(ItemListaTypeStruct value) {
    listaDeComprasAtual.add(value);
    prefs.setStringList('ff_listaDeComprasAtual',
        _listaDeComprasAtual.map((x) => x.serialize()).toList());
  }

  void removeFromListaDeComprasAtual(ItemListaTypeStruct value) {
    listaDeComprasAtual.remove(value);
    prefs.setStringList('ff_listaDeComprasAtual',
        _listaDeComprasAtual.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaDeComprasAtual(int index) {
    listaDeComprasAtual.removeAt(index);
    prefs.setStringList('ff_listaDeComprasAtual',
        _listaDeComprasAtual.map((x) => x.serialize()).toList());
  }

  void updateListaDeComprasAtualAtIndex(
    int index,
    ItemListaTypeStruct Function(ItemListaTypeStruct) updateFn,
  ) {
    listaDeComprasAtual[index] = updateFn(_listaDeComprasAtual[index]);
    prefs.setStringList('ff_listaDeComprasAtual',
        _listaDeComprasAtual.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaDeComprasAtual(
      int index, ItemListaTypeStruct value) {
    listaDeComprasAtual.insert(index, value);
    prefs.setStringList('ff_listaDeComprasAtual',
        _listaDeComprasAtual.map((x) => x.serialize()).toList());
  }

  List<PrecoPendenteTypeStruct> _filaDePrecos = [];
  List<PrecoPendenteTypeStruct> get filaDePrecos => _filaDePrecos;
  set filaDePrecos(List<PrecoPendenteTypeStruct> value) {
    _filaDePrecos = value;
    prefs.setStringList(
        'ff_filaDePrecos', value.map((x) => x.serialize()).toList());
  }

  void addToFilaDePrecos(PrecoPendenteTypeStruct value) {
    filaDePrecos.add(value);
    prefs.setStringList(
        'ff_filaDePrecos', _filaDePrecos.map((x) => x.serialize()).toList());
  }

  void removeFromFilaDePrecos(PrecoPendenteTypeStruct value) {
    filaDePrecos.remove(value);
    prefs.setStringList(
        'ff_filaDePrecos', _filaDePrecos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFilaDePrecos(int index) {
    filaDePrecos.removeAt(index);
    prefs.setStringList(
        'ff_filaDePrecos', _filaDePrecos.map((x) => x.serialize()).toList());
  }

  void updateFilaDePrecosAtIndex(
    int index,
    PrecoPendenteTypeStruct Function(PrecoPendenteTypeStruct) updateFn,
  ) {
    filaDePrecos[index] = updateFn(_filaDePrecos[index]);
    prefs.setStringList(
        'ff_filaDePrecos', _filaDePrecos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFilaDePrecos(int index, PrecoPendenteTypeStruct value) {
    filaDePrecos.insert(index, value);
    prefs.setStringList(
        'ff_filaDePrecos', _filaDePrecos.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
