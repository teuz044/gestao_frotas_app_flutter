import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/session/session.dart' as session;

class StartViagensPage extends StatefulWidget {

  const StartViagensPage({ super.key });

  @override
  State<StartViagensPage> createState() => _StartViagensPageState();
}

class _StartViagensPageState extends State<StartViagensPage> {

  void verificarIndice(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('/home/viagens/visualizar_viagem');
        break;
      case 1:
        Modular.to.navigate('/home/viagens/iniciar_viagem');
        break;
      case 2:
        Modular.to.navigate('/home/viagens/paradas_eventos');
        break;
      default:
    }
    setState(() {
      session.Session.selectedIndexBottomNavigatorBarViagens = index; 
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
      body: const RouterOutlet(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: verificarIndice,
        indicatorColor: Colors.red.shade50,
        surfaceTintColor: Colors.red.shade400,
        backgroundColor: Colors.red.shade400,
        selectedIndex: session.Session.selectedIndexBottomNavigatorBarViagens,
        elevation: 4,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/viagemAtiva.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/viagemAtiva.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Visualizar viagem',
          ),
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/iniciarViagem.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/iniciarViagem.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Iniciar viagem',
          ),
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/paradasEventos.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/paradasEventos.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Paradas e eventos',
          ),
        ],
      ),
    );
  }
}