import 'package:flutter_application_1/database/conexao.dart';

class UsuarioDAO {
  Future<void> insert(String nome, String email, String telefone, String senha) async {
    final db = await Conexao.instancia.banco;

    await db.insert("usuarios",{
      "nome": nome,
      "email": email,
      "telefone": telefone,
      "senha": senha
    });
  }
}