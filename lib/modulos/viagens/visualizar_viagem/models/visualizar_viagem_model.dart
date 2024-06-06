// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class VisualizarViagemModel {
   int? id;
  int? idCondutor;
  String? destino;
  int? numero;
  String? placa;
  String? bairro;
  String? cidade;
  String? complemento;
  String? referencia;
  String? consumo;
  String? distancia;
  VisualizarViagemModel({
    this.id,
    this.idCondutor,
    this.destino,
    this.numero,
    this.placa,
    this.bairro,
    this.cidade,
    this.complemento,
    this.referencia,
    this.consumo,
    this.distancia,
  });

  VisualizarViagemModel copyWith({
    int? id,
    int? idCondutor,
    String? destino,
    int? numero,
    String? placa,
    String? bairro,
    String? cidade,
    String? complemento,
    String? referencia,
    String? consumo,
    String? distancia,
  }) {
    return VisualizarViagemModel(
      id: id ?? this.id,
      idCondutor: idCondutor ?? this.idCondutor,
      destino: destino ?? this.destino,
      numero: numero ?? this.numero,
      placa: placa ?? this.placa,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      complemento: complemento ?? this.complemento,
      referencia: referencia ?? this.referencia,
      consumo: consumo ?? this.consumo,
      distancia: distancia ?? this.distancia,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idCondutor': idCondutor,
      'destino': destino,
      'numero': numero,
      'placa': placa,
      'bairro': bairro,
      'cidade': cidade,
      'complemento': complemento,
      'referencia': referencia,
      'consumo': consumo,
      'distancia': distancia,
    };
  }

  factory VisualizarViagemModel.fromMap(Map<String, dynamic> map) {
    return VisualizarViagemModel(
      id: map['id'] != null ? map['id'] as int : null,
      idCondutor: map['idCondutor'] != null ? map['idCondutor'] as int : null,
      destino: map['destino'] != null ? map['destino'] as String : null,
      numero: map['numero'] != null ? map['numero'] as int : null,
      placa: map['placa'] != null ? map['placa'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      complemento: map['complemento'] != null ? map['complemento'] as String : null,
      referencia: map['referencia'] != null ? map['referencia'] as String : null,
      consumo: map['consumo'] != null ? map['consumo'] as String : null,
      distancia: map['distancia'] != null ? map['distancia'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VisualizarViagemModel.fromJson(String source) => VisualizarViagemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VisualizarViagemModel(id: $id, idCondutor: $idCondutor, destino: $destino, numero: $numero, placa: $placa, bairro: $bairro, cidade: $cidade, complemento: $complemento, referencia: $referencia, consumo: $consumo, distancia: $distancia)';
  }

  @override
  bool operator ==(covariant VisualizarViagemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idCondutor == idCondutor &&
      other.destino == destino &&
      other.numero == numero &&
      other.placa == placa &&
      other.bairro == bairro &&
      other.cidade == cidade &&
      other.complemento == complemento &&
      other.referencia == referencia &&
      other.consumo == consumo &&
      other.distancia == distancia;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idCondutor.hashCode ^
      destino.hashCode ^
      numero.hashCode ^
      placa.hashCode ^
      bairro.hashCode ^
      cidade.hashCode ^
      complemento.hashCode ^
      referencia.hashCode ^
      consumo.hashCode ^
      distancia.hashCode;
  }
}
