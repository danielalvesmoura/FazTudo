import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/rotas.dart';
import 'package:flutter_application_1/screens/tela_inicial.dart';
import 'package:flutter_application_1/screens/tela_conta.dart';
import 'package:flutter_application_1/screens/tela_login.dart';

main() {
  runApp(AppTeste());
}

class AppTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(), 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        Rotas.home: (context) => TelaConta(),
        Rotas.login: (context) => TelaLogin(),
        Rotas.inicial: (context) => TelaInicial(),
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
