import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

enum HomeControllerStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class HomeControllerBase with Store {

  @observable
  bool isExpandedVeiculo = false;

  @observable
  bool isExpandedComunicacao = false;

  @observable
  bool isExpandedViagens = false;

  @readonly
  String _errorMessage = '';

    @readonly
  var _status = HomeControllerStateStatus.initial;
}
