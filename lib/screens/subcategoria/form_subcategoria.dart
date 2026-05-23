
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dao/subcategoria_dao.dart';
import 'package:flutter_application_1/models/subcategoria.dart';

class FormSubcategoria extends StatefulWidget {
  final bool adicionando;
  final Subcategoria? subcategoria;

  FormSubcategoria({
    required this.adicionando,
    this.subcategoria
  });

  @override
  FormSubcategoriaState createState() => FormSubcategoriaState();
}

class FormSubcategoriaState extends State<FormSubcategoria> {
  SubcategoriaDAO subcategoriaDAO = SubcategoriaDAO();

  late bool adicionando;
  late Subcategoria? subcategoria;

  @override
  void initState() {
    super.initState();
    this.adicionando = widget.adicionando;
    this.subcategoria = widget.subcategoria;

    if(subcategoria != null) campoNome.text = subcategoria!.nome;
  }

  TextEditingController campoNome = TextEditingController();

  @override 
  void dispose() {
    super.dispose();
    campoNome.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          }, 
          icon: Icon(Icons.arrow_back, size: 40,color: Color.fromARGB(255, 36, 56, 155),)
        ),
        
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                adicionando ? "Nova Subcategoria" : "id: " + subcategoria!.id.toString(),
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 30
                ),
              ),

              SizedBox(height: 20,),

              Text(
                "nome",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 30
                ),
              ),

              SizedBox(
                width: 400,
                height: 100,
                child: Material(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    ),
                    controller: campoNome,
                  ),
                ),
              ),

              FilledButton(
                onPressed: () {
                  adicionando ? subcategoriaDAO.insert(campoNome.text) : subcategoriaDAO.update(subcategoria!.id!, campoNome.text);
                  Navigator.of(context).pop(true);
                }, 
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 36, 56, 155)),
                  minimumSize: WidgetStatePropertyAll(Size(500,50))
                ),
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 30
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}