// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_frotas_app/core/ui/class_app_mask.dart';
import 'package:gestao_frotas_app/core/ui/custom_text_form_field_no_border.dart';
import 'package:mobx/mobx.dart';
import '../../core/ui/class_estilos_texto.dart';
import 'controllers/cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final controller = Modular.get<CadastroController>();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction((_) => controller.status, (status) {
      switch (status) {
        case CadastroStateStatus.initial:
          break;
        case CadastroStateStatus.loading:
          break;
        case CadastroStateStatus.success:
          break;
        case CadastroStateStatus.successResetPassword:
          break;
        case CadastroStateStatus.error:
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xFF1C2120),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: const Color(0xFF1C2120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logo',
                    style: ClassEstilosTextos.branccoSize24w600Montserrat,
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: MediaQuery.of(context).size.height * 0.65,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    // Wrap the inner ListView in a Column
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Cadastre-se',
                        style: ClassEstilosTextos.pretoSize24w600Montserrat,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        child: Text(
                          'Retorne para o login!',
                          style: ClassEstilosTextos.pretoSize14w400Montserrat,
                        ),
                        onTap: () {
                          Modular.to.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormFieldNoBorderWidget(
                        suffixIcon: const Icon(Icons.person),
                        titulo: 'Nome',
                        validator: true,
                        controller: controller.nomeEC,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                          validator: true,
                          suffixIcon: const Icon(Icons.mail),
                          titulo: 'Email',
                          controller: controller.emailEC),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                          validator: true,
                          obscureText: true,
                          suffixIcon: const Icon(Icons.password_outlined),
                          titulo: 'Senha',
                          controller: controller.senhaEC),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.document_scanner_outlined),
                        titulo: 'Cpf',
                        controller: controller.cpfEC,
                        inputFormatters: [ClassAppMasks.cpfMask],
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.person_2_outlined),
                        titulo: 'Rg',
                        controller: controller.rgEC,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.date_range_outlined),
                        titulo: 'Data de nascimento',
                        controller: controller.dataNascimentoEC,
                        inputFormatters: [ClassAppMasks.dataMask],
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.phone_android_outlined),
                        titulo: 'Celular',
                        controller: controller.celularEC,
                        inputFormatters: [ClassAppMasks.telefoneMask],
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.home_filled),
                        titulo: 'Endereço',
                        controller: controller.endereOEC,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.date_range_outlined),
                        titulo: 'CEP',
                        controller: controller.cepEC,
                        inputFormatters: [ClassAppMasks.cepMask],
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.location_city_outlined),
                        titulo: 'Cidade',
                        controller: controller.cidadeEC,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormFieldNoBorderWidget(
                        validator: true,
                        suffixIcon: const Icon(Icons.location_city),
                        titulo: 'Estado - UF',
                        controller: controller.estadoEC,
                      ),
                      const SizedBox(height: 16),
                      controller.carregando == false
                          ? ElevatedButton.icon(
                              onPressed: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  bool logado = await controller.registro();
                                  switch (logado) {
                                    case true:
                                      Modular.to.navigate('/login');
                                      break;
                                    case false:
                                      const snackBar = SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('Registro falhou'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      break;
                                    default:
                                  }
                                }
                              },
                              icon: const Icon(Icons.login),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size.fromHeight(50),
                                  backgroundColor: const Color(0xFF1C2120),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              label: Text(
                                'Cadastrar',
                                style: ClassEstilosTextos
                                    .branccoSize24w600Montserrat,
                              ),
                            )
                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
