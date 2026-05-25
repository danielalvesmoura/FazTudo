import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/subcategoria.dart';
import 'package:flutter_application_1/repository/subcategoria_repository.dart';
import 'package:flutter_application_1/widgets/tela_consertos/card_subcategoria.dart';

class SubcategoriasConserto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubcategoriasState();
  }
}

enum SubcategoriasConsertoEnum { todos, eletrico, encanamento, mecanico, alvenaria, eletronico}

class SubcategoriasState extends State<SubcategoriasConserto> {
  SubcategoriasConsertoEnum selecionado = SubcategoriasConsertoEnum.todos;

  List<Subcategoria> subcategorias = [];

  SubcategoriaRepository subcategoriaRepository = SubcategoriaRepository();

  preencheLista() {
    final resultado = subcategoriaRepository.listaTodos();

    // if(resultado != null) subcategorias = resultado;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        CardSubcategoria(
          icone: null, 
          tamanhoIcone: 20, 
          titulo: 'Todos', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasConsertoEnum.todos;
            });
          },
          selecionado: selecionado == SubcategoriasConsertoEnum.todos ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.flash_on, 
          tamanhoIcone: 20, 
          titulo: 'Elétrico', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasConsertoEnum.eletrico;
            });
          },
          selecionado: selecionado == SubcategoriasConsertoEnum.eletrico ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.water_drop, 
          tamanhoIcone: 20, 
          titulo: 'Encanamento', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasConsertoEnum.encanamento;
            });
          },
          selecionado: selecionado == SubcategoriasConsertoEnum.encanamento ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.build, 
          tamanhoIcone: 20, 
          titulo: 'Mecânico', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasConsertoEnum.mecanico;
            });
          },
          selecionado: selecionado == SubcategoriasConsertoEnum.mecanico ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.handyman, 
          tamanhoIcone: 20, 
          titulo: 'Alvenaria', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasConsertoEnum.alvenaria;
            });
          },
          selecionado: selecionado == SubcategoriasConsertoEnum.alvenaria ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.computer, 
          tamanhoIcone: 20, 
          titulo: 'Eletrônico', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasConsertoEnum.eletronico;
            });
          },
          selecionado: selecionado == SubcategoriasConsertoEnum.eletronico ? true : false,
        ),
      ],
    );
  }
}