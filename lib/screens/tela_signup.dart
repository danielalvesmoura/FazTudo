import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/screens/rotas.dart';

enum Tela { escolher, email }

class TelaSignup extends StatefulWidget {
  @override
  TelaSignupState createState() => TelaSignupState();
}

class TelaSignupState extends State<TelaSignup> {
  Tela tela = Tela.escolher;

  void trocarTela(tela) {
    setState(() {
      this.tela = tela;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back, 
            color: Color.fromARGB(255, 36, 56, 155),
            size: 40,
          )
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30
          ),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: Logo(
                  tamanho: 50, 
                  mainAxisAlignment: MainAxisAlignment.center,
                  corIcone: Color.fromARGB(255, 36, 56, 155),
                  corTexto: Color.fromARGB(255, 36, 56, 155),
                ),
              ),

              SizedBox(height: tela == Tela.escolher ? 50 : 0),

              Text(
                'Crie sua conta',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 60,
                  fontWeight: FontWeight(700)
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Começe sua jornada hoje mesmo.',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight(400)
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: tela == Tela.escolher ? 80 : 20),

              escolha(tela, trocarTela)

            ]         
          ),
        )
      )
    );
  }
}

Widget escolha(Tela tela, Function(Tela) trocarTela) {
  switch (tela) {
    case Tela.escolher:
      return Escolhas(aoTrocarTela: trocarTela,);

    case Tela.email:
      return Email(aoTrocarTela: trocarTela,);
  }
}


class Escolhas extends StatelessWidget {
  Function(Tela) aoTrocarTela;

  Escolhas({required this.aoTrocarTela});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Escolha uma forma de cadastro:',
          style: TextStyle(
            color: Color.fromARGB(255, 36, 56, 155),
            decoration: TextDecoration.none,
            fontSize: 22,
            fontWeight: FontWeight(800)
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 40),

        ElevatedButton(
          onPressed: () {aoTrocarTela(Tela.email);},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            minimumSize: Size(425, 75),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
    
                children: [
                  Icon(Icons.email, size: 40),
                  SizedBox(width: 10),
                  Text(
                    'E-mail',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ],
          ) 
        ),

        SizedBox(height: 30),

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            minimumSize: Size(425, 75),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
    
                children: [
                  Image.asset('icon/icone-google.png',scale: 5,),
                  SizedBox(width: 10),
                  Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ],
          ) 
        ),

        SizedBox(height: 30),

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            minimumSize: Size(425, 75),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
    
                children: [
                  Image.asset('icon/icone-apple.png',scale: 5,),
                  SizedBox(width: 10),
                  Text(
                    'Apple',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ],
          ) 
        ),
      ],
    );
  }
}

class Email extends StatelessWidget {
  Function(Tela) aoTrocarTela;

  Email({required this.aoTrocarTela});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => aoTrocarTela(Tela.escolher), 
          child: Row(
            children: [
              Icon(Icons.arrow_back, size: 30, color: Color.fromARGB(255, 36, 56, 155)),
              SizedBox(width: 10,),
              Text(
                'Escolher outra forma de cadastro',
                style: TextStyle(
                  color: Color.fromARGB(255, 36, 56, 155),
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight(500)
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),

        SizedBox(height: 20,),

        Campo(
          label: 'NOME COMPLETO',
          hint: 'Ex: João Silva',
          icon: Icons.person_outline
        )
      ],
    );
  }
}