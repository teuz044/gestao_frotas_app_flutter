import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_abastecimento/controllers/registrar_abastecimento_controller.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_abastecimento/registrar_abastecimento_page.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_abastecimento/repositories/registrar_abastecimento_repository.dart';

import '../../../core/dio/dio_client.dart';

class SolicitarManutencaoVeiculoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(RegistrarAbastecimentoController.new);
    i.addLazySingleton(RegistrarAbastecimentoRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const SolicitarManutencaoVeiculoPage(),
    );
  }
}
