import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/models/avarias_get_model.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/models/avarias_set_model.dart';
import '../../../../core/dio/dio_client.dart';

class RegistrarAvariasVeiculoRepository {
  final DioClient dio = DioClient();

  Future<List<AvariasGetModel>> getAvariasDoUsuario() async {
    try {
      final response =
          await dio.get('avarias-veiculo/${session.Session.userId}');
      return (response.data as List)
          .map((e) => AvariasGetModel.fromMap(e))
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar avarias registradas!', error: e, stackTrace: s);
      return throw Exception(e);
    }
  }

  Future<void> setAvariasDoUsuario(AvariasSetModel avariasSetModel) async {
    try {
      await dio.post('avarias-veiculo', 
      data: {
        'idVeiculo': avariasSetModel.idVeiculo,
        'idUsuario': avariasSetModel.idUsuario,
        'mensagemAvaria': avariasSetModel.mensagemAvaria,
        'tituloAvaria': avariasSetModel.tituloAvaria,
        'statusAvaria': avariasSetModel.statusAvaria,
      });
    } on DioException catch (e, s) {
      log('Erro ao salvar avarias registradas!', error: e, stackTrace: s);
      throw Exception(e);
    }
  }
}
