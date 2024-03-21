
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gestao_frotas_app/core/dio/dio_client.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/models/veiculo_model.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/repositories/iniciar_viagem_repository.dart';

class IniciarViagemRepositoryImpl extends IniciarViagemRepository {
  DioClient dio = DioClient();

  @override
  Future<List<VeiculoModel>> getVeiculo() async {
    try {
      final result = await dio.get('veiculos');
      return (result.data as List).map((e) => VeiculoModel.fromMap(e)).toList();
    } on DioException catch (e) {
      log('Não foi possível recuperar os veiculos disponíveis $e');
      return [];
    }
  }
}
