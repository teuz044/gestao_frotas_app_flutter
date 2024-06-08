import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/registrar_avaria_module.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_abastecimento/registrar_abastecimento_module.dart';
import 'package:gestao_frotas_app/modulos/veiculo/start_page.dart';
import 'package:gestao_frotas_app/modulos/veiculo/visualizar_informacoes_veiculo/visualizar_informacoes_veiculo_module.dart';

import '../../core/dio/dio_client.dart';

class VeiculoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    // r.module('/', module: VisualizarInformacoesVeiculoModule());
    r.child('/',
        child: (context) => const StartPage(), children: [
          ModuleRoute('/visualizar_info', module: VisualizarInformacoesVeiculoModule()),
          ModuleRoute('/avarias', module: RegistrarAvariaModule()),
          ModuleRoute('/solicitar_manutencao', module: SolicitarManutencaoVeiculoModule()),
        ]);
  }
}
