import 'package:flutter_application_1/dao/avaliacao_dao.dart';
import 'package:flutter_application_1/dto/avaliacaoDTO.dart';
import 'package:flutter_application_1/models/avaliacao.dart';

class AvaliacaoRepository {
  AvaliacaoDAO avaliacaoDAO = AvaliacaoDAO();

  void cadastrar(double nota, String descricao, int servico_id, int usuario_id, DateTime data) {
    Avaliacao avaliacao = Avaliacao(usuario_id: usuario_id, nota: nota, descricao: descricao, servico_id: servico_id, data: data.toIso8601String());
    avaliacaoDAO.insert(avaliacao);
  }

  Future<List<Map<String, dynamic>>?> listaTodos(int servico_id) async {
    return await avaliacaoDAO.getAvaliacoes(servico_id);
  }

  Future<List<AvaliacaoDTO>> buscaIdUsuario(int servico_id, int usuario_id) async {
    List<Map<String,dynamic>> avaliacoesEncontradas = await avaliacaoDAO.buscaIdUsuario(servico_id, usuario_id);

    return avaliacoesEncontradas.map((map) => AvaliacaoDTO.fromMap(map)).toList();
  }

  update(int id, Avaliacao avaliacao) {
    avaliacaoDAO.update(id, avaliacao);
  }

  deletar(int id) {
    avaliacaoDAO.delete(id);
  }

}