// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/home/home_module.dart';
import '../../core/dio/dio_client.dart';
import '../cadastro/cadastro_module.dart';
import 'controllers/login_controller.dart';
import 'login_page.dart';
import 'repository/login_repository.dart';
import 'splash_page.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LoginRepository.new);
    i.addLazySingleton(LoginController.new);
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/login', child: (context) => const LoginPage());
    r.module('/cadastro', module: CadastroModule());
    r.module('/home', module: HomeModule());
  }
}
