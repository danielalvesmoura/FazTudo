import 'package:flutter_application_1/database/conexao.dart';
import 'package:flutter_application_1/models/usuario.dart';

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

  Future<Usuario?> encontraPorEmail(String email) async {
    final db = await Conexao.instancia.banco;

    List<Map<String,dynamic>> usuario = await db.query(
      "usuarios",
      where: "email = ?",
      whereArgs: [email]
    );

    if(usuario.isEmpty) return null;

    return Usuario.fromMap(usuario.first);
  }

  Future<void> updateSenha(int id, String senha) async {
    final db = await Conexao.instancia.banco;

    await db.update("usuarios", 
      {
        "senha": senha
      },
      where: "id = ?",
      whereArgs: [id]
    );

  }
}