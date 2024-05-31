// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrar_avarias_veiculo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrarAvariasVeiculoController
    on RegistrarAvariasVeiculoControllerBase, Store {
  late final _$_statusAtom = Atom(
      name: 'RegistrarAvariasVeiculoControllerBase._status', context: context);

  RegistrarAvariasVeiculoStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  RegistrarAvariasVeiculoStatus get _status => status;

  @override
  set _status(RegistrarAvariasVeiculoStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'RegistrarAvariasVeiculoControllerBase._errorMessage',
      context: context);

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

  late final _$_lstAvariasAtom = Atom(
      name: 'RegistrarAvariasVeiculoControllerBase._lstAvarias',
      context: context);

  List<AvariasGetModel> get lstAvarias {
    _$_lstAvariasAtom.reportRead();
    return super._lstAvarias;
  }

  @override
  List<AvariasGetModel> get _lstAvarias => lstAvarias;

  @override
  set _lstAvarias(List<AvariasGetModel> value) {
    _$_lstAvariasAtom.reportWrite(value, super._lstAvarias, () {
      super._lstAvarias = value;
    });
  }

  late final _$getAvariasDoUsuarioAsyncAction = AsyncAction(
      'RegistrarAvariasVeiculoControllerBase.getAvariasDoUsuario',
      context: context);

  @override
  Future<void> getAvariasDoUsuario() {
    return _$getAvariasDoUsuarioAsyncAction
        .run(() => super.getAvariasDoUsuario());
  }

  late final _$setAvariasDoUsuarioAsyncAction = AsyncAction(
      'RegistrarAvariasVeiculoControllerBase.setAvariasDoUsuario',
      context: context);

  @override
  Future<void> setAvariasDoUsuario() {
    return _$setAvariasDoUsuarioAsyncAction
        .run(() => super.setAvariasDoUsuario());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
