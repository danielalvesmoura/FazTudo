import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/subcategoria.dart';
import 'package:flutter_application_1/repository/subcategoria_repository.dart';
import 'package:flutter_application_1/widgets/tela_consertos/card_subcategoria.dart';

class SubcategoriasConserto extends StatefulWidget {
  final List<Subcategoria> subcategorias;

  SubcategoriasConserto({required this.subcategorias});

  @override
  State<StatefulWidget> createState() {
    return SubcategoriasState();
  }
}

class SubcategoriasState extends State<SubcategoriasConserto> {

  SubcategoriaRepository subcategoriaRepository = SubcategoriaRepository();

  String? selecionado;

  void defineInicial() {
    if (widget.subcategorias.isNotEmpty) {
      selecionado = widget.subcategorias.first.nome;
    }
  }

  @override
  void didUpdateWidget(covariant SubcategoriasConserto oldWidget) {
    super.didUpdateWidget(oldWidget);
    defineInicial();
  }

  @override
  void initState() {
    super.initState();
    defineInicial(); 
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        for(Subcategoria subcategoria in widget.subcategorias)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CardSubcategoria(
              icone: null, 
              tamanhoIcone: 20, 
              titulo: subcategoria.nome, 
              onTap: (){
                setState(() {
                  selecionado = subcategoria.nome;
                });
              },
              selecionado: selecionado == subcategoria.nome ? true : false,
            ),
          ),
      ],
    );
  }
}