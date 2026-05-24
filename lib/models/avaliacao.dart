class Avaliacao {
  int? id;
  double nota;
  String descricao;
  int servico_id;
  int usuario_id;
  String data;

  Avaliacao({
    this.id,
    required this.nota,
    required this.descricao,
    required this.servico_id,
    required this.usuario_id,
    required this.data
  });

  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      id: map["id"],
      nota: map["nota"],
      descricao: map["descricao"],
      servico_id: map["servico_id"],
      usuario_id: map["usuario_id"],
      data: map["data"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nota": nota,
      "descricao": descricao,
      "servico_id": servico_id,
      "usuario_id": usuario_id,
      "data": data
    };
  }
}