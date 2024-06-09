// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:gestao_frotas_app/modulos/comunica%C3%A7%C3%A3o_historico/historico_abastecimento/repositories/historico_abastecimento_repository.dart';
import 'package:mobx/mobx.dart';

import '../../../veiculo/registrar_abastecimento/models/registrar_abastecimento_model_set.dart';
part 'historico_abastecimento_controller.g.dart';

class HistoricoAbastecimentoController = HistoricoAbastecimentoControllerBase
    with _$HistoricoAbastecimentoController;

enum AbastecimentoVeiculoStatus {
  initial,
  loading,
  success,
  successAbastecimento,
  error;
}


abstract class HistoricoAbastecimentoControllerBase with Store {
  final HistoricoAbastecimentoRepository _historicoAbastecimentoRepository;
  @readonly
  var _status = AbastecimentoVeiculoStatus.initial;

  @readonly
  String _errorMessage = '';

  @readonly
  var _lstAbastecimentos = <RegistrarAbastecimentoModelSet>[];

  HistoricoAbastecimentoControllerBase(this._historicoAbastecimentoRepository);


  @action
  Future<void> getAbastecimentosDoUsuario() async {
    try {
      _status = AbastecimentoVeiculoStatus.loading;
      await Future.delayed(Duration.zero);
      _lstAbastecimentos =
          await _historicoAbastecimentoRepository.getAbastecimentosDoUsuario();
      _status = AbastecimentoVeiculoStatus.success;
    } catch (e) {
      log('Erro ao buscar informações de abastecimento');
      _status = AbastecimentoVeiculoStatus.error;
      rethrow;
    }
  }

  @action
  String calcularValorTotal(int index) {
    _status = AbastecimentoVeiculoStatus.initial;
     Future.delayed(Duration.zero);
    final precoCombustivel = double.tryParse((_lstAbastecimentos[index].valorCombustivel ?? '0').replaceAll(',', '.').replaceAll('R\$', '').trim()) ?? 0.0;
    final quantidadeLitros = double.tryParse((_lstAbastecimentos[index].quantidadeLitros ?? '0').replaceAll(',', '.').replaceAll('R\$', '').trim()) ?? 0.0;
    final total = (precoCombustivel * quantidadeLitros).toStringAsFixed(2);
     _status = AbastecimentoVeiculoStatus.success;
    return total;
  }

  String formatarDataHora(String dataHoraSQL) {
  DateTime dateTime = DateTime.parse(dataHoraSQL);
  String dataBrasileira = "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
  String horaBrasileira = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  return "$dataBrasileira - $horaBrasileira";
}
 Future<Uint8List> generatePdf(List<RegistrarAbastecimentoModelSet> abastecimentos) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Relatório de Abastecimento', style: pw.TextStyle(fontSize: 24, font: pw.Font.courierBold())),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                context: context,
                data: <List<String>>[
                  <String>['Data e Hora', 'KM Atual', 'Valor Combustível', 'Quantidade Litros', 'Total Gasto'],
                  ...abastecimentos.map((abastecimento) {
                    final totalGasto = double.tryParse(abastecimento.totalGasto ?? '0')?.toStringAsFixed(2) ?? '0.00';
                    return [
                      formatarDataHora(abastecimento.dataHora ?? ''),
                      abastecimento.kmAtual ?? '',
                      abastecimento.valorCombustivel ?? '',
                      abastecimento.quantidadeLitros ?? '',
                      totalGasto,
                    ];
                  }).toList(),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<void> gerarRelatorioPdf() async {
    try {
      final pdfData = await generatePdf(_lstAbastecimentos);
      await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfData);
    } catch (e) {
      log('Erro ao gerar relatório PDF: $e');
    }
  }

}
