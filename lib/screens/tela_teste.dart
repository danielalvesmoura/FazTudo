import 'package:flutter/material.dart';

class TelaTeste extends StatefulWidget {
  @override
  TelaTesteState createState() => TelaTesteState();
}

class TelaTesteState extends State<TelaTeste> {
  int telaAtual = 1;

  void trocaTela() {
    setState(() {
      telaAtual == 1 ? telaAtual = 2 : telaAtual = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Titulo', style: TextStyle(fontSize: 50)),
            SizedBox(height: 50),
            defineTela(telaAtual, trocaTela)
          ],
        ),
      ),
    );
  }
}

Widget defineTela(int telaAtual, Function() trocaTela) {
  if (telaAtual == 1) {
    return Tela1(trocaTela: trocaTela);
  } else {
    return Tela2(trocaTela: trocaTela);
  }
}

class Tela1 extends StatelessWidget {
  Function() trocaTela;

  Tela1({required this.trocaTela});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Tela 1', style: TextStyle(fontSize: 50)),
        IconButton(
          onPressed: () {
            trocaTela();
          },
          icon: Icon(Icons.arrow_forward, color: Colors.black, size: 50),
        ),
      ],
    );
  }
}

class Tela2 extends StatelessWidget {
  Function() trocaTela;

  Tela2({required this.trocaTela});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Tela 2', style: TextStyle(fontSize: 50)),
        IconButton(
          onPressed: () {
            trocaTela();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 50),
        ),
      ],
    );
  }
}
