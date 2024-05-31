// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:gestao_frotas_app/modulos/home/models/info_veiculo_model.dart';

class InfoUserModel {
  int? id;
  int? idVeiculo;
  int? idCliente;
  String? nome;
  String? email;
  String? senha;
  int? tipoUsuario;
  String? cpf;
  String? rg;
  String? dataNascimento;
  String? celular;
  String? endereco;
  String? cep;
  String? cidade;
  String? estado;
  String? cnh;
  String? genero;
  String? categoria;
  String? historicoInfracoes;
  String? historicoAcidentes;
  String? banco;
  String? numeroConta;
  String? digitoVerificador;
  String? tipo;
  String? nomeEmergencia;
  String? telefoneEmergencia;
  String? statusConta;
  String? dataCriacao;
  String? dataAtualizacao;
  InfoVeiculoModel? idVeiculo2;
  InfoUserModel({
    this.id,
    this.idVeiculo,
    this.idCliente,
    this.nome,
    this.email,
    this.senha,
    this.tipoUsuario,
    this.cpf,
    this.rg,
    this.dataNascimento,
    this.celular,
    this.endereco,
    this.cep,
    this.cidade,
    this.estado,
    this.cnh,
    this.genero,
    this.categoria,
    this.historicoInfracoes,
    this.historicoAcidentes,
    this.banco,
    this.numeroConta,
    this.digitoVerificador,
    this.tipo,
    this.nomeEmergencia,
    this.telefoneEmergencia,
    this.statusConta,
    this.dataCriacao,
    this.dataAtualizacao,
    this.idVeiculo2,
  });


  InfoUserModel copyWith({
    int? id,
    int? idVeiculo,
    int? idCliente,
    String? nome,
    String? email,
    String? senha,
    int? tipoUsuario,
    String? cpf,
    String? rg,
    String? dataNascimento,
    String? celular,
    String? endereco,
    String? cep,
    String? cidade,
    String? estado,
    String? cnh,
    String? genero,
    String? categoria,
    String? historicoInfracoes,
    String? historicoAcidentes,
    String? banco,
    String? numeroConta,
    String? digitoVerificador,
    String? tipo,
    String? nomeEmergencia,
    String? telefoneEmergencia,
    String? statusConta,
    String? dataCriacao,
    String? dataAtualizacao,
    InfoVeiculoModel? idVeiculo2,
  }) {
    return InfoUserModel(
      id: id ?? this.id,
      idVeiculo: idVeiculo ?? this.idVeiculo,
      idCliente: idCliente ?? this.idCliente,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      tipoUsuario: tipoUsuario ?? this.tipoUsuario,
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      celular: celular ?? this.celular,
      endereco: endereco ?? this.endereco,
      cep: cep ?? this.cep,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      cnh: cnh ?? this.cnh,
      genero: genero ?? this.genero,
      categoria: categoria ?? this.categoria,
      historicoInfracoes: historicoInfracoes ?? this.historicoInfracoes,
      historicoAcidentes: historicoAcidentes ?? this.historicoAcidentes,
      banco: banco ?? this.banco,
      numeroConta: numeroConta ?? this.numeroConta,
      digitoVerificador: digitoVerificador ?? this.digitoVerificador,
      tipo: tipo ?? this.tipo,
      nomeEmergencia: nomeEmergencia ?? this.nomeEmergencia,
      telefoneEmergencia: telefoneEmergencia ?? this.telefoneEmergencia,
      statusConta: statusConta ?? this.statusConta,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
      idVeiculo2: idVeiculo2 ?? this.idVeiculo2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idVeiculo': idVeiculo,
      'idCliente': idCliente,
      'nome': nome,
      'email': email,
      'senha': senha,
      'tipoUsuario': tipoUsuario,
      'cpf': cpf,
      'rg': rg,
      'dataNascimento': dataNascimento,
      'celular': celular,
      'endereco': endereco,
      'cep': cep,
      'cidade': cidade,
      'estado': estado,
      'cnh': cnh,
      'genero': genero,
      'categoria': categoria,
      'historicoInfracoes': historicoInfracoes,
      'historicoAcidentes': historicoAcidentes,
      'banco': banco,
      'numeroConta': numeroConta,
      'digitoVerificador': digitoVerificador,
      'tipo': tipo,
      'nomeEmergencia': nomeEmergencia,
      'telefoneEmergencia': telefoneEmergencia,
      'statusConta': statusConta,
      'dataCriacao': dataCriacao,
      'dataAtualizacao': dataAtualizacao,
      'idVeiculo2': idVeiculo2?.toMap(),
    };
  }

  factory InfoUserModel.fromMap(Map<String, dynamic> map) {
    return InfoUserModel(
      id: map['id'] != null ? map['id'] as int : null,
      idVeiculo: map['idVeiculo'] != null ? map['idVeiculo'] as int : null,
      idCliente: map['idCliente'] != null ? map['idCliente'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
      tipoUsuario: map['tipoUsuario'] != null ? map['tipoUsuario'] as int : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      rg: map['rg'] != null ? map['rg'] as String : null,
      dataNascimento: map['dataNascimento'] != null ? map['dataNascimento'] as String : null,
      celular: map['celular'] != null ? map['celular'] as String : null,
      endereco: map['endereco'] != null ? map['endereco'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      cnh: map['cnh'] != null ? map['cnh'] as String : null,
      genero: map['genero'] != null ? map['genero'] as String : null,
      categoria: map['categoria'] != null ? map['categoria'] as String : null,
      historicoInfracoes: map['historicoInfracoes'] != null ? map['historicoInfracoes'] as String : null,
      historicoAcidentes: map['historicoAcidentes'] != null ? map['historicoAcidentes'] as String : null,
      banco: map['banco'] != null ? map['banco'] as String : null,
      numeroConta: map['numeroConta'] != null ? map['numeroConta'] as String : null,
      digitoVerificador: map['digitoVerificador'] != null ? map['digitoVerificador'] as String : null,
      tipo: map['tipo'] != null ? map['tipo'] as String : null,
      nomeEmergencia: map['nomeEmergencia'] != null ? map['nomeEmergencia'] as String : null,
      telefoneEmergencia: map['telefoneEmergencia'] != null ? map['telefoneEmergencia'] as String : null,
      statusConta: map['statusConta'] != null ? map['statusConta'] as String : null,
      dataCriacao: map['dataCriacao'] != null ? map['dataCriacao'] as String : null,
      dataAtualizacao: map['dataAtualizacao'] != null ? map['dataAtualizacao'] as String : null,
      idVeiculo2: map['idVeiculo2'] != null ? InfoVeiculoModel.fromMap(map['idVeiculo2'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoUserModel.fromJson(String source) => InfoUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InfoUserModel(id: $id, idVeiculo: $idVeiculo, idCliente: $idCliente, nome: $nome, email: $email, senha: $senha, tipoUsuario: $tipoUsuario, cpf: $cpf, rg: $rg, dataNascimento: $dataNascimento, celular: $celular, endereco: $endereco, cep: $cep, cidade: $cidade, estado: $estado, cnh: $cnh, genero: $genero, categoria: $categoria, historicoInfracoes: $historicoInfracoes, historicoAcidentes: $historicoAcidentes, banco: $banco, numeroConta: $numeroConta, digitoVerificador: $digitoVerificador, tipo: $tipo, nomeEmergencia: $nomeEmergencia, telefoneEmergencia: $telefoneEmergencia, statusConta: $statusConta, dataCriacao: $dataCriacao, dataAtualizacao: $dataAtualizacao, idVeiculo2: $idVeiculo2)';
  }

  @override
  bool operator ==(covariant InfoUserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idVeiculo == idVeiculo &&
      other.idCliente == idCliente &&
      other.nome == nome &&
      other.email == email &&
      other.senha == senha &&
      other.tipoUsuario == tipoUsuario &&
      other.cpf == cpf &&
      other.rg == rg &&
      other.dataNascimento == dataNascimento &&
      other.celular == celular &&
      other.endereco == endereco &&
      other.cep == cep &&
      other.cidade == cidade &&
      other.estado == estado &&
      other.cnh == cnh &&
      other.genero == genero &&
      other.categoria == categoria &&
      other.historicoInfracoes == historicoInfracoes &&
      other.historicoAcidentes == historicoAcidentes &&
      other.banco == banco &&
      other.numeroConta == numeroConta &&
      other.digitoVerificador == digitoVerificador &&
      other.tipo == tipo &&
      other.nomeEmergencia == nomeEmergencia &&
      other.telefoneEmergencia == telefoneEmergencia &&
      other.statusConta == statusConta &&
      other.dataCriacao == dataCriacao &&
      other.dataAtualizacao == dataAtualizacao &&
      other.idVeiculo2 == idVeiculo2;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idVeiculo.hashCode ^
      idCliente.hashCode ^
      nome.hashCode ^
      email.hashCode ^
      senha.hashCode ^
      tipoUsuario.hashCode ^
      cpf.hashCode ^
      rg.hashCode ^
      dataNascimento.hashCode ^
      celular.hashCode ^
      endereco.hashCode ^
      cep.hashCode ^
      cidade.hashCode ^
      estado.hashCode ^
      cnh.hashCode ^
      genero.hashCode ^
      categoria.hashCode ^
      historicoInfracoes.hashCode ^
      historicoAcidentes.hashCode ^
      banco.hashCode ^
      numeroConta.hashCode ^
      digitoVerificador.hashCode ^
      tipo.hashCode ^
      nomeEmergencia.hashCode ^
      telefoneEmergencia.hashCode ^
      statusConta.hashCode ^
      dataCriacao.hashCode ^
      dataAtualizacao.hashCode ^
      idVeiculo2.hashCode;
  }
}
