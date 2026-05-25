import 'package:flutter_application_1/dao/subcategoria_dao.dart';
import 'package:flutter_application_1/models/subcategoria.dart';

class SubcategoriaRepository {
  SubcategoriaDAO subcategoriaDAO = SubcategoriaDAO();

  void cadastrar(String nome) {
    subcategoriaDAO.insert(nome);
  }

  Future<List<Subcategoria>?> listaTodos() async {
    return await subcategoriaDAO.getSubcategorias();
  }

  trocaNome(int id, String nome) {
    subcategoriaDAO.update(id, nome);
  }

  deletar(int id) {
    subcategoriaDAO.delete(id);
  }
}