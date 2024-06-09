import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/ui/class_custom_drawer_widget.dart';
import 'package:gestao_frotas_app/core/ui/custom_appbar_padrao.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import 'package:gestao_frotas_app/core/ui/custom_text_field.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_avarias_veiculo/controllers/registrar_avarias_veiculo_controller.dart';
import 'package:mobx/mobx.dart';
import '../../../core/loader/loader.dart';
import '../../../core/ui/class_estilos_texto.dart';

class RegistrarAvariaPage extends StatefulWidget {
  const RegistrarAvariaPage({super.key});

  @override
  State<RegistrarAvariaPage> createState() => _RegistrarAvariaPageState();
}

class _RegistrarAvariaPageState extends State<RegistrarAvariaPage> with Loader {
  final controller = Modular.get<RegistrarAvariasVeiculoController>();

  final pageViewController = PageController();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case RegistrarAvariasVeiculoStatus.initial:
            break;
          case RegistrarAvariasVeiculoStatus.loading:
            showLoader();
            break;
          case RegistrarAvariasVeiculoStatus.success:
            hideLoader();
            setState(() {});
            break;
          case RegistrarAvariasVeiculoStatus.successResetPassword:
            hideLoader();
            setState(() {});
            break;
          case RegistrarAvariasVeiculoStatus.error:
            hideLoader();
            break;
        }
      });
      await controller.getAvariasDoUsuario();
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      drawer: const CustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 21),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Olá, ${session.Session.userName}!',
                    style: ClassEstilosTextos.pretoSize18w400Montserrat,
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        'Registrar avarias',
                        style: ClassEstilosTextos.pretoSize20w600Montserrat,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Flexible(
                        child: Icon(
                      Icons.garage_outlined,
                      size: 35,
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 11.0, right: 29),
                child: Divider(),
              ),
              const SizedBox(
                height: 3,
              ),
              Visibility(
                visible: session.Session.userIdVeiculo != 0,
                child: Column(
                  children: [
                    Text(
                      'Veículo em uso',
                      style: ClassEstilosTextos.pretoSize18w600Montserrat,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24),
                      child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(color: Colors.grey)),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 5, right: 5),
                          minVerticalPadding: 0,
                          title: Text(
                            '${session.Session.veiculoMarca} - ${session.Session.veiculoModelo}',
                            style: ClassEstilosTextos.pretoSize16w600Montserrat,
                          ),
                          subtitle:
                              Text('Placa: ${session.Session.veiculoPlaca}'),
                          leading: Image.asset(
                            'assets/images/uno.png',
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 11.0, right: 29),
                      child: Divider(),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Avarias registradas',
                  style: ClassEstilosTextos.pretoSize16w600Montserrat,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.lstAvarias.length,
                  itemBuilder: (context, index) {
                    return Card(
                      surfaceTintColor: Colors.white,
                      elevation: 4,
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/uno.png',
                          fit: BoxFit.fill,
                          width: 45,
                          height: 30,
                        ),
                        trailing: const Icon(Icons.remove_red_eye_rounded),
                        title: Text(
                            controller.lstAvarias[index].tituloAvaria ?? '',
                            style: ClassEstilosTextos.pretoSize16w600Montserrat,
                            overflow: TextOverflow.ellipsis),
                        subtitle: Text(
                          controller.lstAvarias[index].mensagemAvaria ?? '',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
       floatingActionButton: session.Session.userIdVeiculo != 0 ? FloatingActionButton.extended(
          backgroundColor: Colors.red.shade400,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Column(
                    children: [
                      Text(
                        'Registrar Avaria',
                        style: ClassEstilosTextos.pretoSize20w600Montserrat,
                        textAlign: TextAlign.center,
                      ),
                      const Divider(),
                    ],
                  ),
                  surfaceTintColor: Colors.white,
                  backgroundColor: Colors.white,
                  content: SizedBox(
                    width: 250,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          'Veículo: ${session.Session.veiculoModelo} - ${session.Session.veiculoPlaca}',
                          style: ClassEstilosTextos.pretoSize14w400Montserrat,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          titulo: 'Título',
                          controller: controller.tituloAvariaEC,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                          titulo: 'Mensagem',
                          controller: controller.mensagemAvariaEC,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Imagem da Avaria',
                              style:
                                  ClassEstilosTextos.pretoSize16w600Montserrat,
                            ))
                      ],
                    ),
                  ),
                  actions: [
                    TextButton.icon(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.red.shade700,
                      ),
                      label: Text(
                        'Cancelar',
                        style: ClassEstilosTextos.vermelhoSize18w600OpenSans,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        await controller.setAvariasDoUsuario();
                        await controller.getAvariasDoUsuario();
                        Modular.to.pop();
                      },
                      icon: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.green.shade700,
                      ),
                      label: Text(
                        'Salvar',
                        style: ClassEstilosTextos.verdeSize18w600OpenSans,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.car_crash_outlined,
            color: Colors.white,
          ),
          label: Text(
            'Registrar Avaria',
            style: ClassEstilosTextos.branccoSize18w600Montserrat,
          )) : null,
    );
  }
}
