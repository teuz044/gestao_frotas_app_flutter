
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/veiculo/veiculo_module.dart';

import 'home_page.dart';

class HomeModule extends Module {
@override
  void binds(i) {

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/veiculo', module: VeiculoModule());
  }

}