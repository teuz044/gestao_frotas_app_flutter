import 'dart:developer';

import 'package:gestao_frotas_app/core/ui/custom_drop_down_button.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/models/veiculo_model.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/repositories/iniciar_viagem_repository_impl.dart';
import 'package:mobx/mobx.dart';
part 'iniciar_viagem_controller.g.dart';

class IniciarViagemController = IniciarViagemControllerBase with _$IniciarViagemController;

enum IniciarViagemStateStatus {
  initial,
  loading,
  success,
  error;
}

abstract class IniciarViagemControllerBase with Store {
  final IniciarViagemRepositoryImpl _iniciarViagemRepositoryImpl;
  IniciarViagemControllerBase(this._iniciarViagemRepositoryImpl);

  @readonly
  var _status = IniciarViagemStateStatus.initial;

  @readonly
  String _errorMessage = '';

  @readonly
  var _lstVeiculos = <VeiculoModel>[];

  @readonly
  var _dpdVeiculos = ClassDropdownButton();

  @action
  Future<void> getVeiculosDisponiveis() async {
    try {
      _status = IniciarViagemStateStatus.loading;
      await Future.delayed(Duration.zero);
      _lstVeiculos = await _iniciarViagemRepositoryImpl.getVeiculo();
      if (_lstVeiculos.isNotEmpty) {
        _dpdVeiculos.loadFromObjectList(_lstVeiculos, 'id', '/modelo/ - /placa/', 'Não há veículo disponível');
      }
      _status = IniciarViagemStateStatus.success;
    } catch (e) {
      _errorMessage = 'Erro ao buscar veículos';
      log('Erro ao buscar veículos $e',);
      _status = IniciarViagemStateStatus.error;
    }
  }



}