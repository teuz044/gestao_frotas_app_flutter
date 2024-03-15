import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/ui/class_estilos_texto.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key, });

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Drawer(
          backgroundColor: Colors.white,
          elevation: 4,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.red.shade300),
                accountName: Text(
                  'Matheus Gabriel',
                  style: ClassEstilosTextos.branccoSize18w600Montserrat,
                  overflow: TextOverflow.ellipsis,
                ),
                accountEmail: const Text('matheus.gabriel3123@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Text(
                    'MT', // criar uma função para extrair apenas a inicial do nome da pessoa(fazer com split)
                    style: ClassEstilosTextos.branccoSize24w600Montserrat,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  'Inicio',
                 style: ClassEstilosTextos.pretoSize16w600Montserrat,
                ),
                onTap: () {
                  Modular.to.pushNamedAndRemoveUntil('/home', (p0) => false);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  'Configurações',
                  style: ClassEstilosTextos.pretoSize16w600Montserrat,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  'Sair',
                  style: ClassEstilosTextos.pretoSize16w600Montserrat,
                ),
                onTap: () {
                  Modular.to.popAndPushNamed('/');
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
  