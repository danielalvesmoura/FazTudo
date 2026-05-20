import 'package:flutter_application_1/dao/usuario_dao.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/sessao.dart';

class SessaoService {
  UsuarioDAO usuarioDAO = UsuarioDAO();

  Sessao sessao = Sessao();

  Future<void> atualizarUsuarioLogado() async {
    Usuario? novoUsuario = await usuarioDAO.encontraPorId(sessao.usuarioLogado!.id!);

    if(novoUsuario != null) sessao.usuarioLogado = novoUsuario;
  }
}