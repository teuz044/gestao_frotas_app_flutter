import 'package:flutter/material.dart';
import 'package:gestao_frotas_app/core/ui/class_custom_drawer_widget.dart';
import 'package:gestao_frotas_app/core/ui/custom_appbar_padrao.dart';

class RegistrarAvariaPage extends StatefulWidget {

  const RegistrarAvariaPage({ super.key });

  @override
  State<RegistrarAvariaPage> createState() => _RegistrarAvariaPageState();
}

class _RegistrarAvariaPageState extends State<RegistrarAvariaPage> {
  @override
  void dispose() {
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
        drawer: ClassCustomDrawerWidget(),
           appBar: CustomAppbarPadrao(),
           body: Container(),
       );
  }
}