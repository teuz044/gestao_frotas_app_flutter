// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class RegistrarAbastecimentoModelSet {
  int? id;
  int? idVeiculo;
  int? idUsuario;
  String? kmAtual;
  String? valorCombustivel;
  String? quantidadeLitros;
  String? totalGasto;
  String? dataHora;
  RegistrarAbastecimentoModelSet({
    this.id,
    this.idVeiculo,
    this.idUsuario,
    this.kmAtual,
    this.valorCombustivel,
    this.quantidadeLitros,
    this.totalGasto,
    this.dataHora,
  });

  RegistrarAbastecimentoModelSet copyWith({
    int? id,
    int? idVeiculo,
    int? idUsuario,
    String? kmAtual,
    String? valorCombustivel,
    String? quantidadeLitros,
    String? totalGasto,
    String? dataHora,
  }) {
    return RegistrarAbastecimentoModelSet(
      id: id ?? this.id,
      idVeiculo: idVeiculo ?? this.idVeiculo,
      idUsuario: idUsuario ?? this.idUsuario,
      kmAtual: kmAtual ?? this.kmAtual,
      valorCombustivel: valorCombustivel ?? this.valorCombustivel,
      quantidadeLitros: quantidadeLitros ?? this.quantidadeLitros,
      totalGasto: totalGasto ?? this.totalGasto,
      dataHora: dataHora ?? this.dataHora,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idVeiculo': idVeiculo,
      'idUsuario': idUsuario,
      'kmAtual': kmAtual,
      'valorCombustivel': valorCombustivel,
      'quantidadeLitros': quantidadeLitros,
      'totalGasto': totalGasto,
      'dataHora': dataHora,
    };
  }

  factory RegistrarAbastecimentoModelSet.fromMap(Map<String, dynamic> map) {
    return RegistrarAbastecimentoModelSet(
      id: map['id'] != null ? map['id'] as int : null,
      idVeiculo: map['idVeiculo'] != null ? map['idVeiculo'] as int : null,
      idUsuario: map['idUsuario'] != null ? map['idUsuario'] as int : null,
      kmAtual: map['kmAtual'] != null ? map['kmAtual'] as String : null,
      valorCombustivel: map['valorCombustivel'] != null ? map['valorCombustivel'] as String : null,
      quantidadeLitros: map['quantidadeLitros'] != null ? map['quantidadeLitros'] as String : null,
      totalGasto: map['totalGasto'] != null ? map['totalGasto'] as String : null,
      dataHora: map['dataHora'] != null ? map['dataHora'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrarAbastecimentoModelSet.fromJson(String source) => RegistrarAbastecimentoModelSet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistrarAbastecimentoModelSet(id: $id, idVeiculo: $idVeiculo, idUsuario: $idUsuario, kmAtual: $kmAtual, valorCombustivel: $valorCombustivel, quantidadeLitros: $quantidadeLitros, totalGasto: $totalGasto, dataHora: $dataHora)';
  }

  @override
  bool operator ==(covariant RegistrarAbastecimentoModelSet other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idVeiculo == idVeiculo &&
      other.idUsuario == idUsuario &&
      other.kmAtual == kmAtual &&
      other.valorCombustivel == valorCombustivel &&
      other.quantidadeLitros == quantidadeLitros &&
      other.totalGasto == totalGasto &&
      other.dataHora == dataHora;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idVeiculo.hashCode ^
      idUsuario.hashCode ^
      kmAtual.hashCode ^
      valorCombustivel.hashCode ^
      quantidadeLitros.hashCode ^
      totalGasto.hashCode ^
      dataHora.hashCode;
  }
}
