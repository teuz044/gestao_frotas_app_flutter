import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_abastecimento/models/registrar_abastecimento_model_set.dart';
import 'package:mobx/mobx.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import '../repositories/registrar_abastecimento_repository.dart';
part 'registrar_abastecimento_controller.g.dart';

class RegistrarAbastecimentoController = RegistrarAbastecimentoControllerBase with _$RegistrarAbastecimentoController;


enum RegistrarAbastecimentoVeiculoStatus {
  initial,
  loading,
  success,
  successAbastecimento,
  error;
}

abstract class RegistrarAbastecimentoControllerBase with Store {


 final RegistrarAbastecimentoRepository _registrarAvariasVeiculoRepository;
 RegistrarAbastecimentoControllerBase(this._registrarAvariasVeiculoRepository);
 @readonly
  var _status = RegistrarAbastecimentoVeiculoStatus.initial;

  @readonly
  String _errorMessage = '';

  @readonly
  var _lstAbastecimentos = <RegistrarAbastecimentoModelSet>[];

  final kmAtualEC = TextEditingController();
  final quantidadeLitrosEC = TextEditingController();
  final precoCombustivelEC = TextEditingController();
  final formKeyAbastecimento = GlobalKey<FormState>();
  final valorTotalEC = TextEditingController();


  @action
  Future<void> getAbastecimentosDoUsuario() async{
    try {
      _status = RegistrarAbastecimentoVeiculoStatus.loading;
      await Future.delayed(Duration.zero);
     _lstAbastecimentos = await _registrarAvariasVeiculoRepository.getAbastecimentosDoUsuario();
     _status = RegistrarAbastecimentoVeiculoStatus.success;
    } catch (e) {
      log('Erro ao buscar informações de abastecimento');
      _status = RegistrarAbastecimentoVeiculoStatus.error;
      rethrow;
    }
  }

  @action
  Future<void> setAbastecimento() async{
    try {
      _status = RegistrarAbastecimentoVeiculoStatus.loading;
      await Future.delayed(Duration.zero);
      await _registrarAvariasVeiculoRepository.setAbastecimento(
        RegistrarAbastecimentoModelSet(
          idUsuario:session.Session.userId,
          idVeiculo: session.Session.userIdVeiculo,
          kmAtual: kmAtualEC.text,
          quantidadeLitros: quantidadeLitrosEC.text,
          valorCombustivel: precoCombustivelEC.text,
        ),
      );
     _status = RegistrarAbastecimentoVeiculoStatus.successAbastecimento;
    } catch (e) {
      log('Erro ao salvar abastecimento');
      _status = RegistrarAbastecimentoVeiculoStatus.error;
      rethrow;
    }
  }

  Future<void> calcularValorTotal() async {
    _status = RegistrarAbastecimentoVeiculoStatus.loading;
    await Future.delayed(Duration.zero);
    final precoCombustivel = double.tryParse(precoCombustivelEC.text.replaceAll(',', '.').replaceAll('R\$', '').trim()) ?? 0.0;
    final quantidadeLitros = double.tryParse(quantidadeLitrosEC.text.replaceAll(',', '.').replaceAll('R\$', '').trim()) ?? 0.0;
    final total = precoCombustivel * quantidadeLitros;
    valorTotalEC.text = total.toStringAsFixed(2);
     _status = RegistrarAbastecimentoVeiculoStatus.success;
  }

  void limparCampos() {
    precoCombustivelEC.clear();
    quantidadeLitrosEC.clear();
    valorTotalEC.clear();
    kmAtualEC.clear();
  }
}