
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/viagens/visualizar_viagem/controllers/visualizar_viagem_controller.dart';
import 'package:gestao_frotas_app/modulos/viagens/visualizar_viagem/repositories/visualizar_viagem_repository.dart';
import 'package:gestao_frotas_app/modulos/viagens/visualizar_viagem/visualizar_viagem_page.dart';

import '../../../core/dio/dio_client.dart';

class VisualizarViagemModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
     i.addLazySingleton(VisualizarViagemController.new);
      i.addLazySingleton(VisualizarViagemRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const VisualizarViagemPage(),
    );
  }
}