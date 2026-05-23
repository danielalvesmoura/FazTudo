import 'package:flutter_application_1/dao/servico_dao.dart';
import 'package:flutter_application_1/models/servico.dart';

class ServicoService {
  ServicoDAO servicoDAO = ServicoDAO();

  void cadastrar(Servico servico) {
    servicoDAO.insert(servico);
  }

  Future<List<Servico>> listaTodos() async {
    List<Servico> servicos = await servicoDAO.getServicos();

    if(servicos.isEmpty) return [];
    return servicos;
  }

  void update(Servico servico) {
    servicoDAO.update(servico);
  }

  void deletar(int id) {
    servicoDAO.delete(id);
  }
}