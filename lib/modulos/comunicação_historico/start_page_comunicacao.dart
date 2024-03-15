import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/session/session.dart' as session;

class StartPageComunicacao extends StatefulWidget {
  const StartPageComunicacao({super.key});

  @override
  State<StartPageComunicacao> createState() => _StartPageComunicacaoState();
}

class _StartPageComunicacaoState extends State<StartPageComunicacao> {
  void verificarIndice(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('/home/comunicacao/conversar_gestor/');
        break;
      case 1:
        Modular.to.navigate('/home/comunicacao/historico_viagens/');
        break;
      case 2:
        Modular.to.navigate('/home/comunicacao/historico_abastecimento/');
        break;
      default:
    }
    setState(() {
      session.Session.selectedIndexBottomNavigatorBarComunicacao = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Observer(
        builder: (context) {
          return const RouterOutlet();
        }
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: verificarIndice,
        indicatorColor: Colors.red.shade50,
        surfaceTintColor: Colors.red.shade400,
        backgroundColor: Colors.red.shade400,
        selectedIndex: session.Session.selectedIndexBottomNavigatorBarComunicacao,
        elevation: 4,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/cvGestore.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/cvGestore.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Chat gestor',
          ),
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/histViagens.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/histViagens.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Hist. de viagens',
          ),
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/histAbastecime.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/histAbastecime.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Hist. Abastecimento',
          ),
        ],
      ),
    );
  }
}
