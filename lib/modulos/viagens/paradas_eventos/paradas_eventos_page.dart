import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';
import '../../../core/ui/custom_text_field.dart';

class ParadasEventosPage extends StatefulWidget {

  const ParadasEventosPage({ super.key });

  @override
  State<ParadasEventosPage> createState() => _ParadasEventosPageState();
}

class _ParadasEventosPageState extends State<ParadasEventosPage> {

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
                      'Registre uma parada ou imprevisto',
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
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade300),
                        onPressed: () {},
                        icon: const Icon(Icons.check_circle_outline_outlined, color: Colors.white,),
                        label: Text('Registrar', style: ClassEstilosTextos.branccoSize18w600Montserrat,))
                  ],
                )),
          ],
        );
      }),
    );
  }
}