import 'package:flutter_application_1/dao/usuario_dao.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/repository/usuario_repository.dart';
import 'package:flutter_application_1/sessao.dart';

class UsuarioService {
  UsuarioRepository usuarioRepository = UsuarioRepository();

  Future<bool> validaLogin(String email, String senha) async {
    Usuario? usuarioEncontrado = await usuarioRepository.encontraPorEmail(email);

    if(usuarioEncontrado == null) return false;

    if(usuarioEncontrado.senha == senha) {
      Sessao sessao = Sessao();
      sessao.usuarioLogado = usuarioEncontrado;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> emailExistente(String email) async {
    if(await usuarioRepository.encontraPorEmail(email) != null) return true;
    return false;
  }
}