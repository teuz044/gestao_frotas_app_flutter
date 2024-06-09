// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_abastecimento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoricoAbastecimentoController
    on HistoricoAbastecimentoControllerBase, Store {
  late final _$_statusAtom = Atom(
      name: 'HistoricoAbastecimentoControllerBase._status', context: context);

  AbastecimentoVeiculoStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  AbastecimentoVeiculoStatus get _status => status;

  @override
  set _status(AbastecimentoVeiculoStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'HistoricoAbastecimentoControllerBase._errorMessage',
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
      name: 'HistoricoAbastecimentoControllerBase._lstAbastecimentos',
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
      'HistoricoAbastecimentoControllerBase.getAbastecimentosDoUsuario',
      context: context);

  @override
  Future<void> getAbastecimentosDoUsuario() {
    return _$getAbastecimentosDoUsuarioAsyncAction
        .run(() => super.getAbastecimentosDoUsuario());
  }

  late final _$HistoricoAbastecimentoControllerBaseActionController =
      ActionController(
          name: 'HistoricoAbastecimentoControllerBase', context: context);

  @override
  String calcularValorTotal(int index) {
    final _$actionInfo =
        _$HistoricoAbastecimentoControllerBaseActionController.startAction(
            name: 'HistoricoAbastecimentoControllerBase.calcularValorTotal');
    try {
      return super.calcularValorTotal(index);
    } finally {
      _$HistoricoAbastecimentoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
