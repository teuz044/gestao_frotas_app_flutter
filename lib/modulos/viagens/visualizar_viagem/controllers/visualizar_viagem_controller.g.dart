// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visualizar_viagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VisualizarViagemController on VisualizarViagemControllerBase, Store {
  late final _$_errorMessageAtom = Atom(
      name: 'VisualizarViagemControllerBase._errorMessage', context: context);

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

  late final _$_viagemUsuarioAtom = Atom(
      name: 'VisualizarViagemControllerBase._viagemUsuario', context: context);

  VisualizarViagemModel get viagemUsuario {
    _$_viagemUsuarioAtom.reportRead();
    return super._viagemUsuario;
  }

  @override
  VisualizarViagemModel get _viagemUsuario => viagemUsuario;

  @override
  set _viagemUsuario(VisualizarViagemModel value) {
    _$_viagemUsuarioAtom.reportWrite(value, super._viagemUsuario, () {
      super._viagemUsuario = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: 'VisualizarViagemControllerBase._status', context: context);

  VisualizarViagemStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  VisualizarViagemStateStatus get _status => status;

  @override
  set _status(VisualizarViagemStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
