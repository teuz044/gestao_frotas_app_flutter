import 'package:mobx/mobx.dart';
part 'visualizar_informacoes_veiculo_controller.g.dart';

class VisualizarInformacoesVeiculoController = VisualizarInformacoesVeiculoControllerBase with _$VisualizarInformacoesVeiculoController;

enum VisualizarInfoStatus {
  initial,
  loading,
  success,
  successResetPassword,
  error;
}

abstract class VisualizarInformacoesVeiculoControllerBase with Store {

 @readonly
  var _status = VisualizarInfoStatus.initial;

  @readonly
  String _errorMessage = '';

}