import 'package:flutter/material.dart';

class TelaTeste extends StatefulWidget {
  @override
  TelaTesteState createState() => TelaTesteState();
}

class TelaTesteState extends State<TelaTeste> {
  final emailController = TextEditingController();

  String emailMensagem = '';

  void valida() {
    setState(() {
      if(!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(emailController.text)) {
        emailMensagem = 'Email inválido';
      } else {
        emailMensagem = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Cadastro',
            style: TextStyle(
              fontSize: 50
            )
          ),
        ),

        SizedBox(height: 40,),

        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'exemplo@email.com'
          ),
          controller: emailController

        ),
        SizedBox(height: 10,),
        Text(
          emailMensagem,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red
          )
        ),

        SizedBox(height: 40,),

        InkWell(
          onTap: valida,
          child: Container(
            decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide()),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Criar conta',
                style: TextStyle(
                  fontSize: 30,
                )
              ),
            ),
          ),
        )
        
      ],
    );
  }
}

