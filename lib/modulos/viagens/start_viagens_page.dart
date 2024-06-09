import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/ui/class_estilos_texto.dart';
import '../../core/session/session.dart' as session;

class StartViagensPage extends StatefulWidget {
  const StartViagensPage({super.key});

  @override
  State<StartViagensPage> createState() => _StartViagensPageState();
}

class _StartViagensPageState extends State<StartViagensPage> {
  void navegarParaVisualizarViagem() {
    Modular.to.navigate('/home/viagens/visualizar_viagem');
    setState(() {
      session.Session.selectedIndexBottomNavigatorBarViagens = 0;
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
              VerticalDivider(),
              IconButton(
                tooltip: 'Visualizar viagem',
                icon: const ImageIcon(
                  AssetImage('assets/icons/viagemAtiva.png'),
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
              Text(
                'Viagem atual',
                style: ClassEstilosTextos.branccoSize16w600Montserrat,
              ),
              VerticalDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
