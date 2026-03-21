// String ler(String rotulo) {
//   print(rotulo);
//   var resposta = stdin.readLineSync();

//   if (resposta == null) {
//     print('erro');
//     exit(0);
//   } else {
//     return resposta;
//   }
// }

// class Estado {
//   final int id;
//   final String nome;
//   final String sigla;

//   Estado({required this.id, required this.nome, required this.sigla});
// }

// class Cidade {
//   final int id;
//   final String nome;
//   final Estado estado;

//   Cidade({required this.id, required this.nome, required this.estado});
// }

import 'dart:io';

//Exercício 6: Registrando um Pedido de Compra O setor de compras realizou um pedido a um fornecedor com ao menos um produto na lista de itens.
//Registre esse pedido no sistema. O pedido deve poder ser efetivado ao final. Exiba o nome do fornecedor e os produtos e execute a compra.
// main() {
//   var pedido = PedidoCompra(
//     Fornecedor(
//       nome,
//       cnpj,
//       endereco,
//       acaoFornecedor: acaoFornecedor
//     ),
//     itens: itens,
//     realizarCompra: realizarCompra
//   )
// }

// Classe de País
class Pais {
  String nome;
  Pais({required this.nome});
}

// Classe de Estado
class Estado {
  String nome;
  Pais pais;
  Estado({required this.nome, required this.pais});
}

// Classe de Cidade
class Cidade {
  String nome;
  Estado estado;
  Cidade({required this.nome, required this.estado});
}

// Classe de Endereco
class Endereco {
  String rua;
  String cep;
  Cidade cidade;
  Endereco({required this.rua, required this.cep, required this.cidade});
}

// Classe de Fornecedor
class Fornecedor {
  String nome;
  String cnpj;
  Endereco endereco;
  void Function() acaoFornecedor;

  Fornecedor(
    this.nome,
    this.cnpj,
    this.endereco, {
    required this.acaoFornecedor,
  });
}

// Classe de Funcionario
class Funcionario {
  String nome;
  String cargo;
  double salario;
  void Function(String) calculaSalarioBonus;

  Funcionario(
    this.nome,
    this.cargo,
    this.salario, {
    required this.calculaSalarioBonus,
  });
}

// Classe de Departamento
class Departamento {
  String nome;
  Funcionario gerente;
  void Function() acaoDepartamento;
  List<Funcionario> funcionarios;

  Departamento(
    this.nome,
    this.gerente, {
    required this.acaoDepartamento,
    required this.funcionarios,
  });
}

// Classe de Cliente
class Cliente {
  String nome;
  Endereco endereco;
  void Function() atualizarEndereco;

  Cliente(this.nome, {required this.endereco, required this.atualizarEndereco});
}

// Classe de Pedido de Venda
class PedidoVenda {
  Cliente cliente;
  List<ItemVenda> itens;
  void Function() concluirVenda;

  PedidoVenda(this.cliente, {required this.itens, required this.concluirVenda});
}

// Classe de Pedido de Compra
class PedidoCompra {
  Fornecedor fornecedor;
  List<ItemCompra> itens;
  void Function() realizarCompra;

  PedidoCompra(
    this.fornecedor, {
    required this.itens,
    required this.realizarCompra,
  });
}

// Classe de Tipo de Produto
class TipoProduto {
  String descricao;
  void Function() exibirTipo;

  TipoProduto(this.descricao, {required this.exibirTipo});
}

// Classe de Categoria de Produto
class CategoriaProduto {
  String nome;
  String descricao;
  void Function() exibirCategoria;

  CategoriaProduto(this.nome, this.descricao, {required this.exibirCategoria});
}

// Classe de Unidade de Medida
class UnidadeMedida {
  String nome;
  String simbolo;
  void Function() atualizarUnidade;

  UnidadeMedida(
    this.nome, {
    required this.simbolo,
    required this.atualizarUnidade,
  });
}

// Classe de Produto
class Produto {
  String nome;
  double preco;
  TipoProduto tipo;
  CategoriaProduto categoria;
  UnidadeMedida unidadeMedida;
  Fornecedor fornecedor;
  void Function() ajustarPreco;

  Produto(
    this.nome,
    this.preco,
    this.tipo,
    this.categoria, {
    required this.unidadeMedida,
    required this.fornecedor,
    required this.ajustarPreco,
  });
}

// Classe de ProdutoEstoque
class ProdutoEstoque {
  Produto produto;
  int quantidade;
  void Function() ajustarEstoque;
  DateTime dataAtualizacao;

  ProdutoEstoque(
    this.produto,
    this.quantidade, {
    required this.ajustarEstoque,
    required this.dataAtualizacao,
  });
}

// Classe de PrecoProduto
class PrecoProduto {
  Produto produto;
  double precoVenda;
  double precoCusto;
  double margemLucro;
  void Function() calcularMargemLucro;

  PrecoProduto(
    this.produto,
    this.precoVenda,
    this.precoCusto,
    this.margemLucro, {
    required this.calcularMargemLucro,
  });
}

// Classe de HistoricoPreco
class HistoricoPreco {
  Produto produto;
  DateTime dataAlteracao;
  double precoAntigo;
  double precoNovo;
  void Function() registrarAlteracao;

  HistoricoPreco(
    this.produto,
    this.dataAlteracao,
    this.precoAntigo,
    this.precoNovo, {
    required this.registrarAlteracao,
  });
}

// Classe de ProdutoDesconto
class ProdutoDesconto {
  Produto produto;
  double percentualDesconto;
  DateTime dataInicio;
  DateTime dataFim;
  void Function() aplicarDesconto;

  ProdutoDesconto(
    this.produto,
    this.percentualDesconto,
    this.dataInicio,
    this.dataFim, {
    required this.aplicarDesconto,
  });
}

// Classe de ProdutoLote
class ProdutoLote {
  Produto produto;
  String numeroLote;
  DateTime dataFabricacao;
  DateTime dataValidade;
  void Function() verificarLote;

  ProdutoLote(
    this.produto,
    this.numeroLote,
    this.dataFabricacao,
    this.dataValidade, {
    required this.verificarLote,
  });
}

// Classe de ProdutoLocalizacao
class ProdutoLocalizacao {
  Produto produto;
  String corredor;
  String prateleira;
  void Function() atualizarLocalizacao;

  ProdutoLocalizacao(
    this.produto,
    this.corredor,
    this.prateleira, {
    required this.atualizarLocalizacao,
  });
}

// Classe de ProdutoObservacao
class ProdutoObservacao {
  Produto produto;
  String observacao;
  void Function() registrarObservacao;

  ProdutoObservacao(
    this.produto,
    this.observacao, {
    required this.registrarObservacao,
  });
}

// Classe de GarantiaProduto
class GarantiaProduto {
  Produto produto;
  int anosGarantia;
  String tipoGarantia;
  void Function() ativarGarantia;

  GarantiaProduto(
    this.produto,
    this.anosGarantia,
    this.tipoGarantia, {
    required this.ativarGarantia,
  });
}

// Classe de ProdutoDisponibilidade
class ProdutoDisponibilidade {
  Produto produto;
  bool disponivel;
  String status;
  void Function() atualizarStatus;

  ProdutoDisponibilidade(
    this.produto,
    this.disponivel,
    this.status, {
    required this.atualizarStatus,
  });
}

// Classe de AvaliacaoProduto
class AvaliacaoProduto {
  Produto produto;
  int numeroEstrelas;
  String comentario;
  void Function() registrarAvaliacao;

  AvaliacaoProduto(
    this.produto,
    this.numeroEstrelas,
    this.comentario, {
    required this.registrarAvaliacao,
  });
}

// Classe de ImagemProduto
class ImagemProduto {
  Produto produto;
  String urlImagem;
  void Function() exibirImagem;

  ImagemProduto(
    this.produto, {
    required this.urlImagem,
    required this.exibirImagem,
  });
}

// Classe de TamanhoProduto
class TamanhoProduto {
  Produto produto;
  String tamanho;
  void Function() atualizarTamanho;

  TamanhoProduto(
    this.produto, {
    required this.tamanho,
    required this.atualizarTamanho,
  });
}

// Classe de CorProduto
class CorProduto {
  Produto produto;
  String cor;
  void Function() alterarCor;

  CorProduto(this.produto, {required this.cor, required this.alterarCor});
}

// Classe de PesoProduto
class PesoProduto {
  Produto produto;
  double peso;
  void Function() atualizarPeso;

  PesoProduto(this.produto, {required this.peso, required this.atualizarPeso});
}

// Classe de VolumeProduto
class VolumeProduto {
  Produto produto;
  double volume;
  void Function() ajustarVolume;

  VolumeProduto(
    this.produto, {
    required this.volume,
    required this.ajustarVolume,
  });
}

// Classe de EmbalagemProduto
class EmbalagemProduto {
  Produto produto;
  String tipoEmbalagem;
  double pesoEmbalagem;
  void Function() alterarEmbalagem;

  EmbalagemProduto(
    this.produto, {
    required this.tipoEmbalagem,
    required this.pesoEmbalagem,
    required this.alterarEmbalagem,
  });
}

// Classe de Estoque
class Estoque {
  Produto produto;
  int quantidade;
  void Function() atualizarEstoque;

  Estoque(this.produto, this.quantidade, {required this.atualizarEstoque});
}

// Classe de Venda
class Venda {
  Cliente cliente;
  List<ItemVenda> itens;
  DateTime dataVenda;
  void Function() registrarVenda;

  Venda(
    this.cliente,
    this.dataVenda, {
    required this.itens,
    required this.registrarVenda,
  });
}

// Classe de Compra
class Compra {
  Fornecedor fornecedor;
  List<ItemCompra> itens;
  DateTime dataCompra;
  void Function() registrarCompra;

  Compra(
    this.fornecedor,
    this.dataCompra, {
    required this.itens,
    required this.registrarCompra,
  });
}

// Classe de CompraLote
class CompraLote {
  Compra compra;
  String numeroLote;
  DateTime dataEntrega;
  void Function() verificarLoteCompra;

  CompraLote(
    this.compra,
    this.numeroLote,
    this.dataEntrega, {
    required this.verificarLoteCompra,
  });
}

// Classe de PedidoVendaEntrega
class PedidoVendaEntrega {
  PedidoVenda pedidoVenda;
  DateTime dataEntrega;
  Endereco enderecoEntrega;
  void Function() organizarEntrega;

  PedidoVendaEntrega(
    this.pedidoVenda,
    this.dataEntrega,
    this.enderecoEntrega, {
    required this.organizarEntrega,
  });
}

// Classe de PedidoCompraFrete
class PedidoCompraFrete {
  PedidoCompra pedidoCompra;
  double valorFrete;
  DateTime dataEnvio;
  void Function() calcularFrete;

  PedidoCompraFrete(
    this.pedidoCompra,
    this.valorFrete,
    this.dataEnvio, {
    required this.calcularFrete,
  });
}

// Classe de PedidoCompraPagamento
class PedidoCompraPagamento {
  PedidoCompra pedidoCompra;
  double valorPago;
  DateTime dataPagamento;
  void Function() realizarPagamentoCompra;

  PedidoCompraPagamento(
    this.pedidoCompra,
    this.valorPago,
    this.dataPagamento, {
    required this.realizarPagamentoCompra,
  });
}

// Classe de PedidoVendaDesconto
class PedidoVendaDesconto {
  PedidoVenda pedidoVenda;
  double percentualDesconto;
  void Function() aplicarDesconto;

  PedidoVendaDesconto(
    this.pedidoVenda,
    this.percentualDesconto, {
    required this.aplicarDesconto,
  });
}

// Classe de FornecedorCondicaoPagamento
class FornecedorCondicaoPagamento {
  Fornecedor fornecedor;
  int numeroParcelas;
  double valorParcela;
  void Function() registrarCondicao;

  FornecedorCondicaoPagamento(
    this.fornecedor,
    this.numeroParcelas,
    this.valorParcela, {
    required this.registrarCondicao,
  });
}

// Classe de PedidoCompraAtraso
class PedidoCompraAtraso {
  PedidoCompra pedidoCompra;
  DateTime dataPrevisao;
  DateTime dataReal;
  void Function() verificarAtraso;

  PedidoCompraAtraso(
    this.pedidoCompra,
    this.dataPrevisao,
    this.dataReal, {
    required this.verificarAtraso,
  });
}

// Classe de PedidoVendaFreteExpresso
class PedidoVendaFreteExpresso {
  PedidoVenda pedidoVenda;
  double taxaExpresso;
  DateTime prazoEntrega;
  void Function() calcularFreteExpresso;

  PedidoVendaFreteExpresso(
    this.pedidoVenda,
    this.taxaExpresso,
    this.prazoEntrega, {
    required this.calcularFreteExpresso,
  });
}

// Classe de ProdutoRestricaoIdade
class ProdutoRestricaoIdade {
  Produto produto;
  int idadeMinima;
  void Function() verificarRestricao;

  ProdutoRestricaoIdade(
    this.produto,
    this.idadeMinima, {
    required this.verificarRestricao,
  });
}

// Classe de ClientePreferencias
class ClientePreferencias {
  Cliente cliente;
  List<String> categoriasFavoritas;
  List<String> metodosPagamento;
  void Function() atualizarPreferencias;

  ClientePreferencias(
    this.cliente, {
    required this.categoriasFavoritas,
    required this.metodosPagamento,
    required this.atualizarPreferencias,
  });
}

// Classe Armazem
class Armazem {
  String nome;
  Endereco endereco;

  Armazem({required this.nome, required this.endereco});
}

// Classe ArmazemEstoque
class ArmazemEstoque {
  Armazem armazem;
  List<ProdutoEstoque> produtosEstoque;
  List<Map<String, dynamic>> historicoAlteracoes;

  ArmazemEstoque({
    required this.armazem,
    required this.produtosEstoque,
    required this.historicoAlteracoes,
  });
}

// Classe Empresa
class Empresa {
  String nome;
  Endereco endereco;
  List<Departamento> departamentos;

  Empresa({
    required this.nome,
    required this.endereco,
    required this.departamentos,
  });
}

// Classe FolhaPagamento
class FolhaPagamento {
  Empresa empresa;
  DateTime dataPagamento;

  FolhaPagamento({required this.empresa, required this.dataPagamento});

  double calcularFolhaPagamento() {
    double total = 0;
    for (var departamento in empresa.departamentos) {
      for (var funcionario in departamento.funcionarios) {
        total += funcionario.salario;
      }
    }
    return total;
  }
}

// Classe RotaEntrega
class RotaEntrega {
  Endereco origem;
  Endereco destino;
  double distancia;

  double calcularFrete() {
    return distancia * 10;
  }

  RotaEntrega({
    required this.origem,
    required this.destino,
    required this.distancia,
  });
}

// Classe SistemaIntegrado
class SistemaIntegrado {
  List<Compra> compras;
  List<Venda> vendas;
  ArmazemEstoque armazemEstoque;
  RotaEntrega rotaEntrega;

  SistemaIntegrado({
    required this.compras,
    required this.vendas,
    required this.armazemEstoque,
    required this.rotaEntrega,
  });
}

// Classe ItemVenda
class ItemVenda {
  Produto produto;
  int quantidade;
  double precoUnitario;

  ItemVenda({
    required this.produto,
    required this.quantidade,
    required this.precoUnitario,
  });
}

// Classe ItemCompra
class ItemCompra {
  Produto produto;
  int quantidade;
  double precoUnitario;

  ItemCompra({
    required this.produto,
    required this.quantidade,
    required this.precoUnitario,
  });
}

// Classe Telefone
class Telefone {
  String ddd;
  String numero;

  Telefone(this.ddd, this.numero);
}

// Classe Dimensao
class Dimensao {
  double largura;
  double altura;
  double profundidade;

  Dimensao(this.largura, this.altura, this.profundidade);
}

// Classe Periodo
class Periodo {
  DateTime inicio;
  DateTime fim;

  Periodo(this.inicio, this.fim);
}
