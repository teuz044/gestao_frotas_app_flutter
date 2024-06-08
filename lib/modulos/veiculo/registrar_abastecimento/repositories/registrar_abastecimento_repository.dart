
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import '../../../../core/dio/dio_client.dart';
import '../models/registrar_abastecimento_model_set.dart';

class RegistrarAbastecimentoRepository {
   final DioClient dio = DioClient();

  Future<List<RegistrarAbastecimentoModelSet>> getAbastecimentosDoUsuario() async {
    try {
      final response =
          await dio.get('abastecimento/buscar-por-idCondutor/${session.Session.userId}');
      return (response.data as List)
          .map((e) => RegistrarAbastecimentoModelSet.fromMap(e))
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar avarias registradas!', error: e, stackTrace: s);
      return throw Exception(e);
    }
  }

  Future<void> setAbastecimento(RegistrarAbastecimentoModelSet avariasSetModel) async {
    try {
      await dio.post('abastecimento', 
      data: {
        'idVeiculo': avariasSetModel.idVeiculo,
        'idUsuario': avariasSetModel.idUsuario,
        'kmAtual': avariasSetModel.kmAtual,
        'quantidadeLitros': avariasSetModel.quantidadeLitros,
        'valorCombustivel': avariasSetModel.valorCombustivel,
      });
    } on DioException catch (e, s) {
      log('Erro ao salvar abastecimento!', error: e, stackTrace: s);
      throw Exception(e);
    }
  }
}