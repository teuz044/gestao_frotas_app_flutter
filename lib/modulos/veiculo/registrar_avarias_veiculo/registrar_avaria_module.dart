
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/controllers/registrar_avarias_veiculo_controller.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/repositories/registrar_avarias_veiculo_repository.dart';

import '../../../core/dio/dio_client.dart';
import 'registrar_avaria_page.dart';

class RegistrarAvariaModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(RegistrarAvariasVeiculoController.new);
    i.addLazySingleton(RegistrarAvariasVeiculoRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const RegistrarAvariaPage(),
    );
  }
}