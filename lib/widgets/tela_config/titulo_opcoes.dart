import 'package:flutter/material.dart';

class TituloOpcoes extends StatelessWidget {
  final String texto;

  TituloOpcoes({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        color: Color.fromARGB(255, 100, 100, 100),
        decoration: TextDecoration.none,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      textAlign: TextAlign.center,
    );
  }
}