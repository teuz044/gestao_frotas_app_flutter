import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/ui/class_estilos_texto.dart';
import 'package:gestao_frotas_app/modulos/home/controllers/home_controller.dart';
import 'package:mobx/mobx.dart';
import '../../core/ui/class_custom_drawer_widget.dart';
import '../../core/ui/custom_appbar_padrao.dart';
import 'widgets/expansible_card_mobile.dart';
import '../../core/session/session.dart' as session;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case HomeControllerStateStatus.initial:
            break;
          case HomeControllerStateStatus.loading:
            // showLoader();
            break;
          case HomeControllerStateStatus.loaded:
            // hideLoader();
            break;
          case HomeControllerStateStatus.error:
            // hideLoader();
            // showError(
            //   controller.errorMessage ?? 'Erro ao buscar dados dos Alunos!',
            // );
            break;
          case HomeControllerStateStatus.updateScreen:
            // hideLoader();
            setState(() {});
            break;
        }
      });
      await controller.getInfoUsuario();
      controller.extrairIniciaisNome();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusReactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            Image.asset('assets/images/fundohome.jpg', fit: BoxFit.cover, height: double.infinity, width: double.infinity,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ExpansibleCardMobile(
                          iconHeader: const Icon(
                            Icons.travel_explore_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          title: 'Viagens',
                          body: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4)),
                                    color: Colors.red.shade300,
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.flag_circle_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Visualizar rota',
                                          style: ClassEstilosTextos
                                              .branccoSize20w600Montserrat,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      session.Session.selectedIndexBottomNavigatorBarViagens = 0;
                                      Modular.to.pushNamed('/home/viagens/visualizar_viagem/');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          expandedCard: controller.isExpandedViagens,
                          onTap: () {
                            controller.isExpandedViagens =
                                !controller.isExpandedViagens;
                          },
                          colorHeader: Colors.red.shade400,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ExpansibleCardMobile(
                          iconHeader: const Icon(
                            Icons.car_crash_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          title: 'Veículos',
                          body: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4)),
                                    color: Colors.brown.shade400,
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.document_scanner_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Informação do veículo',
                                          style: ClassEstilosTextos
                                              .branccoSize18w600Montserrat,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      session.Session
                                          .selectedIndexBottomNavigatorBarVeiculos = 0;
                                      Modular.to.pushNamed(
                                          '/home/veiculo/visualizar_info/');
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4)),
                                    color: Colors.brown.shade300,
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.car_repair_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Registrar avarias',
                                          style: ClassEstilosTextos
                                              .branccoSize20w600Montserrat,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      session.Session
                                          .selectedIndexBottomNavigatorBarVeiculos = 1;
                                      Modular.to.pushNamed('/home/veiculo/avarias/');
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4)),
                                    color: Colors.brown.shade200,
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.local_gas_station_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Registrar Abastecimento',
                                          style: ClassEstilosTextos
                                              .branccoSize20w600Montserrat,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      session.Session
                                          .selectedIndexBottomNavigatorBarVeiculos = 2;
                                      Modular.to.pushNamed(
                                          '/home/veiculo/solicitar_manutencao/');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          expandedCard: controller.isExpandedVeiculo,
                          onTap: () {
                            controller.isExpandedVeiculo =
                                !controller.isExpandedVeiculo;
                          },
                          colorHeader: Colors.brown,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ExpansibleCardMobile(
                          iconHeader: const Icon(
                            Icons.mark_unread_chat_alt_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          title: 'Históricos',
                          body: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4)),
                                    color: Colors.deepOrange.shade100,
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.history_edu_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Histórico de abastecimento',
                                          style: ClassEstilosTextos
                                              .branccoSize20w600Montserrat,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      session.Session.selectedIndexBottomNavigatorBarComunicacao = 2;
                                      Modular.to.pushNamed('/home/comunicacao/historico_abastecimento/');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          expandedCard: controller.isExpandedComunicacao,
                          onTap: () {
                            controller.isExpandedComunicacao =
                                !controller.isExpandedComunicacao;
                          },
                          colorHeader: Colors.deepOrange.shade400,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Gestão de Frotas APP v 1.0',
                      style: TextStyle(color: Colors.black.withOpacity(0.3)),
                    )),
              ],
            ),
          ],
        );
      }),
    );
  }
}
