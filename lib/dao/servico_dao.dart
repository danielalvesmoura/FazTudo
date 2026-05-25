import 'package:flutter_application_1/database/conexao.dart';
import 'package:flutter_application_1/models/servico.dart';

class ServicoDAO {
  Future<void> insert(Servico servico) async {
    final db = await Conexao.instancia.banco;

    await db.insert("servicos",servico.toMap());
  }

  Future<List<Map<String,dynamic>>> getServicos() async {
    final db = await Conexao.instancia.banco;

    List<Map<String,dynamic>> servicos = await db.rawQuery("""
      SELECT
        s.*,
        usuarios.nome As nomeUsuario, usuarios.id AS usuario_id,

        (
          SELECT AVG(a.nota)
          FROM avaliacoes a
          WHERE a.servico_id = s.id
        ) AS avaliacao

      FROM servicos s
      INNER JOIN usuarios
        ON s.usuario_id = usuarios.id
    """);


    if(servicos.isEmpty) return [];
    return servicos;
  }

  Future<List<Servico>> getServicosPorUsuario(int usuario_id) async {
    final db = await Conexao.instancia.banco;

    List<Map<String,dynamic>> servicos = await db.query("servicos",
      where: "usuario_id = ?",
      whereArgs: [usuario_id]
    );

    List<Servico> lista = servicos.map((map) => Servico.fromMap(map)).toList();

    if(lista.isEmpty) return [];
    return lista;
  }

  Future<void> update(Servico servico) async {
    final db = await Conexao.instancia.banco;

    await db.update("servicos", 
      servico.toMap(),
      where: "id = ?",
      whereArgs: [servico.id]
    );

  }

  Future<void> delete(int id) async {
    final db = await Conexao.instancia.banco;

    await db.delete("servicos", 
      where: "id = ?",
      whereArgs: [id]
    );

  }
}