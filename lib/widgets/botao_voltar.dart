import 'package:flutter/material.dart';

class BotaoVoltar extends StatelessWidget {

  final bool? retorna;

  BotaoVoltar({this.retorna});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop(retorna);
      }, 
      icon: Icon(
        Icons.arrow_back, 
        color: Color.fromARGB(255, 36, 56, 155),
        size: 40,
      )
    );
  }
}