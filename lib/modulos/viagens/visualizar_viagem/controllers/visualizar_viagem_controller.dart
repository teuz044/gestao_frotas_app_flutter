import 'dart:developer';
import 'package:gestao_frotas_app/modulos/viagens/visualizar_viagem/repositories/visualizar_viagem_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../models/visualizar_viagem_model.dart';
part 'visualizar_viagem_controller.g.dart';

class VisualizarViagemController = VisualizarViagemControllerBase
    with _$VisualizarViagemController;

enum VisualizarViagemStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class VisualizarViagemControllerBase with Store {
  final VisualizarViagemRepository _visualizarViagemRepository;
  VisualizarViagemControllerBase(this._visualizarViagemRepository);

  @readonly
  String _errorMessage = '';

  @readonly
  VisualizarViagemModel _viagemUsuario = VisualizarViagemModel();

  @readonly
  var _status = VisualizarViagemStateStatus.initial;

  Future<void> getRotasDoUsuario() async {
    try {
      _status = VisualizarViagemStateStatus.loading;
      await Future.delayed(Duration.zero);
      _viagemUsuario = await _visualizarViagemRepository.getRotasDoUsuario();
      _status = VisualizarViagemStateStatus.updateScreen;
    } catch (e) {
      log('Erro ao buscar rotas do usuário');
      _status = VisualizarViagemStateStatus.error;
      rethrow;
    }
  }

  Future<void> launch(String url) async {
      await launchUrlString(url);
  }
}
