import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/dio/dio_client.dart';
import 'historico_viagens_page.dart';

class HistoricoViagensModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HistoricoViagensPage(),
    );
  }
}
