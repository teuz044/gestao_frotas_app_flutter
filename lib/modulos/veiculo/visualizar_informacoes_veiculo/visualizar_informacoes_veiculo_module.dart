import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/veiculo/visualizar_informacoes_veiculo/controllers/visualizar_informacoes_veiculo_controller.dart';
import 'package:gestao_frotas_app/modulos/veiculo/visualizar_informacoes_veiculo/repositories/visualizar_informacoes_veiculo_repository.dart';
import 'package:gestao_frotas_app/modulos/veiculo/visualizar_informacoes_veiculo/visualizar_informacoes_veiculo_page.dart';
import '../../../core/dio/dio_client.dart';

class VisualizarInformacoesVeiculoModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
    i.addLazySingleton(VisualizarInformacoesVeiculoController.new);
    i.addLazySingleton(VisualizarInformacoesVeiculoRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const VisualizarInformacoesVeiculoPage(),
    );
  }
}
