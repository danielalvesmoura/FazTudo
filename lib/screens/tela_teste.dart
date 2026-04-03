import 'package:flutter/material.dart';

class TelaTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(child: Campo()),
      ),
    );
  }
}

class Campo extends StatefulWidget {
  @override
  CampoState createState() => CampoState();
}

class CampoState extends State<Campo> {
  bool senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: senhaVisivel,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              senhaVisivel = !senhaVisivel;
            });
          }, 
          icon: Icon(
            senhaVisivel ? Icons.visibility_off : Icons.visibility
          )
        ),
      ),
    );
  }
}
