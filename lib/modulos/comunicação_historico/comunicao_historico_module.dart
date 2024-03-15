import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/historico_abastecimento/historico_abastecimento_module.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/historico_viagens/historico_viagens_module.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/start_page_comunicacao.dart';

import '../../core/dio/dio_client.dart';
import 'conversar_gestor/conversar_gestor_module.dart';

class ComunicaoHistoricoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const StartPageComunicacao(), children: [
      ModuleRoute('/conversar_gestor', module: ConversarGestorModule()),
      ModuleRoute('/historico_viagens', module: HistoricoViagensModule()),
      ModuleRoute('/historico_abastecimento', module: HistoricoAbastecimentoModule()),
    ]);
  }
}
