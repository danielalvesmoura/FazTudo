import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/rotas.dart';
import 'package:flutter_application_1/screens/cadastro_servico/tela_cadastro_servico.dart';
import 'package:flutter_application_1/screens/tela_home.dart';
import 'package:flutter_application_1/screens/tela_inicial.dart';
import 'package:flutter_application_1/screens/tela_login.dart';
import 'package:flutter_application_1/screens/tela_consertos.dart';
import 'package:flutter_application_1/screens/tela_signup.dart';
import 'package:flutter_application_1/screens/tela_teste.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 140, 255)),
        fontFamily: 'Inter'
      ),
      routes: {
        Rotas.inicial: (context) => TelaInicial(),
        Rotas.cadastro: (context) => TelaSignup(),
        Rotas.login: (context) => TelaLogin(),
        Rotas.home: (context) => TelaHome(),
        Rotas.novoServico: (context) => TelaCadastroServico(),
        Rotas.consertos: (context) => TelaConsertos(),
      }
    );
  }
}

