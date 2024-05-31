// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$isExpandedVeiculoAtom =
      Atom(name: 'HomeControllerBase.isExpandedVeiculo', context: context);

  @override
  bool get isExpandedVeiculo {
    _$isExpandedVeiculoAtom.reportRead();
    return super.isExpandedVeiculo;
  }

  @override
  set isExpandedVeiculo(bool value) {
    _$isExpandedVeiculoAtom.reportWrite(value, super.isExpandedVeiculo, () {
      super.isExpandedVeiculo = value;
    });
  }

  late final _$isExpandedComunicacaoAtom =
      Atom(name: 'HomeControllerBase.isExpandedComunicacao', context: context);

  @override
  bool get isExpandedComunicacao {
    _$isExpandedComunicacaoAtom.reportRead();
    return super.isExpandedComunicacao;
  }

  @override
  set isExpandedComunicacao(bool value) {
    _$isExpandedComunicacaoAtom.reportWrite(value, super.isExpandedComunicacao,
        () {
      super.isExpandedComunicacao = value;
    });
  }

  late final _$isExpandedViagensAtom =
      Atom(name: 'HomeControllerBase.isExpandedViagens', context: context);

  @override
  bool get isExpandedViagens {
    _$isExpandedViagensAtom.reportRead();
    return super.isExpandedViagens;
  }

  @override
  set isExpandedViagens(bool value) {
    _$isExpandedViagensAtom.reportWrite(value, super.isExpandedViagens, () {
      super.isExpandedViagens = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'HomeControllerBase._errorMessage', context: context);

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

  late final _$_infoUsuarioAtom =
      Atom(name: 'HomeControllerBase._infoUsuario', context: context);

  InfoUserModel get infoUsuario {
    _$_infoUsuarioAtom.reportRead();
    return super._infoUsuario;
  }

  @override
  InfoUserModel get _infoUsuario => infoUsuario;

  @override
  set _infoUsuario(InfoUserModel value) {
    _$_infoUsuarioAtom.reportWrite(value, super._infoUsuario, () {
      super._infoUsuario = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: 'HomeControllerBase._status', context: context);

  HomeControllerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  HomeControllerStateStatus get _status => status;

  @override
  set _status(HomeControllerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  @override
  String toString() {
    return '''
isExpandedVeiculo: ${isExpandedVeiculo},
isExpandedComunicacao: ${isExpandedComunicacao},
isExpandedViagens: ${isExpandedViagens}
    ''';
  }
}
