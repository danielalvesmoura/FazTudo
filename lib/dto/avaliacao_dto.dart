class AvaliacaoDTO {
  int id;
  DateTime data;
  double nota;
  String nome;
  String descricao;
  int usuario_id;
  int servico_id;

  AvaliacaoDTO({
    required this.id,
    required this.data,
    required this.nota,
    required this.nome,
    required this.descricao,
    required this.usuario_id,
    required this.servico_id,
  });

  factory AvaliacaoDTO.fromMap(Map<String, dynamic> map) {
    print(map);
    return AvaliacaoDTO(
      id: map["id"],
      data: DateTime.parse(map["data"]),
      nota: map["nota"],
      nome: map["nome"] ?? "",
      descricao: map["descricao"],
      usuario_id: map["usuario_id"],
      servico_id: map["servico_id"],
    );
  }
}
