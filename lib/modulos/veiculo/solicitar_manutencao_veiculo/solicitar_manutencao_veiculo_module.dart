import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/veiculo/solicitar_manutencao_veiculo/solicitar_manutencao_veiculo_page.dart';

import '../../../core/dio/dio_client.dart';

class SolicitarManutencaoVeiculoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const SolicitarManutencaoVeiculoPage(),
    );
  }
}
