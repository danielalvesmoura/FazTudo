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

        await db.rawInsert("INSERT INTO usuarios (nome,email,telefone,senha) VALUES (?,?,?,?)",
        ['admin','admin@faztudo.com','00000000000','admin']);
      },
    );
  }
}