class Servico {
  final String id;
  final String titulo;
  final String descricao;
  final double preco;
  final String prestadorId;
  final String categoriaId;
  final String imagemUrl;

  Servico({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.preco,
    required this.prestadorId,
    required this.categoriaId,
    required this.imagemUrl,
  });
}
