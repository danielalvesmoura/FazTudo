import 'package:flutter_application_1/dao/servico_dao.dart';
import 'package:flutter_application_1/models/servico.dart';

class ServicoService {
  ServicoDAO servicoDAO = ServicoDAO();

  void cadastrar(Servico servico) {
    servicoDAO.insert(servico);
  }

  Future<List<Map<String,dynamic>>> listaTodos() async {
    List<Map<String,dynamic>> servicos = await servicoDAO.getServicos();

    if(servicos.isEmpty) return [];
    return servicos;
  }

  Future<List<Servico>> listaPorUsuario(int usuario_id) async {
    List<Servico> servicos = await servicoDAO.getServicosPorUsuario(usuario_id);

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