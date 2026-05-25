class ServicoTelaConsertosDTO {
  int id;
  String titulo;
  double preco;
  String descricao;
  double? avaliacao;
  int usuario_id;
  String nomeUsuario;

  ServicoTelaConsertosDTO({
    required this.id,
    required this.titulo,
    required this.preco,
    required this.descricao,
    required this.avaliacao,
    required this.usuario_id,
    required this.nomeUsuario,
  });

  factory ServicoTelaConsertosDTO.fromMap(Map<String, dynamic> map) {
    return ServicoTelaConsertosDTO(
      id: map["id"],
      titulo: map["titulo"], 
      preco: map["preco"], 
      descricao: map["descricao"], 
      avaliacao: map["avaliacao"], 
      usuario_id: map["usuario_id"],
      nomeUsuario: map["nomeUsuario"]
    );
  }
}