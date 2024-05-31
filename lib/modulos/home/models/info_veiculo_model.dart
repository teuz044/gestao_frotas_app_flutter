// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class InfoVeiculoModel {
  int? id;
  String? placa;
  String? modelo;
  String? marca;
  String? anoFabricacao;
  String? anoModelo;
  String? quilometragem;
  String? cor;
  String? tipoCombustivel;
  String? dataCriacao;
  int? statusVeiculo;
  int? volumeTanque;
  int? consumoMedioLitro;
  InfoVeiculoModel({
    this.id,
    this.placa,
    this.modelo,
    this.marca,
    this.anoFabricacao,
    this.anoModelo,
    this.quilometragem,
    this.cor,
    this.tipoCombustivel,
    this.dataCriacao,
    this.statusVeiculo,
    this.volumeTanque,
    this.consumoMedioLitro,
  });

  InfoVeiculoModel copyWith({
    int? id,
    String? placa,
    String? modelo,
    String? marca,
    String? anoFabricacao,
    String? anoModelo,
    String? quilometragem,
    String? cor,
    String? tipoCombustivel,
    String? dataCriacao,
    int? statusVeiculo,
    int? volumeTanque,
    int? consumoMedioLitro,
  }) {
    return InfoVeiculoModel(
      id: id ?? this.id,
      placa: placa ?? this.placa,
      modelo: modelo ?? this.modelo,
      marca: marca ?? this.marca,
      anoFabricacao: anoFabricacao ?? this.anoFabricacao,
      anoModelo: anoModelo ?? this.anoModelo,
      quilometragem: quilometragem ?? this.quilometragem,
      cor: cor ?? this.cor,
      tipoCombustivel: tipoCombustivel ?? this.tipoCombustivel,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      statusVeiculo: statusVeiculo ?? this.statusVeiculo,
      volumeTanque: volumeTanque ?? this.volumeTanque,
      consumoMedioLitro: consumoMedioLitro ?? this.consumoMedioLitro,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'placa': placa,
      'modelo': modelo,
      'marca': marca,
      'anoFabricacao': anoFabricacao,
      'anoModelo': anoModelo,
      'quilometragem': quilometragem,
      'cor': cor,
      'tipoCombustivel': tipoCombustivel,
      'dataCriacao': dataCriacao,
      'statusVeiculo': statusVeiculo,
      'volumeTanque': volumeTanque,
      'consumoMedioLitro': consumoMedioLitro,
    };
  }

  factory InfoVeiculoModel.fromMap(Map<String, dynamic> map) {
    return InfoVeiculoModel(
      id: map['id'] != null ? map['id'] as int : null,
      placa: map['placa'] != null ? map['placa'] as String : null,
      modelo: map['modelo'] != null ? map['modelo'] as String : null,
      marca: map['marca'] != null ? map['marca'] as String : null,
      anoFabricacao: map['anoFabricacao'] != null ? map['anoFabricacao'] as String : null,
      anoModelo: map['anoModelo'] != null ? map['anoModelo'] as String : null,
      quilometragem: map['quilometragem'] != null ? map['quilometragem'] as String : null,
      cor: map['cor'] != null ? map['cor'] as String : null,
      tipoCombustivel: map['tipoCombustivel'] != null ? map['tipoCombustivel'] as String : null,
      dataCriacao: map['dataCriacao'] != null ? map['dataCriacao'] as String : null,
      statusVeiculo: map['statusVeiculo'] != null ? map['statusVeiculo'] as int : null,
      volumeTanque: map['volumeTanque'] != null ? map['volumeTanque'] as int : null,
      consumoMedioLitro: map['consumoMedioLitro'] != null ? map['consumoMedioLitro'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoVeiculoModel.fromJson(String source) => InfoVeiculoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InfoVeiculoModel(id: $id, placa: $placa, modelo: $modelo, marca: $marca, anoFabricacao: $anoFabricacao, anoModelo: $anoModelo, quilometragem: $quilometragem, cor: $cor, tipoCombustivel: $tipoCombustivel, dataCriacao: $dataCriacao, statusVeiculo: $statusVeiculo, volumeTanque: $volumeTanque, consumoMedioLitro: $consumoMedioLitro)';
  }

  @override
  bool operator ==(covariant InfoVeiculoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.placa == placa &&
      other.modelo == modelo &&
      other.marca == marca &&
      other.anoFabricacao == anoFabricacao &&
      other.anoModelo == anoModelo &&
      other.quilometragem == quilometragem &&
      other.cor == cor &&
      other.tipoCombustivel == tipoCombustivel &&
      other.dataCriacao == dataCriacao &&
      other.statusVeiculo == statusVeiculo &&
      other.volumeTanque == volumeTanque &&
      other.consumoMedioLitro == consumoMedioLitro;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      placa.hashCode ^
      modelo.hashCode ^
      marca.hashCode ^
      anoFabricacao.hashCode ^
      anoModelo.hashCode ^
      quilometragem.hashCode ^
      cor.hashCode ^
      tipoCombustivel.hashCode ^
      dataCriacao.hashCode ^
      statusVeiculo.hashCode ^
      volumeTanque.hashCode ^
      consumoMedioLitro.hashCode;
  }
}
