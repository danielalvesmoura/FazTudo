import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/rotas.dart';
import 'package:flutter_application_1/screens/tela_home.dart';
import 'package:flutter_application_1/screens/tela_inicial.dart';
import 'package:flutter_application_1/screens/tela_login.dart';
import 'package:flutter_application_1/screens/tela_consertos.dart';

main() {
  runApp(AppTeste());
}

class AppTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter'
      ),
      routes: {
        Rotas.inicial: (context) => TelaInicial(),
        Rotas.login: (context) => TelaLogin(),
        Rotas.home: (context) => TelaHome(),
        Rotas.consertos: (context) => TelaConsertos(),
      }
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return TelaLogin();
  }
}
