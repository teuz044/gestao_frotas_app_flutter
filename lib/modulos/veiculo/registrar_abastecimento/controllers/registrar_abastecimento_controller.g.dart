// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrar_abastecimento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrarAbastecimentoController
    on RegistrarAbastecimentoControllerBase, Store {
  late final _$_statusAtom = Atom(
      name: 'RegistrarAbastecimentoControllerBase._status', context: context);

  RegistrarAbastecimentoVeiculoStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  RegistrarAbastecimentoVeiculoStatus get _status => status;

  @override
  set _status(RegistrarAbastecimentoVeiculoStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'RegistrarAbastecimentoControllerBase._errorMessage',
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

  late final _$_lstAbastecimentosAtom = Atom(
      name: 'RegistrarAbastecimentoControllerBase._lstAbastecimentos',
      context: context);

  List<RegistrarAbastecimentoModelSet> get lstAbastecimentos {
    _$_lstAbastecimentosAtom.reportRead();
    return super._lstAbastecimentos;
  }

  @override
  List<RegistrarAbastecimentoModelSet> get _lstAbastecimentos =>
      lstAbastecimentos;

  @override
  set _lstAbastecimentos(List<RegistrarAbastecimentoModelSet> value) {
    _$_lstAbastecimentosAtom.reportWrite(value, super._lstAbastecimentos, () {
      super._lstAbastecimentos = value;
    });
  }

  late final _$getAbastecimentosDoUsuarioAsyncAction = AsyncAction(
      'RegistrarAbastecimentoControllerBase.getAbastecimentosDoUsuario',
      context: context);

  @override
  Future<void> getAbastecimentosDoUsuario() {
    return _$getAbastecimentosDoUsuarioAsyncAction
        .run(() => super.getAbastecimentosDoUsuario());
  }

  late final _$setAbastecimentoAsyncAction = AsyncAction(
      'RegistrarAbastecimentoControllerBase.setAbastecimento',
      context: context);

  @override
  Future<void> setAbastecimento() {
    return _$setAbastecimentoAsyncAction.run(() => super.setAbastecimento());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
