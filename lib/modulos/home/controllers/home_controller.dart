import 'dart:developer';

import 'package:gestao_frotas_app/modulos/home/models/info_user_model.dart';
import 'package:gestao_frotas_app/modulos/home/repository/home_repository.dart';
import 'package:mobx/mobx.dart';
import '../../../core/session/session.dart' as session;
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

enum HomeControllerStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class HomeControllerBase with Store {
  final HomeRepository _homeRepository;
  HomeControllerBase(this._homeRepository);

  @observable
  bool isExpandedVeiculo = false;

  @observable
  bool isExpandedComunicacao = false;

  @observable
  bool isExpandedViagens = false;

  @readonly
  String _errorMessage = '';

  @readonly
  InfoUserModel _infoUsuario = InfoUserModel();

  @readonly
  var _status = HomeControllerStateStatus.initial;

  Future<void> getInfoUsuario() async {
    try {
      _status = HomeControllerStateStatus.loading;
      await Future.delayed(Duration.zero);
      _infoUsuario = await _homeRepository.getInformacoesUsuario();

      session.Session.userName = _infoUsuario.nome ?? '';
      session.Session.userIdVeiculo = _infoUsuario.idVeiculo ?? 0;
      session.Session.veiculoAnoFabricacao = _infoUsuario.idVeiculo2?.anoFabricacao ?? '';
      session.Session.veiculoAnoModelo = _infoUsuario.idVeiculo2?.anoModelo ?? '';
      session.Session.veiculoConsumoMedioLitro = (_infoUsuario.idVeiculo2?.consumoMedioLitro ?? 0);
      session.Session.veiculoCor = _infoUsuario.idVeiculo2?.cor ?? '';
      session.Session.veiculoMarca = _infoUsuario.idVeiculo2?.marca ?? '';
      session.Session.veiculoPlaca = _infoUsuario.idVeiculo2?.placa ?? '';
      session.Session.veiculoQuilometragem = _infoUsuario.idVeiculo2?.quilometragem ?? '';
      session.Session.veiculoModelo = _infoUsuario.idVeiculo2?.modelo ?? '';
      
      _status = HomeControllerStateStatus.updateScreen;
    } catch (e) {
      log('Erro ao buscar informações do usuário');
      rethrow;
    }
  }

  void extrairIniciaisNome() {
    _status = HomeControllerStateStatus.loading;
    List<String> nomes = session.Session.userName.split(" ");
    String iniciais = "";

    for (int i = 0; i < nomes.length && iniciais.length < 2; i++) {
      iniciais += nomes[i][0].toUpperCase();
    }

    _status = HomeControllerStateStatus.updateScreen;
    session.Session.iniciaisNome = iniciais;
  }
}
