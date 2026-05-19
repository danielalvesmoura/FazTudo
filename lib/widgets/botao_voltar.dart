import 'package:flutter/material.dart';

class BotaoVoltar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      }, 
      icon: Icon(
        Icons.arrow_back, 
        color: Color.fromARGB(255, 36, 56, 155),
        size: 40,
      )
    );
  }
}