// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable, depend_on_referenced_packages, avoid_print
import 'dart:developer';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../core/session/session.dart' as session;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/dio/dio_client.dart';

class LoginRepository {
  final DioClient dio = DioClient();

  Future<void> login(
      String email, String senha, BuildContext context) async {
    try {
      final response = await dio.post(
        'auth/login',
        data: {
          'email': email,
          'senha': senha,
        },
      );
      if (response.statusCode == 201) {
        final Map<String, dynamic> data = response.data;
        final String? token = data['access_token'];
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
        session.Session.token = token.toString();
        // session.Session.userId = decodedToken["id"];
        session.Session.userId = 1;
        session.Session.userEmail = decodedToken["email"];
        // session.Session.userName = decodedToken["nome"];
        print(token);
      } else if (response.statusCode == 400) {
      }
    } on DioException catch (e, s) {
      log('Erro ao realizar login!', error: e, stackTrace: s);
    }
  }
}
