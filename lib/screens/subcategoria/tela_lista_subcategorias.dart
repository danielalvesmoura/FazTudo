
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dao/subcategoria_dao.dart';
import 'package:flutter_application_1/models/subcategoria.dart';
import 'package:flutter_application_1/screens/subcategoria/form_estado.dart';

class TelaListaSubcategorias extends StatefulWidget {
  @override
  TelaListaSubcategoriasState createState() => TelaListaSubcategoriasState();
}

class TelaListaSubcategoriasState extends State<TelaListaSubcategorias> {
  List<Subcategoria> subcategorias = [];
  List<Subcategoria> subcategoriasFiltradas = [];

  SubcategoriaDAO subcategoriaDao = SubcategoriaDAO();

  @override
  void initState() {
    super.initState();
    preencheLista();
  }

  Future<void> preencheLista() async {
    List<Subcategoria> resultado = await subcategoriaDao.getSubcategorias();

    subcategorias = resultado;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Lista de Estados",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontSize: 40
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            icon: Icon(Icons.arrow_back, size: 40,)
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),

            for(Subcategoria subcategoria in subcategorias)
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subcategoria.nome,
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30
                        ),
                      ),
                  
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => FormSubcategoria(adicionando: false, subcategoria: subcategoria,)
                              ));
                  
                              preencheLista();
                  
                            }, 
                            icon: Icon(Icons.edit)
                          ),
                          
                          IconButton(
                            onPressed: () {
                              subcategoriaDao.delete(subcategoria.id!);
                              preencheLista();
                            }, 
                            icon: Icon(Icons.delete_outline)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

            SizedBox(height: 20,),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FormSubcategoria(adicionando: true,)
            ));

            preencheLista();

          },
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          child: Icon(Icons.add),
        ),
      )
      
    );
  }
}