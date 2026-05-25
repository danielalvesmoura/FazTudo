import 'package:flutter_application_1/database/conexao.dart';
import 'package:flutter_application_1/dto/avaliacao_dto.dart';
import 'package:flutter_application_1/models/avaliacao.dart';

class AvaliacaoDAO {
  Future<void> insert(Avaliacao avaliacao) async {
    final db = await Conexao.instancia.banco;
    
    await db.insert("avaliacoes",avaliacao.toMap());
  }

  Future<List<AvaliacaoDTO>> getAvaliacoes(int servico_id) async {
    final db = await Conexao.instancia.banco;

    List<Map<String,dynamic>> avaliacoes = await db.rawQuery("""
      SELECT 
        avaliacoes.id, avaliacoes.nota, avaliacoes.descricao, avaliacoes.servico_id, avaliacoes.data, avaliacoes.usuario_id,
        usuarios.nome
      FROM avaliacoes 
      INNER JOIN servicos
        ON avaliacoes.servico_id = servicos.id
      INNER JOIN usuarios
        ON avaliacoes.usuario_id = usuarios.id
      WHERE servico_id = ?
      """,
      [servico_id]
    );

    if(avaliacoes.isEmpty) return [];
    return avaliacoes.map((map) => AvaliacaoDTO.fromMap(map)).toList(); 
  }

  Future<void> update(int id, Avaliacao avaliacao) async {
    final db = await Conexao.instancia.banco;

    await db.update("avaliacoes", 
      avaliacao.toMap(),
      where: "id = ?",
      whereArgs: [id]
    );

  }

  Future<void> delete(int id) async {
    final db = await Conexao.instancia.banco;

    await db.delete("avaliacoes", 
      where: "id = ?",
      whereArgs: [id]
    );

  }

  Future<List<Map<String, dynamic>>> buscaIdUsuario(int servico_id, int usuario_id) async {
    final db = await Conexao.instancia.banco;

    return await db.query("avaliacoes",
      where: "usuario_id = ? AND servico_id = ?",
      whereArgs: [usuario_id, servico_id,]
    );
  }
}