import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/loader/loader.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import 'package:gestao_frotas_app/core/ui/class_custom_drawer_widget.dart';
import 'package:gestao_frotas_app/core/ui/class_estilos_texto.dart';
import 'package:gestao_frotas_app/core/ui/custom_appbar_padrao.dart';
import 'package:gestao_frotas_app/modulos/veiculo/visualizar_informacoes_veiculo/controllers/visualizar_informacoes_veiculo_controller.dart';
import 'package:mobx/mobx.dart';

class VisualizarInformacoesVeiculoPage extends StatefulWidget {
  const VisualizarInformacoesVeiculoPage({super.key});

  @override
  State<VisualizarInformacoesVeiculoPage> createState() =>
      _VisualizarInformacoesVeiculoPageState();
}

class _VisualizarInformacoesVeiculoPageState
    extends State<VisualizarInformacoesVeiculoPage> with Loader {
  int currentPageIndex = 0;
  final controller = Modular.get<VisualizarInformacoesVeiculoController>();

  final pageViewController = PageController();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case VisualizarInfoStatus.initial:
            break;
          case VisualizarInfoStatus.loading:
            showLoader();
            break;
          case VisualizarInfoStatus.success:
            hideLoader();
            setState(() {});
            break;
          case VisualizarInfoStatus.successResetPassword:
            hideLoader();
            setState(() {});
            break;
          case VisualizarInfoStatus.error:
            hideLoader();
            break;
        }
      });
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          Observer(builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0, top: 21),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Olá, ${session.Session.userName}!',
                      style: ClassEstilosTextos.pretoSize18w400Montserrat,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                session.Session.userIdVeiculo != 0
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 11.0),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    'Este é o veículo que você está utilizando',
                                    style: ClassEstilosTextos
                                        .pretoSize20w600Montserrat,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Flexible(
                                    child: Icon(
                                  Icons.garage_outlined,
                                  size: 35,
                                ))
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 11.0, right: 29),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(border: Border.all()),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/uno.png',
                                      fit: BoxFit.fill,
                                    ),
                                    const Divider(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Placa: ',
                                          style: ClassEstilosTextos
                                              .pretoSize14w600Montserrat,
                                        ),
                                        Text(session.Session.veiculoPlaca)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Modelo: ',
                                          style: ClassEstilosTextos
                                              .pretoSize14w600Montserrat,
                                        ),
                                        Text(session.Session.veiculoModelo)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Ano: ',
                                          style: ClassEstilosTextos
                                              .pretoSize14w600Montserrat,
                                        ),
                                        Text(session
                                            .Session.veiculoAnoFabricacao)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Quilometragem: ',
                                          style: ClassEstilosTextos
                                              .pretoSize14w600Montserrat,
                                        ),
                                        Text(session
                                            .Session.veiculoQuilometragem)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Você não possui veículo vinculado',
                              style:
                                  ClassEstilosTextos.pretoSize20w600Montserrat,
                            ),
                          )
                        ],
                      )
              ],
            );
          }),
        ],
      ),
    );
  }
}
