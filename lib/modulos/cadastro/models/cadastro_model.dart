// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CadastroModel {
  int? idCliente;
  String? nome;
  String? email;
  String? senha;
  int? tipoUsuario;
  String? cpf;
  String? rg;
  String? dataNascimento;
  String? celular;
  String? endereO;
  String? cep;
  String? cidade;
  String? estado;
  String? statusConta;
  CadastroModel({
    this.idCliente,
    this.nome,
    this.email,
    this.senha,
    this.tipoUsuario,
    this.cpf,
    this.rg,
    this.dataNascimento,
    this.celular,
    this.endereO,
    this.cep,
    this.cidade,
    this.estado,
    this.statusConta,
  });

  CadastroModel copyWith({
    int? idCliente,
    String? nome,
    String? email,
    String? senha,
    int? tipoUsuario,
    String? cpf,
    String? rg,
    String? dataNascimento,
    String? celular,
    String? endereO,
    String? cep,
    String? cidade,
    String? estado,
    String? statusConta,
  }) {
    return CadastroModel(
      idCliente: idCliente ?? this.idCliente,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      tipoUsuario: tipoUsuario ?? this.tipoUsuario,
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      celular: celular ?? this.celular,
      endereO: endereO ?? this.endereO,
      cep: cep ?? this.cep,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      statusConta: statusConta ?? this.statusConta,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCliente': idCliente,
      'nome': nome,
      'email': email,
      'senha': senha,
      'tipoUsuario': tipoUsuario,
      'cpf': cpf,
      'rg': rg,
      'dataNascimento': dataNascimento,
      'celular': celular,
      'endereço': endereO,
      'cep': cep,
      'cidade': cidade,
      'estado': estado,
      'statusConta': statusConta,
    };
  }

  factory CadastroModel.fromMap(Map<String, dynamic> map) {
    return CadastroModel(
      idCliente: map['idCliente'] != null ? map['idCliente'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
      tipoUsuario: map['tipoUsuario'] != null ? map['tipoUsuario'] as int : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      rg: map['rg'] != null ? map['rg'] as String : null,
      dataNascimento: map['dataNascimento'] != null ? map['dataNascimento'] as String : null,
      celular: map['celular'] != null ? map['celular'] as String : null,
      endereO: map['endereço'] != null ? map['endereço'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      statusConta: map['statusConta'] != null ? map['statusConta'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CadastroModel.fromJson(String source) => CadastroModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CadastroModel(idCliente: $idCliente, nome: $nome, email: $email, senha: $senha, tipoUsuario: $tipoUsuario, cpf: $cpf, rg: $rg, dataNascimento: $dataNascimento, celular: $celular, endereço: $endereO, cep: $cep, cidade: $cidade, estado: $estado, statusConta: $statusConta)';
  }

  @override
  bool operator ==(covariant CadastroModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idCliente == idCliente &&
      other.nome == nome &&
      other.email == email &&
      other.senha == senha &&
      other.tipoUsuario == tipoUsuario &&
      other.cpf == cpf &&
      other.rg == rg &&
      other.dataNascimento == dataNascimento &&
      other.celular == celular &&
      other.endereO == endereO &&
      other.cep == cep &&
      other.cidade == cidade &&
      other.estado == estado &&
      other.statusConta == statusConta;
  }

  @override
  int get hashCode {
    return idCliente.hashCode ^
      nome.hashCode ^
      email.hashCode ^
      senha.hashCode ^
      tipoUsuario.hashCode ^
      cpf.hashCode ^
      rg.hashCode ^
      dataNascimento.hashCode ^
      celular.hashCode ^
      endereO.hashCode ^
      cep.hashCode ^
      cidade.hashCode ^
      estado.hashCode ^
      statusConta.hashCode;
  }
}
