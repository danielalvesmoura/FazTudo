import 'package:flutter_application_1/dao/usuario_dao.dart';
import 'package:flutter_application_1/models/usuario.dart';

class UsuarioService {
  UsuarioDAO usuarioDAO = UsuarioDAO();

  void cadastrar(String nome, String email, String telefone, String senha) {
    usuarioDAO.insert(nome, email, telefone, senha);
  }

  Future<bool> validaLogin(String email, String senha) async {
    Usuario? usuarioEncontrado = await usuarioDAO.encontraPorEmail(email);

    if(usuarioEncontrado == null) return false;

    if(usuarioEncontrado.senha == senha) {
      return true;
    } else {
      return false;
    }
  }
}