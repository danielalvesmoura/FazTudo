import 'package:flutter_application_1/dao/usuario_dao.dart';
import 'package:flutter_application_1/models/usuario.dart';

class UsuarioRepository {
  UsuarioDAO usuarioDAO = UsuarioDAO();

  void cadastrar(String nome, String email, String telefone, String senha) {
    usuarioDAO.insert(nome, email, telefone, senha);
  }

  Future<Usuario> encontraPorId(int id) async {
    return await usuarioDAO.encontraPorId(id);
  }

  Future<Usuario?> encontraPorEmail(String email) async {
    return await usuarioDAO.encontraPorEmail(email);
  }

  

  Future<String> retornaNome(int id) async {
    return await usuarioDAO.retornaNome(id);
  }

  trocaSenha(int id, String senha) {
    usuarioDAO.updateSenha(id, senha);
  }

  trocaEmail(int id, String email) {
    usuarioDAO.updateEmail(id, email);
  }

  trocaNome(int id, String nome) {
    usuarioDAO.updateNome(id, nome);
  }

  deletar(int id) {
    usuarioDAO.delete(id);
  }
}