// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../repository/login_repository.dart';
import '/../core/session/session.dart' as session;
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

enum LoginStateStatus {
  initial,
  loading,
  success,
  successResetPassword,
  error;
}

abstract class LoginControllerBase with Store {
  final LoginRepository _loginRepository;
  LoginControllerBase(this._loginRepository);

  final emailEC = TextEditingController();
  final senhaEC = TextEditingController();

  @readonly
  var _status = LoginStateStatus.initial;

  @readonly
  String _errorMessage = '';

  @readonly
  bool _carregando = false;

  @action
  void limparCamposAoVoltar() {
    _carregando = true;
    emailEC.clear();
    senhaEC.clear();
    _carregando = false;
  }

  @action
  Future<bool> login(BuildContext context) async {
    try {
      // _carregando = true;
      _status = LoginStateStatus.loading;
      await Future.delayed(Duration.zero);
      await _loginRepository.login(emailEC.text, senhaEC.text, context);
      if (session.Session.token.isNotEmpty) {
        _status = LoginStateStatus.success;
        // _carregando = false;
        return true;
      } else {
        _status = LoginStateStatus.error;
        // _carregando = false;
        _errorMessage = 'Login não autorizado';
        return false;
      }
    } catch (e) {
      _status = LoginStateStatus.error;
      // _carregando = false;
      throw Exception('Erro ao fazer login');
    }
  }

  @action
  void dispose() {}
}
