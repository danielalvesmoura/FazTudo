import 'package:flutter_application_1/dao/usuario.dao.dart';

class UsuarioService {
  UsuarioDAO usuarioDAO = UsuarioDAO();

  void cadastrar(String nome, String email, String telefone, String senha) {
    usuarioDAO.insert(nome, email, telefone, senha);
  }
}