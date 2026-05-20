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

  Future<Usuario?> encontraPorId(int id) async {
    final db = await Conexao.instancia.banco;

    List<Map<String,dynamic>> usuario = await db.query(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
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

  Future<void> updateEmail(int id, String email) async {
    final db = await Conexao.instancia.banco;

    await db.update("usuarios", 
      {
        "email": email
      },
      where: "id = ?",
      whereArgs: [id]
    );

  }

  Future<void> updateNome(int id, String nome) async {
    final db = await Conexao.instancia.banco;

    await db.update("usuarios", 
      {
        "nome": nome
      },
      where: "id = ?",
      whereArgs: [id]
    );

  }

  Future<void> delete(int id) async {
    final db = await Conexao.instancia.banco;

    await db.delete("usuarios", 
      where: "id = ?",
      whereArgs: [id]
    );

  }
}