class Servico {
  int? id;
  String titulo;
  double preco;
  String descricao;
  String cep;
  int usuario_id;

  Servico({
    required this.id,
    required this.titulo,
    required this.preco,
    required this.descricao,
    required this.cep,
    required this.usuario_id
  });

  factory Servico.fromMap(Map<String, dynamic> map) {
    return Servico(
      id: map["id"],
      titulo: map["titulo"], 
      preco: map["preco"], 
      descricao: map["descricao"], 
      cep: map["cep"],
      usuario_id: map["usuario_id"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "titulo": titulo,
      "preco": preco,
      "descricao": descricao,
      "cep": cep,
      "usuario_id": usuario_id
    };
  }
}