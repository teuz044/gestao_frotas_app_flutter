import 'package:flutter/material.dart';
import 'package:gestao_frotas_app/core/ui/class_custom_drawer_widget.dart';
import 'package:gestao_frotas_app/core/ui/custom_appbar_padrao.dart';

class SolicitarManutencaoVeiculoPage extends StatefulWidget {
  const SolicitarManutencaoVeiculoPage({super.key});

  @override
  State<SolicitarManutencaoVeiculoPage> createState() =>
      _SolicitarManutencaoVeiculoPageState();
}

class _SolicitarManutencaoVeiculoPageState
    extends State<SolicitarManutencaoVeiculoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: ClassCustomDrawerWidget(),
      appBar: CustomAppbarPadrao(),
      body: Column(
        children: [],
      ),
    );
  }
}
