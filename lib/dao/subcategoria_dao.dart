import 'package:flutter_application_1/database/conexao.dart';
import 'package:flutter_application_1/models/subcategoria.dart';
import 'package:flutter_application_1/models/usuario.dart';

class SubcategoriaDAO {
  Future<void> insert(String nome) async {
    final db = await Conexao.instancia.banco;

    await db.insert("subcategorias",{
      "nome": nome,
    });
  }

  Future<List<Subcategoria>> getSubcategorias() async {
    final db = await Conexao.instancia.banco;

    List<Map<String,dynamic>> subcategorias = await db.query("subcategorias");

    List<Subcategoria> lista = subcategorias.map((map) => Subcategoria.fromMap(map)).toList();

    if(lista.isEmpty) return [];
    return lista;
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

  Future<void> update(int id, String nome) async {
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