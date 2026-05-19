class Usuario {
  int? id;
  final String nome;
  final String email;
  final String senha;
  final String telefone;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.telefone,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map["id"],
      nome: map["nome"],
      email: map["email"],
      senha: map["senha"],
      telefone: map["telefone"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "email": email,
      "telefone": telefone
    };
  }

}
