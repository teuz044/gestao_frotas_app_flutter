import 'package:flutter/material.dart';

import 'class_estilos_texto.dart';

class ClassCustomDrawerWidget extends StatelessWidget {
  const ClassCustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [Text('Olá, Matheus')],
            ),
            Column(
              children: [
                const Divider(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sair',
                        style: ClassEstilosTextos.pretoSize18w600Montserrat,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
