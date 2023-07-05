class Aluno {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  int? mensalidade;
  String? senha;
  bool? situacao;
  String? observacao;

  Aluno(
      {this.id,
      this.nome,
      this.email,
      this.telefone,
      this.mensalidade,
      this.senha,
      this.situacao,
      this.observacao});

  Aluno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
    mensalidade = json['mensalidade'];
    senha = json['senha'];
    situacao = json['situacao'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['telefone'] = telefone;
    data['mensalidade'] = mensalidade;
    data['senha'] = senha;
    data['situacao'] = situacao;
    data['observacao'] = observacao;
    return data;
  }
}
