import 'package:flutter_application_1/dao/servico_dao.dart';
import 'package:flutter_application_1/dto/servicos_tela_consertos_dto.dart';
import 'package:flutter_application_1/models/servico.dart';

class ServicoRepository {
  ServicoDAO servicoDAO = ServicoDAO();

  void cadastrar(Servico servico) {
    servicoDAO.insert(servico);
  }

  Future<List<ServicoTelaConsertosDTO>> listaTodos() async {
    List<Map<String,dynamic>> servicos = await servicoDAO.getServicos();

    if(servicos.isEmpty) return [];
    return servicos.map((map) => ServicoTelaConsertosDTO.fromMap(map)).toList();
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