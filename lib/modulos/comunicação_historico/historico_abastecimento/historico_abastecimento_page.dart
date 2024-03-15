import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class HistoricoAbastecimentoPage extends StatefulWidget {

  const HistoricoAbastecimentoPage({ super.key });

  @override
  State<HistoricoAbastecimentoPage> createState() => _HistoricoAbastecimentoPageState();
}

class _HistoricoAbastecimentoPageState extends State<HistoricoAbastecimentoPage> {

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
                      'Meus abastecimentos',
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
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.local_gas_station_outlined),
                      title: Text('R\$ 320,43', style: ClassEstilosTextos.pretoSize16w600Montserrat,),
                      subtitle: const Text('15/04/2023'),
                      trailing: const Icon(Icons.more_horiz),
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