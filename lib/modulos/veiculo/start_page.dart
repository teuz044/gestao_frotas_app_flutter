import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/session/session.dart' as session;

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final pageViewController = PageController();


  void verificarIndice(int index) {
    switch (index) {
      case 0:
        Modular.to.pushNamed('/home/veiculo/visualizar_info');
        break;
      case 1:
        Modular.to.pushNamed('/home/veiculo/avarias');
        break;
      case 2:
        Modular.to.pushNamed('/home/veiculo/solicitar_manutencao');
        break;
      default:
    }
    setState(() {
      session.Session.selectedIndexBottomNavigatorBarVeiculos = index; 
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
        selectedIndex: session.Session.selectedIndexBottomNavigatorBarVeiculos,
        elevation: 4,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/infoVeiculoIcon.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/infoVeiculoIcon.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Info do veículo',
          ),
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/avariasIcon.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/avariasIcon.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Registrar avarias',
          ),
          NavigationDestination(
            selectedIcon: ImageIcon(
              AssetImage('assets/icons/solicitarManutencoesIcon.png'),
              color: Colors.black,
              size: 30,
            ),
            icon: ImageIcon(
              AssetImage('assets/icons/solicitarManutencoesIcon.png'),
              color: Color(0xffEEFF84),
              size: 35,
            ),
            label: 'Regis. Abastecimento',
          ),
        ],
      ),
    );
  }
}
