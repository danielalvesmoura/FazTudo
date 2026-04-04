import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/screens/rotas.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImagemTelaInicial(),

        Degrade(),

        ConteudoTelaInicial()
      ],
    );
  }
}



class ImagemTelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('img/fundo_tela_inicial.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Degrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Colors.transparent],
        ),
      ),
    );
  }
}

class ConteudoTelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          0.1 * largura, 
          0.2 * largura, 
          0.1 * largura, 
          0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(
              tamanho: 0.2 * largura,
              mainAxisAlignment: MainAxisAlignment.start,
              corIcone: Color.fromARGB(255, 0, 140, 255),
              corTexto: Colors.white,
            ),

            SizedBox(height: 0.1 * largura),

            TituloTelaInicial(),

            SizedBox(height: 0.1 * largura),

            SubtituloTelaInicial(),

            SizedBox(height: 0.15 * largura),

            BotaoCadastro(),

            SizedBox(height: 0.04 * largura),

            BotaoLogin()
          ],
        ),
      ),
    );
  }
}

class TituloTelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return Text(
      'Tudo o que você precisa em um só lugar',
      style: TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none,
        letterSpacing: 0.005 * largura,
        fontSize: 0.1 * largura
      ),
    );
  }
}

class SubtituloTelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return Text(
      'Conectamos você aos melhores profissionais da sua região para transformar sua casa com confiança e agilidade.',
      style: TextStyle(
        color: const Color.fromARGB(255, 182, 182, 182),
        decoration: TextDecoration.none,
        fontSize: 0.04 * largura,
        fontWeight: FontWeight.w100,
        height: 1.7,
      ),
    );
  }
}

class BotaoCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Rotas.cadastro);
      },
    
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 36, 56, 155),
        minimumSize: Size(largura, 0.15 * largura),
      ),

      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                'Começar agora',
                style: TextStyle(fontSize: 0.04 * largura, color: Colors.white),
              ),

              Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 0.1 * largura,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BotaoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Rotas.login);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(92, 129, 129, 129),
        minimumSize: Size(largura, 0.15 * largura),
        side: BorderSide(
          color: const Color.fromARGB(59, 255, 255, 255),
        ),
      ),
      child: Text(
        'Já tenho uma conta',
        style: TextStyle(fontSize: 0.04 * largura, color: Colors.white),
      ),
    );
  }
}