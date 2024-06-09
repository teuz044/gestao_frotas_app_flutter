
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_abastecimento/models/registrar_abastecimento_model_set.dart';

import '../../../../core/dio/dio_client.dart';
import '/../../core/session/session.dart' as session;

class HistoricoAbastecimentoRepository {
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
}