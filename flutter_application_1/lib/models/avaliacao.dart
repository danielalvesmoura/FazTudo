class Avaliacao {
  final String id;
  final String servicoId;
  final String clienteId;
  final String prestadorId;
  final int nota;
  final String comentario;
  final DateTime dataCriacao;

  Avaliacao({
    required this.id,
    required this.servicoId,
    required this.clienteId,
    required this.prestadorId,
    required this.nota,
    required this.comentario,
    required this.dataCriacao,
  });
}
