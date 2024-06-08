import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:gestao_frotas_app/core/loader/loader.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import 'package:gestao_frotas_app/core/ui/custom_text_field.dart';
import 'package:gestao_frotas_app/modulos/veiculo/registrar_abastecimento/controllers/registrar_abastecimento_controller.dart';
import 'package:mobx/mobx.dart';
import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class SolicitarManutencaoVeiculoPage extends StatefulWidget {
  const SolicitarManutencaoVeiculoPage({super.key});

  @override
  State<SolicitarManutencaoVeiculoPage> createState() =>
      _SolicitarManutencaoVeiculoPageState();
}

class _SolicitarManutencaoVeiculoPageState
    extends State<SolicitarManutencaoVeiculoPage> with Loader {
  final controller = Modular.get<RegistrarAbastecimentoController>();

  final pageViewController = PageController();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case RegistrarAbastecimentoVeiculoStatus.initial:
            break;
          case RegistrarAbastecimentoVeiculoStatus.loading:
            showLoader();
            break;
          case RegistrarAbastecimentoVeiculoStatus.success:
            hideLoader();
           
            setState(() {});
            break;
          case RegistrarAbastecimentoVeiculoStatus.successAbastecimento:
            hideLoader();
             showDialog(context: context, builder: (context) => AlertDialog(backgroundColor: Colors.white ,title: Text('Abastecimento salvo com sucesso', style: ClassEstilosTextos.pretoSize20w600Montserrat,),),);
            setState(() {});
            break;
          case RegistrarAbastecimentoVeiculoStatus.error:
            hideLoader();
            break;
        }
      });
      await controller.getAbastecimentosDoUsuario();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          child: session.Session.userIdVeiculo != 0 ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 12),
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
                        'Registre um novo abastecimento abaixo',
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
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Form(
                          key: controller.formKeyAbastecimento,
                          child: Column(
                            children: [
                              CustomTextField(
                                  validator: true,
                                  controller: controller.kmAtualEC,
                                  
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  titulo: 'Kilometragem atual do veículo'),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomTextField(
                                  validator: true,
                                  controller: controller.precoCombustivelEC,
                                  onChanged: (p0) async {
                                    await controller.calcularValorTotal();
                                  },
                                  inputFormatters: [CurrencyInputFormatter()],
                                  titulo: 'Preço do Combustível'),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomTextField(
                                  validator: true,
                                  controller: controller.quantidadeLitrosEC,
                                  onChanged: (p0) async {
                                    await controller.calcularValorTotal();
                                  },
                                  inputFormatters: [CurrencyInputFormatter()],
                                  titulo: 'Quantidade de Litros'),
                              const SizedBox(
                                height: 12,
                              ),
                              Align(
                                           alignment: Alignment.centerLeft,
                                child: Text(
                                  'Valor total: ${controller.valorTotalEC.text}',
                                  style: ClassEstilosTextos
                                      .pretoSize18w400Montserrat,
                                      textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Colors.green.shade400,
                              fixedSize:
                                  const Size.fromWidth(double.maxFinite)),
                          onPressed: () async {
                            if (controller.formKeyAbastecimento.currentState!
                                .validate()) {

                                  await controller.setAbastecimento();
                                  controller.limparCampos();
                                  await controller.getAbastecimentosDoUsuario();
                                }
                          },
                          icon: const Icon(
                            Icons.check_circle_outline_outlined,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Salvar',
                            style:
                                ClassEstilosTextos.branccoSize20w600Montserrat,
                          )),
                    ),
                    const SizedBox(
                                height: 12,
                              ),
                  ],
                ),
              )
            ],
          ) : Center(child: Text('Você não está utilizando nenhum veículo no momento', style: ClassEstilosTextos.branccoSize18w600Montserrat,),)
        );
      }),
    );
  }
}
