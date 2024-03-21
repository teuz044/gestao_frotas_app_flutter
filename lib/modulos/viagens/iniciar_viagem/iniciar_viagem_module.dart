
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/controllers/iniciar_viagem_controller.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/iniciar_viagem_page.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/repositories/iniciar_viagem_repository_impl.dart';

import '../../../core/dio/dio_client.dart';

class IniciarViagemModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(IniciarViagemRepositoryImpl.new);
    i.addLazySingleton(IniciarViagemController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const IniciarViagemPage(),
    );
  }
}