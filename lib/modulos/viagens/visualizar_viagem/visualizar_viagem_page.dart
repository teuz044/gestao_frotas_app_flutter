import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class VisualizarViagemPage extends StatefulWidget {

  const VisualizarViagemPage({ super.key });

  @override
  State<VisualizarViagemPage> createState() => _VisualizarViagemPageState();
}

class _VisualizarViagemPageState extends State<VisualizarViagemPage> {

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
                      'Você está atualmente nesta viagem:',
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
             padding: const EdgeInsets.only(left:16.0, right: 16),
             child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Veículo: Fiat uno', style: ClassEstilosTextos.pretoSize16w600Montserrat,),
                        const SizedBox(height: 8,),
                        Text('Horário de saída: 13:45', style: ClassEstilosTextos.pretoSize16w600Montserrat,),
                        const SizedBox(height: 8,),
                        Text('Placa: EDAF-5104', style: ClassEstilosTextos.pretoSize16w600Montserrat,),
                      ],
                    ),
                  ],
                ),
              ),
             ),
           ),
          ],
        );
      }),
    );
  }
}