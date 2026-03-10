class Pedido {
  final String id;
  final String servicoId;
  final String clienteId;
  final String prestadorId;
  final DateTime data;
  final String status;
  final double preco;

  Pedido({
    required this.id,
    required this.servicoId,
    required this.clienteId,
    required this.prestadorId,
    required this.data,
    required this.status,
    required this.preco,
  });
}
