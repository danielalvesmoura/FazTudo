import 'package:flutter_application_1/dto/avaliacao_dto.dart';

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

  factory Avaliacao.fromDTO(AvaliacaoDTO avaliacao) {
    return Avaliacao(
      id: avaliacao.id,
      nota: avaliacao.nota,
      descricao: avaliacao.descricao,
      servico_id: avaliacao.servico_id,
      usuario_id: avaliacao.usuario_id,
      data: avaliacao.data.toIso8601String(),
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