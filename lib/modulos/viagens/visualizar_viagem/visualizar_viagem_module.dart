
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/viagens/visualizar_viagem/visualizar_viagem_page.dart';

import '../../../core/dio/dio_client.dart';

class VisualizarViagemModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const VisualizarViagemPage(),
    );
  }
}