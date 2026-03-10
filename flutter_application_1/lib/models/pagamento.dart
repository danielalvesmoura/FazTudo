class Pagamento {
  final String id;
  final String pedidoId;
  final double valor;
  final String metodo;
  final String status;
  final DateTime dataCriacao;

  Pagamento({
    required this.id,
    required this.pedidoId,
    required this.valor,
    required this.metodo,
    required this.status,
    required this.dataCriacao,
  });
}
