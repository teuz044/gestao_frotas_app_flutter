import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/loader/loader.dart';
import 'package:gestao_frotas_app/modulos/viagens/visualizar_viagem/controllers/visualizar_viagem_controller.dart';
import 'package:mobx/mobx.dart';
import '../../../core/session/session.dart' as session;
import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class VisualizarViagemPage extends StatefulWidget {
  const VisualizarViagemPage({super.key});

  @override
  State<VisualizarViagemPage> createState() => _VisualizarViagemPageState();
}

class _VisualizarViagemPageState extends State<VisualizarViagemPage>
    with Loader {
  final controller = Modular.get<VisualizarViagemController>();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case VisualizarViagemStateStatus.initial:
            break;
          case VisualizarViagemStateStatus.loading:
            showLoader();
            break;
          case VisualizarViagemStateStatus.updateScreen:
            hideLoader();
            setState(() {});
            break;
          case VisualizarViagemStateStatus.error:
            hideLoader();
            break;
          case VisualizarViagemStateStatus.loaded:
            hideLoader();
            break;
        }
      });
      await controller.getRotasDoUsuario();
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
      drawer: const CustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      backgroundColor: Colors.white,
      body: Observer(builder: (context) {
        return controller.viagemUsuario.destino == '' || controller.viagemUsuario.destino == null ? Center(child: Text('Você não possui rotas atribuidas', style: ClassEstilosTextos.pretoSize20w600Montserrat,),) 
        :
         Column(
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
            Padding(
              padding: const EdgeInsets.only(left: 11.0, right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Rota atual:',
                      style: ClassEstilosTextos.pretoSize20w600Montserrat,
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
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Endereço: ',
                                  style: ClassEstilosTextos
                                      .pretoSize16w600Montserrat,
                                ),
                                TextSpan(
                                  text:
                                      '${controller.viagemUsuario.destino}, ${controller.viagemUsuario.numero}',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Referência: ',
                                  style: ClassEstilosTextos
                                      .pretoSize16w600Montserrat,
                                ),
                                TextSpan(
                                  text:
                                      '${controller.viagemUsuario.referencia}',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Cidade: ',
                                  style: ClassEstilosTextos
                                      .pretoSize16w600Montserrat,
                                ),
                                TextSpan(
                                  text: '${controller.viagemUsuario.cidade}',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Veículo: ',
                                  style: ClassEstilosTextos
                                      .pretoSize16w600Montserrat,
                                ),
                                TextSpan(
                                  text:
                                      '${session.Session.veiculoMarca} - ${session.Session.veiculoModelo}',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Placa: ',
                                  style: ClassEstilosTextos
                                      .pretoSize16w600Montserrat,
                                ),
                                TextSpan(
                                  text: session.Session.veiculoPlaca,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Distância da empresa: ',
                                  style: ClassEstilosTextos
                                      .pretoSize16w600Montserrat,
                                ),
                                 TextSpan(
                                  text: controller.viagemUsuario.distancia,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Consumo saindo da empresa: ',
                                  style: ClassEstilosTextos
                                      .pretoSize16w600Montserrat,
                                ),
                                 TextSpan(
                                  text: controller.viagemUsuario.consumo,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.red.shade400,
                    fixedSize: const Size.fromWidth(double.maxFinite)
                  ),
                  onPressed: () async {
                    final String url = 'https://www.google.com/maps/search/?api=1&query=${controller.viagemUsuario.destino}, ${controller.viagemUsuario.numero}';
                    await controller.launch(url);
                  },
                  icon: const Icon(Icons.map_outlined, color: Colors.white,),
                  label: Text('Abrir no Maps', style: ClassEstilosTextos.branccoSize20w600Montserrat,),),
            )
          ],
                 );
      }),
    );
  }
}
