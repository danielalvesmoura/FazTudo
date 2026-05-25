import 'package:flutter_application_1/dao/avaliacao_dao.dart';
import 'package:flutter_application_1/dto/avaliacao_dto.dart';
import 'package:flutter_application_1/models/avaliacao.dart';
import 'package:flutter_application_1/repository/avaliacao_repository.dart';

class AvaliacaoService {
  AvaliacaoRepository avaliacaoRepository = AvaliacaoRepository();

  Future<bool> usuarioJaAvaliou(int servico_id, int usuario_id) async {

    List<AvaliacaoDTO> avaliacoesEncontradas = await avaliacaoRepository.buscaIdUsuario(servico_id, usuario_id);
    
    if(!avaliacoesEncontradas.isEmpty) return true;
    return false;
  }

  
}