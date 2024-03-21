// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iniciar_viagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IniciarViagemController on IniciarViagemControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'IniciarViagemControllerBase._status', context: context);

  IniciarViagemStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  IniciarViagemStateStatus get _status => status;

  @override
  set _status(IniciarViagemStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'IniciarViagemControllerBase._errorMessage', context: context);

  String get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String get _errorMessage => errorMessage;

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_lstVeiculosAtom =
      Atom(name: 'IniciarViagemControllerBase._lstVeiculos', context: context);

  List<VeiculoModel> get lstVeiculos {
    _$_lstVeiculosAtom.reportRead();
    return super._lstVeiculos;
  }

  @override
  List<VeiculoModel> get _lstVeiculos => lstVeiculos;

  @override
  set _lstVeiculos(List<VeiculoModel> value) {
    _$_lstVeiculosAtom.reportWrite(value, super._lstVeiculos, () {
      super._lstVeiculos = value;
    });
  }

  late final _$_dpdVeiculosAtom =
      Atom(name: 'IniciarViagemControllerBase._dpdVeiculos', context: context);

  ClassDropdownButton get dpdVeiculos {
    _$_dpdVeiculosAtom.reportRead();
    return super._dpdVeiculos;
  }

  @override
  ClassDropdownButton get _dpdVeiculos => dpdVeiculos;

  @override
  set _dpdVeiculos(ClassDropdownButton value) {
    _$_dpdVeiculosAtom.reportWrite(value, super._dpdVeiculos, () {
      super._dpdVeiculos = value;
    });
  }

  late final _$getVeiculosDisponiveisAsyncAction = AsyncAction(
      'IniciarViagemControllerBase.getVeiculosDisponiveis',
      context: context);

  @override
  Future<void> getVeiculosDisponiveis() {
    return _$getVeiculosDisponiveisAsyncAction
        .run(() => super.getVeiculosDisponiveis());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
