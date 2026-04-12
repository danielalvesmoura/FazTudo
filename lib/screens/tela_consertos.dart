import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/servico.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/tela_consertos/card_subcategoria.dart';
import 'package:flutter_application_1/widgets/tela_consertos/card_oferta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class TelaConsertos extends StatelessWidget {
  final consertos = [
    Servico(
      url: 'img/encanamento.png',
      titulo: 'Revisão e Conserto de Encanamento',
      preco: 100.00,
      descricao: 'Serviço profissional de revisão e conserto de encanamento, garantindo soluções rápidas e eficientes para vazamentos, entupimentos...',
      pessoa: 'mario_332'
    ),

    Servico(
      url: 'img/mecanica.png',
      titulo: 'Troca de Óleo e Pneus',
      preco: 100.00,
      descricao: 'Seu carro merece cuidado de verdade! 🚗💨Fazemos troca de óleo e pneus rapidinho e sem complicação. Peças de qualidade e serviço...',
      pessoa: 'Larissa-Oficial1'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false, 
        title: Row(
          children: [

            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios, 
                size: 30, 
                color: Color.fromARGB(255, 36, 56, 155)
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text( 
                'Consertos',
                style: TextStyle(
                  color: Color.fromARGB(255, 36, 56, 155),
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  fontWeight: FontWeight.w900
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [

          SizedBox(width: 10,),

          IconButton(
            icon: Icon(Icons.notifications, color: Color.fromARGB(255, 36, 56, 155), size: 35),
            onPressed: () {},
          ),
          
          IconButton(
            icon: Icon(Icons.menu, color: Color.fromARGB(255, 36, 56, 155), size: 40),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
        
              SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text.rich(
                  TextSpan(
                    text: 'Resolva tudo',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                      height: 1.2,
                      fontSize: 50,
                    ),
                    children: [
                      TextSpan(
                        text: ' num instante.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 36, 56, 155),
                          fontStyle: FontStyle.italic
                        )
                      ),
                    ]
                  )
                ),
              ),
        
              SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Profissionais verificados e prontos para atender suas necessidades domésticas com garantia e segurança.',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 75, 75, 75),
                    height: 1.6,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
        
              SizedBox(height: 20),
        
              TextField(
                decoration: InputDecoration(
                  hintText: 'O que você precisa consertar hoje?',
                  prefixIcon: Icon(Icons.search),
        
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 218, 218, 218),
                    ),
                  ),
        
                  enabledBorder: InputBorder.none
        
                ),
              ),
        
              SizedBox(height: 40),
        
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Subcategorias()
              ),
        
              SizedBox(height: 60),

              SizedBox(
                height: 650,
                child: ListView.builder(
                  itemCount: consertos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CardOferta(
                          urlImagem: consertos[index].url, 
                          titulo: consertos[index].titulo, 
                          preco: 'R\$ ${consertos[index].preco},00 / hora', 
                          descricao: consertos[index].descricao, 
                          usuario: consertos[index].pessoa
                        ),
                        SizedBox(height: 60)
                      ],
                    );
                  },
                ),
              ),
            ]
          )
        ),
        
      )
    );
  }
}

class Subcategorias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubcategoriasState();
  }
}

enum SubcategoriasEnum { todos, eletrico, encanamento, mecanico, alvenaria, eletronico}

class SubcategoriasState extends State<Subcategorias> {
  SubcategoriasEnum selecionado = SubcategoriasEnum.todos;

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
              selecionado = SubcategoriasEnum.todos;
            });
          },
          selecionado: selecionado == SubcategoriasEnum.todos ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.flash_on, 
          tamanhoIcone: 20, 
          titulo: 'Elétrico', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasEnum.eletrico;
            });
          },
          selecionado: selecionado == SubcategoriasEnum.eletrico ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.water_drop, 
          tamanhoIcone: 20, 
          titulo: 'Encanamento', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasEnum.encanamento;
            });
          },
          selecionado: selecionado == SubcategoriasEnum.encanamento ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.build, 
          tamanhoIcone: 20, 
          titulo: 'Mecânico', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasEnum.mecanico;
            });
          },
          selecionado: selecionado == SubcategoriasEnum.mecanico ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.handyman, 
          tamanhoIcone: 20, 
          titulo: 'Alvenaria', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasEnum.alvenaria;
            });
          },
          selecionado: selecionado == SubcategoriasEnum.alvenaria ? true : false,
        ),

        SizedBox(width: 10),

        CardSubcategoria(
          icone: Icons.computer, 
          tamanhoIcone: 20, 
          titulo: 'Eletrônico', 
          onTap: (){
            setState(() {
              selecionado = SubcategoriasEnum.eletronico;
            });
          },
          selecionado: selecionado == SubcategoriasEnum.eletronico ? true : false,
        ),
      ],
    );
  }
}
