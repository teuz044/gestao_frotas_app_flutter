import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/models/avarias_get_model.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/models/avarias_set_model.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/repositories/registrar_avarias_veiculo_repository.dart';
import 'package:mobx/mobx.dart';
part 'registrar_avarias_veiculo_controller.g.dart';

class RegistrarAvariasVeiculoController = RegistrarAvariasVeiculoControllerBase with _$RegistrarAvariasVeiculoController;

enum RegistrarAvariasVeiculoStatus {
  initial,
  loading,
  success,
  successResetPassword,
  error;
}

abstract class RegistrarAvariasVeiculoControllerBase with Store {
  final RegistrarAvariasVeiculoRepository _registrarAvariasVeiculoRepository;
  RegistrarAvariasVeiculoControllerBase(this._registrarAvariasVeiculoRepository);

 @readonly
  var _status = RegistrarAvariasVeiculoStatus.initial;

  @readonly
  String _errorMessage = '';

  @readonly
  var _lstAvarias = <AvariasGetModel>[];

  final tituloAvariaEC = TextEditingController();
  final mensagemAvariaEC = TextEditingController();


  @action
  Future<void> getAvariasDoUsuario() async{
    try {
      _status = RegistrarAvariasVeiculoStatus.loading;
      await Future.delayed(Duration.zero);
     _lstAvarias = await _registrarAvariasVeiculoRepository.getAvariasDoUsuario();
     _status = RegistrarAvariasVeiculoStatus.success;
    } catch (e) {
      log('Erro ao buscar informações do usuário');
      _status = RegistrarAvariasVeiculoStatus.error;
      rethrow;
    }
  }

  @action
  Future<void> setAvariasDoUsuario() async{
    try {
      _status = RegistrarAvariasVeiculoStatus.loading;
      await Future.delayed(Duration.zero);
      await _registrarAvariasVeiculoRepository.setAvariasDoUsuario(
        AvariasSetModel(
          idUsuario:session.Session.userId,
          idVeiculo: session.Session.userIdVeiculo,
          mensagemAvaria: mensagemAvariaEC.text,
          tituloAvaria: tituloAvariaEC.text,
          statusAvaria: '0',
        ),
      );
     _status = RegistrarAvariasVeiculoStatus.success;
    } catch (e) {
      log('Erro ao salvar avarias');
      _status = RegistrarAvariasVeiculoStatus.error;
      rethrow;
    }
  }
}