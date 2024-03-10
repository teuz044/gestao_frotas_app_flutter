// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';

import '../../core/dio/dio_client.dart';
import 'cadastro_page.dart';
import 'controllers/cadastro_controller.dart';
import 'repository/cadastro_repository.dart';

class CadastroModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(CadastroController.new);
    i.addLazySingleton(CadastroRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const CadastroPage());
  }
}
