import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class SolicitarManutencaoVeiculoPage extends StatefulWidget {
  const SolicitarManutencaoVeiculoPage({super.key});

  @override
  State<SolicitarManutencaoVeiculoPage> createState() =>
      _SolicitarManutencaoVeiculoPageState();
}

class _SolicitarManutencaoVeiculoPageState
    extends State<SolicitarManutencaoVeiculoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      body: Observer(
        builder: (context) {
          return Column(
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
                padding: const EdgeInsets.only(left: 11.0, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        'Solicite manutenção para o veículo abaixo',
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
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 11.0, right: 29),
                child: Divider(),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'Veículo em uso',
                style: ClassEstilosTextos.pretoSize18w600Montserrat,
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 5, right: 5),
                    minVerticalPadding: 0,
                    title: Text(
                      'Fiat Uno',
                      style: ClassEstilosTextos.pretoSize16w600Montserrat,
                    ),
                    subtitle: const Text('Placa: TEDS-4023'),
                    leading: Image.asset(
                      'assets/images/uno.png',
                      fit: BoxFit.cover,
                      height: 65,
                      width: 65,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 11.0, right: 29),
                child: Divider(),
              ),
              Center(
                child: Text(
                  'Manutenções Pendentes',
                  style: ClassEstilosTextos.pretoSize16w600Montserrat,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      surfaceTintColor: Colors.white,
                      elevation: 4,
                      child: ListTile(
                        trailing: const Icon(Icons.remove_red_eye_rounded),
                        title: Text('Troca de Óleo',
                            style: ClassEstilosTextos.pretoSize16w600Montserrat,
                            overflow: TextOverflow.ellipsis),
                      
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red.shade400,
          onPressed: () {},
          icon: const Icon(
            Icons.car_repair_outlined,
            color: Colors.white,
          ),
          label: Text(
            'Solicitar Manutenção',
            style: ClassEstilosTextos.branccoSize18w600Montserrat,
          )),
    );
  }
}
