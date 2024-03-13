import 'package:flutter/material.dart';
import 'package:gestao_frotas_app/core/ui/class_custom_drawer_widget.dart';
import 'package:gestao_frotas_app/core/ui/class_estilos_texto.dart';
import 'package:gestao_frotas_app/core/ui/custom_appbar_padrao.dart';

class VisualizarInformacoesVeiculoPage extends StatefulWidget {
  const VisualizarInformacoesVeiculoPage({super.key});

  @override
  State<VisualizarInformacoesVeiculoPage> createState() =>
      _VisualizarInformacoesVeiculoPageState();
}

class _VisualizarInformacoesVeiculoPageState
    extends State<VisualizarInformacoesVeiculoPage> {
  int currentPageIndex = 0;
  final pageViewController = PageController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const ClassCustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 21),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Olá, Matheus!',
                    style: ClassEstilosTextos.pretoSize18w400Montserrat,
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        'Este é o veículo que você está utilizando',
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
                              style:
                                  ClassEstilosTextos.pretoSize14w600Montserrat,
                            ),
                            const Text('412313')
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              'Modelo: ',
                              style:
                                  ClassEstilosTextos.pretoSize14w600Montserrat,
                            ),
                            const Text('Fiat Uno')
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              'Ano: ',
                              style:
                                  ClassEstilosTextos.pretoSize14w600Montserrat,
                            ),
                            const Text('2013')
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              'Kilometragem: ',
                              style:
                                  ClassEstilosTextos.pretoSize14w600Montserrat,
                            ),
                            const Text('142323')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
