import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/conversar_gestor/conversar_gestor_page.dart';
import '../../../core/dio/dio_client.dart';

class ConversarGestorModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(DioClient.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ConversarGestorPage(),
    );
  }
}
