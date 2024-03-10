import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/ui/class_custom_drawer_widget.dart';
import '../../core/ui/custom_appbar_padrao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const ClassCustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Modular.to.navigate('veiculo');
              },
              child: const Text('Veiculos'))
        ],
      ),
    );
  }
}
