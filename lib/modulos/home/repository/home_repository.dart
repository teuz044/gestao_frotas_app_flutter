import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gestao_frotas_app/modulos/home/models/info_user_model.dart';
import '../../../core/session/session.dart' as session;
import '../../../core/dio/dio_client.dart';

class HomeRepository {
  final DioClient dio = DioClient();

  Future<InfoUserModel> getInformacoesUsuario() async {
    try {
      final response = await dio.get('usuario/${session.Session.userId}');
      return InfoUserModel.fromMap(response.data);
    } on DioException 
    catch (e, s) {
      log('Erro ao buscar informações do usuário!', error: e, stackTrace: s);
      return throw Exception(e);
    }
  }
}
