import 'package:flutter_application_1/dao/usuario_dao.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/sessao.dart';

class UsuarioService {
  UsuarioDAO usuarioDAO = UsuarioDAO();

  void cadastrar(String nome, String email, String telefone, String senha) {
    usuarioDAO.insert(nome, email, telefone, senha);
  }

  Future<bool> validaLogin(String email, String senha) async {
    Usuario? usuarioEncontrado = await usuarioDAO.encontraPorEmail(email);

    if(usuarioEncontrado == null) return false;

    if(usuarioEncontrado.senha == senha) {
      Sessao sessao = Sessao();
      sessao.usuarioLogado = usuarioEncontrado;
      return true;
    } else {
      return false;
    }
  }

  Future<void> trocaSenha(int id, String senha) async {
    usuarioDAO.updateSenha(id, senha);
  }

  Future<void> trocaEmail(int id, String email) async {
    usuarioDAO.updateEmail(id, email);
  }

  Future<void> trocaNome(int id, String nome) async {
    usuarioDAO.updateNome(id, nome);
  }

  Future<void> deletar(int id) async {
    usuarioDAO.delete(id);
  }
}