import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/tela_consertos/card_subcategoria.dart';
import 'package:flutter_application_1/widgets/tela_consertos/card_oferta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TelaConsertos extends StatelessWidget {
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
                child: Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 36, 56, 155),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Todos',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  height: 1.6,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        
                    SizedBox(width: 10),
        
                    CardSubcategoria(
                      icone: Icons.flash_on, 
                      tamanhoIcone: 20, 
                      corTexto: const Color.fromARGB(255, 75, 75, 75),
                      corFundo: const Color.fromARGB(255, 209, 209, 209),
                      titulo: 'Elétrico', 
                      onTap: (){}
                    ),
        
                    SizedBox(width: 10),
        
                    CardSubcategoria(
                      icone: Icons.water_drop, 
                      tamanhoIcone: 20, 
                      corTexto: const Color.fromARGB(255, 75, 75, 75),
                      corFundo: const Color.fromARGB(255, 209, 209, 209),
                      titulo: 'Encanamento', 
                      onTap: (){}
                    ),
        
                    SizedBox(width: 10),
        
                    CardSubcategoria(
                      icone: Icons.build, 
                      tamanhoIcone: 20, 
                      corTexto: const Color.fromARGB(255, 75, 75, 75),
                      corFundo: const Color.fromARGB(255, 209, 209, 209),
                      titulo: 'Mecânico', 
                      onTap: (){}
                    ),
        
                    SizedBox(width: 10),
        
                    CardSubcategoria(
                      icone: Icons.handyman, 
                      tamanhoIcone: 20, 
                      corTexto: const Color.fromARGB(255, 75, 75, 75),
                      corFundo: const Color.fromARGB(255, 209, 209, 209),
                      titulo: 'Alvenaria', 
                      onTap: (){}
                    ),
        
                    SizedBox(width: 10),
        
                    CardSubcategoria(
                      icone: Icons.computer, 
                      tamanhoIcone: 20, 
                      corTexto: const Color.fromARGB(255, 75, 75, 75),
                      corFundo: const Color.fromARGB(255, 209, 209, 209),
                      titulo: 'Eletrônico', 
                      onTap: (){}
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 60),
        
              SingleChildScrollView(
                child: Column(
                  children: [
  
                    CardOferta(
                      urlImagem: 'img/encanamento.png', 
                      titulo: 'Revisão e Corserto de Encanamento', 
                      preco: 'R\$ 100,00 / hora', 
                      descricao: 'Serviço profissional de revisão e conserto de encanamento, garantindo soluções rápidas e eficientes para vazamentos, entupimentos...', 
                      usuario: 'mario_332'
                    ),
  
                    SizedBox(height: 60),
  
                    CardOferta(
                      urlImagem: 'img/mecanica.png', 
                      titulo: 'Troca de Óleo e Pneus', 
                      preco: 'R\$ 100,00 / hora', 
                      descricao: 'Seu carro merece cuidado de verdade! 🚗💨Fazemos troca de óleo e pneus rapidinho e sem complicação. Peças de qualidade e serviço...', 
                      usuario: 'Larissa-Oficial1'
                    )
  
                  ],
                ),
              )
            ]
          )
        ),
        
      )
    );
  }
}