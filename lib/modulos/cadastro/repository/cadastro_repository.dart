
// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/dio/dio_client.dart';
import '../models/cadastro_model.dart';

class CadastroRepository {
  final DioClient _dio;

  CadastroRepository(this._dio);


  Future<Map<String, dynamic>?> registro(CadastroModel model) async {
    try {
      final response = await _dio.post('usuario',
        data: {
          'nome': model.nome,
          'idCliente': model.idCliente,
          'senha': model.senha,
          'tipoUsuario': model.tipoUsuario,
          'cpf': model.cpf,
          'rg': model.rg,
          'dataNascimento': model.dataNascimento,
          'celular': model.celular,
          'endereço': model.endereO,
          'cep': model.cep,
          'cidade':model.cidade,
          'estado': model.estado,
          'statusConta':model.statusConta,
        },
      );
      if (response.statusCode == 201) {
        print(response.data);
        // Login bem-sucedido, extrair o token e o usuárioModel da resposta.
        // final Map<String, dynamic> data = response.data;
        // final String? token = data['token'];
        // final int? usuarioID = data['cdUser'];
        // final String? usuarioNome = data['nmUser'];

        // if (token != null && usuarioID != null) {
          // return {
            // 'statusCode' : response.statusCode,
            // 'cdUser': usuarioID,
            // 'nmUser': usuarioNome,
            // 'token': token,
          // };
        // }
      } else if (response.statusCode == 400) {
        return null; // Retorne null em caso de erro
      }
    } on DioException catch (e, s) {
      log('Erro ao realizar login!', error: e, stackTrace: s);
    }
    return null;
  }
}
