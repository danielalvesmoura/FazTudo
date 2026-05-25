import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';

class Conexao {
  Database? _banco;

  static Conexao instancia = Conexao();

  Future<Database> get banco async {
    if(_banco != null) return _banco!;

    _banco = await _initDatabase();
    return _banco!;
  }

  Future<Database> _initDatabase() async {
    String caminho = "faztudo.db";

    if(kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else {
      caminho = join(await getDatabasesPath(), caminho);
    }

    return await openDatabase(
      caminho,
      version: 1,
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
      onCreate:(db, version) async {
        await db.execute("""
          CREATE TABLE usuarios(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            telefone TEXT NOT NULL,
            senha TEXT NOT NULL
          )
        """);

        await db.execute("""
          CREATE TABLE subcategorias(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL
          )
        """);

        await db.execute("""
          CREATE TABLE servicos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            preco REAL NOT NULL,
            descricao TEXT NOT NULL,
            cep TEXT NOT NULL,
            usuario_id INTEGER NOT NULL,
            FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
          )
        """);

        await db.execute("""
          CREATE TABLE avaliacoes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nota REAL NOT NULL,
            descricao TEXT NOT NULL,
            data TEXT NOT NULL,
            servico_id INTEGER NOT NULL,
            usuario_id INTEGER NOT NULL,
            FOREIGN KEY (servico_id) REFERENCES servicos(id) ON DELETE CASCADE
            FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
          )
        """);

        await db.rawInsert("INSERT INTO usuarios (nome,email,telefone,senha) VALUES (?,?,?,?)",
        ['admin','admin@faztudo.com','00000000000','admin']);

        await db.rawInsert("INSERT INTO servicos (titulo,preco,descricao,cep,usuario_id) VALUES (?,?,?,?,?)",
        [
          'Revisão e Corserto de Encanamento',
          100.00,
          'Serviço profissional de revisão e conserto de encanamento, garantindo soluções rápidas e eficientes para vazamentos, entupimentos...',
          "00000-000",
          1
        ]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        await db.rawInsert("INSERT INTO avaliacoes (nota,descricao,data,servico_id,usuario_id) VALUES (?,?,?,?,?)",
        [2.2,'Muito ruim',DateTime.now().toIso8601String(),1,1]);

        final subcategorias = [
          {"nome": "Todos"},
          {"nome": "Elétrico"},
          {"nome": "Encanamento"},
          {"nome": "Mecânico"},
          {"nome": "Alvenaria"},
          {"nome": "Eletrônico"},
        ];
        
        for(final subcategoria in subcategorias) {
          await db.insert("subcategorias", 
            subcategoria
          );
        }

      },
    );
  }
}