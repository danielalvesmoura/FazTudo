
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dao/subcategoria_dao.dart';
import 'package:flutter_application_1/models/subcategoria.dart';
import 'package:flutter_application_1/screens/subcategoria/form_subcategoria.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';

class TelaListaSubcategorias extends StatefulWidget {
  @override
  TelaListaSubcategoriasState createState() => TelaListaSubcategoriasState();
}

class TelaListaSubcategoriasState extends State<TelaListaSubcategorias> {
  List<Subcategoria> subcategorias = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Subcategorias",
          style: TextStyle(
            color: Color.fromARGB(255, 36, 56, 155),
            decoration: TextDecoration.none,
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        leading: BotaoVoltar(retorna: true,),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => FormSubcategoria(adicionando: true,)
          ));

          preencheLista();

        },
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 36, 56, 155),
        child: Icon(Icons.add),
      ),
      
      
    );
  }
}