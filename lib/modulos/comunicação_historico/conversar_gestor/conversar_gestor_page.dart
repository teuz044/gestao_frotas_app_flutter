import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class ConversarGestorPage extends StatefulWidget {
  const ConversarGestorPage({super.key});

  @override
  State<ConversarGestorPage> createState() => _ConversarGestorPageState();
}

class _ConversarGestorPageState extends State<ConversarGestorPage> {
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
                      'Selecione um gestor para conversar',
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
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8,),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black12
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text('Matheus Gabriel', style: ClassEstilosTextos.pretoSize16w600Montserrat,),
                      trailing: const Icon(Icons.chat_outlined),
                      onTap: () {
                        
                      },
                    ),
                  ),
                );
              },
            )
          ],
        );
      }),
    );
  }
}
