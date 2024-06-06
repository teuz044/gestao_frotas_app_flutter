
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gestao_frotas_app/modulos/viagens/visualizar_viagem/models/visualizar_viagem_model.dart';

import '../../../../core/dio/dio_client.dart';
import '/../../core/session/session.dart' as session;

class VisualizarViagemRepository {
   final DioClient dio = DioClient();

  Future<VisualizarViagemModel> getRotasDoUsuario() async {
    try {
      final response = await dio.get('rotas/rota-by-idCondutor/${session.Session.userId}');
      return VisualizarViagemModel.fromMap(response.data);
    } on DioException 
    catch (e, s) {
      log('Erro ao buscar rota do usuário!', error: e, stackTrace: s);
      return throw Exception(e);
    }
  }
}