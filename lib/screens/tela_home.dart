import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/tela_dashboard.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/tela_home/card_categoria.dart';
import 'package:flutter_application_1/widgets/tela_home/card_navbar.dart';
import 'package:flutter_application_1/screens/rotas.dart';

class TelaHome extends StatefulWidget {
  @override
  TelaHomeState createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome> {
  // int _selecionadoIndex = 0;

  // void trocaTela(index) {
  //   setState(() {
  //     _selecionadoIndex = index;
  //   });
  // }

  // List<Widget> paginas = [
  //   PaginaDashboard(
  //     onTapConserto: () => trocaTela(3),
  //     onTapLimpeza: () {},
  //     onTapBeleza: () {},
  //     onTapTransporte: () {},
  //     onTapAlimentacao: () {},
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            onPressed: () {
              Navigator.pop(context);
            }
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: PaginaDashboard(),
        ),
      ),

      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardNavbar(
              onTap: (){}, 
              icon: Icons.house, 
              size: 35, 
              titulo: 'Home', 
              selecionado: true,
            ),

            CardNavbar(
              onTap: (){}, 
              icon: Icons.settings, 
              size: 35, 
              titulo: 'Config.', 
              selecionado: false,
            ),

            CardNavbar(
              onTap: (){}, 
              icon: Icons.email, 
              size: 35, 
              titulo: 'Meus Serviços', 
              selecionado: false,
            ),

            CardNavbar(
              onTap: (){}, 
              icon: Icons.person, 
              size: 35, 
              titulo: 'Meu Perfil', 
              selecionado: false,
            )
          ],
        ),
      )
    );
  }
}

