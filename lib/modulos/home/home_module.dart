
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/comunicao_historico_module.dart';
import 'package:gestao_frotas_app/modulos/home/controllers/home_controller.dart';
import 'package:gestao_frotas_app/modulos/veiculo/veiculo_module.dart';
import 'package:gestao_frotas_app/modulos/viagens/viagens_module.dart';

import 'home_page.dart';

class HomeModule extends Module {
@override
  void binds(i) {
    i.addLazySingleton(HomeController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/veiculo', module: VeiculoModule());
     r.module('/comunicacao', module: ComunicaoHistoricoModule());
     r.module('/viagens', module: ViagensModule());
  }

}