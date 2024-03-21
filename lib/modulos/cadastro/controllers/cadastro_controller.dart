// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../models/cadastro_model.dart';
import '../repository/cadastro_repository.dart';
part 'cadastro_controller.g.dart';

class CadastroController = CadastroControllerBase with _$CadastroController;

enum CadastroStateStatus {
  initial,
  loading,
  success,
  successResetPassword,
  error;
}

abstract class CadastroControllerBase with Store {
  final CadastroRepository _cadastroRepository;

  CadastroControllerBase(this._cadastroRepository);

  @readonly
  var _status = CadastroStateStatus.initial;

  @readonly
  String? _errorMessage = '';

  final formKey = GlobalKey<FormState>();
  final idClienteEC = TextEditingController();
  final nomeEC = TextEditingController();
  final emailEC = TextEditingController();
  final senhaEC = TextEditingController();
  final tipoUsuarioEC = TextEditingController();
  final cpfEC = TextEditingController();
  final rgEC = TextEditingController();
  final dataNascimentoEC = TextEditingController();
  final celularEC = TextEditingController();
  final endereOEC = TextEditingController();
  final cepEC = TextEditingController();
  final cidadeEC = TextEditingController();
  final estadoEC = TextEditingController();
  final statusContaEC = TextEditingController();

  @readonly
  bool _carregando = false;

  @action
  Future<bool> registro() async {
    try {
      _status =  CadastroStateStatus.loading;
      _carregando = true;
      final Map<String, dynamic>? loginData =
          await _cadastroRepository.registro(
        CadastroModel(
          idCliente: 1,
          nome: nomeEC.text,
          email: emailEC.text,
          senha: senhaEC.text,
          tipoUsuario: 1,
          cpf: cpfEC.text,
          rg: rgEC.text,
          dataNascimento: dataNascimentoEC.text,
          celular: celularEC.text,
          endereO: endereOEC.text,
          cep: cepEC.text,
          cidade: cidadeEC.text,
          estado: estadoEC.text,
          statusConta: 'aa',
        ),
      );
      final String? token = loginData?['token'];
      final int? statusCode = loginData?['statusCode'];
      await Future.delayed(Duration.zero);
      if (statusCode == 201) {
        _carregando = false;
        _status =  CadastroStateStatus.success;
        return true;
      } else {
        _carregando = false;
        _status =  CadastroStateStatus.error;
        _errorMessage = 'Registro falhou';
        return false;
      }
    } catch (e) {
      _carregando = false;
      _status =  CadastroStateStatus.error;
      throw Exception('Registro falhou');
    }
  }
}
