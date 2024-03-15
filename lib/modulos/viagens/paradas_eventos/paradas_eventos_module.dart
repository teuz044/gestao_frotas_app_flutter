
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/viagens/paradas_eventos/paradas_eventos_page.dart';

import '../../../core/dio/dio_client.dart';

class ParadasEventosModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ParadasEventosPage(),
    );
  }
}