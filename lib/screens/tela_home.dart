import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/tela_config.dart';
import 'package:flutter_application_1/screens/tela_dashboard.dart';
import 'package:flutter_application_1/screens/tela_meus_servicos.dart';
import 'package:flutter_application_1/screens/tela_teste.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/card_categoria.dart';
import 'package:flutter_application_1/widgets/tela_home/card_navbar.dart';
import 'package:flutter_application_1/screens/rotas.dart';

class TelaHome extends StatefulWidget {
  @override
  TelaHomeState createState() => TelaHomeState();
}

enum abas {home, config, servicos, perfil}

class TelaHomeState extends State<TelaHome> {
  abas selecionado = abas.home;
  int selecionadoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 249, 255, 1),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Logo(
              tamanho: 40, 
              mainAxisAlignment: MainAxisAlignment.center,
              corIcone: Color.fromARGB(255, 36, 56, 155),
              corTexto: Color.fromARGB(255, 36, 56, 155),
            ),
          ],
        ),
        actions: [
          Botao(
            width: 100, 
            height: 50, 
            texto: 'Log-out', 
            fontSize: 20,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            corTexto: Colors.white,
            corFundo: const Color.fromARGB(255, 36, 56, 155),
              borda: false
          ),

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

      body: insereAba(selecionadoIndex),
      
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardNavbar(
              onTap: (){
                setState(() {
                  selecionado = abas.home;
                  selecionadoIndex = 0;
                });
              }, 
              icon: Icons.house, 
              size: 35, 
              titulo: 'Home', 
              selecionado: selecionado == abas.home ? true : false,
            ),

            CardNavbar(
              onTap: (){
                setState(() {
                  selecionado = abas.config;
                  selecionadoIndex = 1;
                });
              }, 
              icon: Icons.settings, 
              size: 35, 
              titulo: 'Config.', 
              selecionado: selecionado == abas.config ? true : false,
            ),

            CardNavbar(
              onTap: (){
                setState(() {
                  selecionado = abas.servicos;
                  selecionadoIndex = 2;
                });
              }, 
              icon: Icons.email, 
              size: 35, 
              titulo: 'Meus Serviços', 
              selecionado: selecionado == abas.servicos ? true : false,
            ),

            CardNavbar(
              onTap: (){
                setState(() {
                  selecionado = abas.perfil;
                  selecionadoIndex = 3;
                });
              }, 
              icon: Icons.person, 
              size: 35, 
              titulo: 'Meu Perfil', 
              selecionado: selecionado == abas.perfil ? true : false,
            )
          ],
        )
      )
    );
  }
}

Widget insereAba(abaIndex) {
  switch (abaIndex) {
    case 0:
      return AbaDashboard();
    case 1:
      return TelaConfig();
    case 2:
      return TelaMeusServicos();
    case 3:
      return AbaPerfil();
    default:
      return AbaDashboard();
  }
}

class AbaConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AbaServicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AbaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaTeste();
  }
}
