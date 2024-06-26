import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/historico_abastecimento/controllers/historico_abastecimento_controller.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/historico_abastecimento/historico_abastecimento_page.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/historico_abastecimento/repositories/historico_abastecimento_repository.dart';

import '../../../core/dio/dio_client.dart';

class HistoricoAbastecimentoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(HistoricoAbastecimentoController.new);
    i.addLazySingleton(HistoricoAbastecimentoRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HistoricoAbastecimentoPage(),
    );
  }
}
