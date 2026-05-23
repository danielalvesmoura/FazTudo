class Subcategoria {
  int? id;
  String nome;

  Subcategoria({
    this.id,
    required this.nome
  });

  factory Subcategoria.fromMap(Map<String, dynamic> map) {
    return Subcategoria(
      id: map["id"],
      nome: map["nome"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome
    };
  }
}