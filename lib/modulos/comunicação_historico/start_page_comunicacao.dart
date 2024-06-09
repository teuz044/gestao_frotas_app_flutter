import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/session/session.dart' as session;
import '../../core/ui/class_estilos_texto.dart';

class StartPageComunicacao extends StatefulWidget {
  const StartPageComunicacao({super.key});

  @override
  State<StartPageComunicacao> createState() => _StartPageComunicacaoState();
}

class _StartPageComunicacaoState extends State<StartPageComunicacao> {
  void verificarIndice(int index) {
    switch (index) {
      case 0:
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
      body: const RouterOutlet(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red.shade400,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const VerticalDivider(),
              IconButton(
                tooltip: 'Histórico de Abastecimentos',
                icon: const ImageIcon(
                  AssetImage('assets/icons/histAbastecime.png'),
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
              Text(
                'Hist. Abastecimento',
                style: ClassEstilosTextos.branccoSize16w600Montserrat,
              ),
              const VerticalDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
