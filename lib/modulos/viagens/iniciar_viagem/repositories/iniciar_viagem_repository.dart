import '../models/veiculo_model.dart';

abstract class IniciarViagemRepository {
Future<List<VeiculoModel>> getVeiculo();
}