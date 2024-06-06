
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/viagens/start_viagens_page.dart';
import '../../core/dio/dio_client.dart';
import 'paradas_eventos/paradas_eventos_module.dart';
import 'visualizar_viagem/visualizar_viagem_module.dart';

class ViagensModule extends Module{
   @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    // r.module('/', module: VisualizarInformacoesVeiculoModule());
    r.child('/',
        child: (context) => const StartViagensPage(), children: [
          ModuleRoute('/visualizar_viagem', module: VisualizarViagemModule()),
          ModuleRoute('/paradas_eventos', module: ParadasEventosModule()),
        ]);
  }
}