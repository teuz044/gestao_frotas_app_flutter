import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/ui/custom_text_field.dart';
import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/controllers/iniciar_viagem_controller.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class IniciarViagemPage extends StatefulWidget {
  const IniciarViagemPage({super.key});

  @override
  State<IniciarViagemPage> createState() => _IniciarViagemPageState();
}

class _IniciarViagemPageState extends State<IniciarViagemPage> {
  final controller = Modular.get<IniciarViagemController>();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction((_) => controller.status, (status) async {
      switch (status) {
        case IniciarViagemStateStatus.initial:
          break;
        case IniciarViagemStateStatus.loading:
        const Center(child: CircularProgressIndicator());
          break;
        case IniciarViagemStateStatus.success:
        setState(() {
        });
          break;
        case IniciarViagemStateStatus.error:
          break;
      }
    });
       controller.getVeiculosDisponiveis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      backgroundColor: Colors.white,
      body: Observer(builder: (context) {
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
              padding: const EdgeInsets.only(left: 11.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Iniciar nova viagem',
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomTextField(
                      controller: TextEditingController(), titulo: 'Campo 1'),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      controller: TextEditingController(), titulo: 'Campo 1'),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      controller: TextEditingController(), titulo: 'Campo 1'),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    
                      controller: TextEditingController(), titulo: 'Campo 1'),
                  const SizedBox(
                    height: 12,
                  ),
                  controller.dpdVeiculos.getWidget(this, 'Veículos disponíveis'),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade300),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Iniciar',
                      style: ClassEstilosTextos.branccoSize18w600Montserrat,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
