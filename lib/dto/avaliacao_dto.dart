class AvaliacaoDTO {
  int usuario_id;

  AvaliacaoDTO({
    required this.usuario_id,
  });

  factory AvaliacaoDTO.fromMap(Map<String, dynamic> map) {
    return AvaliacaoDTO(
      usuario_id: map["usuario_id"],
    );
  }
}