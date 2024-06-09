import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/session/session.dart' as session;
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/historico_abastecimento/controllers/historico_abastecimento_controller.dart';
import 'package:mobx/mobx.dart';
import '../../../core/loader/loader.dart';
import '../../../core/ui/class_custom_drawer_widget.dart';
import '../../../core/ui/class_estilos_texto.dart';
import '../../../core/ui/custom_appbar_padrao.dart';

class HistoricoAbastecimentoPage extends StatefulWidget {
  const HistoricoAbastecimentoPage({super.key});

  @override
  State<HistoricoAbastecimentoPage> createState() =>
      _HistoricoAbastecimentoPageState();
}

class _HistoricoAbastecimentoPageState extends State<HistoricoAbastecimentoPage>
    with Loader {
  final controller = Modular.get<HistoricoAbastecimentoController>();

  final pageViewController = PageController();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      statusReactionDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case AbastecimentoVeiculoStatus.initial:
            break;
          case AbastecimentoVeiculoStatus.loading:
            showLoader();
            break;
          case AbastecimentoVeiculoStatus.success:
            hideLoader();

            setState(() {});
            break;
          case AbastecimentoVeiculoStatus.successAbastecimento:
            hideLoader();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Abastecimento salvo com sucesso',
                  style: ClassEstilosTextos.pretoSize20w600Montserrat,
                ),
              ),
            );
            setState(() {});
            break;
          case AbastecimentoVeiculoStatus.error:
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: const CustomAppbarPadrao(),
      backgroundColor: Colors.white,
      body: Observer(builder: (context) {
        return Column(
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
              padding: const EdgeInsets.only(left: 11.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Meus abastecimentos',
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
            const Padding(
              padding: EdgeInsets.only(left: 11.0, right: 29),
              child: Divider(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                shrinkWrap: true,
                itemCount: controller.lstAbastecimentos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.local_gas_station_outlined),
                        title: Text(
                          'R\$ ${controller.calcularValorTotal(index)}',
                          style: ClassEstilosTextos.pretoSize16w600Montserrat,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(controller.formatarDataHora(
                                controller.lstAbastecimentos[index].dataHora ??
                                    '')),
                            Text('Litros: ${controller.lstAbastecimentos[index].quantidadeLitros ?? ''}'),
                            Text('Preço: ${controller.lstAbastecimentos[index].valorCombustivel ?? ''}')
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () async {
                              await controller.gerarRelatorioPdf();
                            },
                            icon: const Icon(
                              Icons.picture_as_pdf_outlined,
                              color: Colors.green,
                            )),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
