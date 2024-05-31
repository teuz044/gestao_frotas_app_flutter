import 'package:gestao_frotas_app/modulos/viagens/iniciar_viagem/models/veiculo_model.dart';

class AvariasGetModel {
  int? id;
  int? idVeiculo;
  int? idUsuario;
  String? tituloAvaria;
  String? statusAvaria;
  String? mensagemAvaria;
  String? dataCriacao;
  String? dataAtualizacao;
  VeiculoModel? veiculo;

  AvariasGetModel(
      {this.id,
      this.idVeiculo,
      this.idUsuario,
      this.tituloAvaria,
      this.statusAvaria,
      this.mensagemAvaria,
      this.dataCriacao,
      this.dataAtualizacao,
      this.veiculo});

  AvariasGetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idVeiculo = json['idVeiculo'];
    idUsuario = json['idUsuario'];
    tituloAvaria = json['tituloAvaria'];
    statusAvaria = json['statusAvaria'];
    mensagemAvaria = json['mensagemAvaria'];
    dataCriacao = json['dataCriacao'];
    dataAtualizacao = json['dataAtualizacao'];
    veiculo =
        json['veiculo'] != null ? VeiculoModel.fromJson(json['veiculo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idVeiculo'] = idVeiculo;
    data['idUsuario'] = idUsuario;
    data['tituloAvaria'] = tituloAvaria;
    data['statusAvaria'] = statusAvaria;
    data['mensagemAvaria'] = mensagemAvaria;
    data['dataCriacao'] = dataCriacao;
    data['dataAtualizacao'] = dataAtualizacao;
    if (veiculo != null) {
      data['veiculo'] = veiculo!.toJson();
    }
    return data;
  }

   static AvariasGetModel fromMap(Map<String, dynamic> map) {
    return AvariasGetModel(
      id: map['id'],
      idVeiculo: map['idVeiculo'],
      idUsuario: map['idUsuario'],
      tituloAvaria: map['tituloAvaria'],
      statusAvaria: map['statusAvaria'],
      mensagemAvaria: map['mensagemAvaria'],
      dataCriacao: map['dataCriacao'],
      dataAtualizacao: map['dataAtualizacao'],
      veiculo: map['veiculo'] != null ? VeiculoModel.fromMap(map['veiculo']as Map<String,dynamic>) : null,
    );
  }
}

