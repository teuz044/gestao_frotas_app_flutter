class AvariasSetModel {
  int? idVeiculo;
  int? idUsuario;
  String? tituloAvaria;
  String? mensagemAvaria;
  String? statusAvaria;

  AvariasSetModel(
      {this.idVeiculo,
      this.idUsuario,
      this.tituloAvaria,
      this.mensagemAvaria,
      this.statusAvaria});

  AvariasSetModel.fromJson(Map<String, dynamic> json) {
    idVeiculo = json['idVeiculo'];
    idUsuario = json['idUsuario'];
    tituloAvaria = json['tituloAvaria'];
    mensagemAvaria = json['mensagemAvaria'];
    statusAvaria = json['statusAvaria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idVeiculo'] = idVeiculo;
    data['idUsuario'] = idUsuario;
    data['tituloAvaria'] = tituloAvaria;
    data['mensagemAvaria'] = mensagemAvaria;
    data['statusAvaria'] = statusAvaria;
    return data;
  }
}
