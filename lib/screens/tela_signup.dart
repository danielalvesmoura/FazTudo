import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_application_1/widgets/campo_senha.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';
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
                  fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: tela == Tela.escolher ? 20 : 0),

              subtitulo(tela),

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

Widget subtitulo(Tela tela) {
  switch (tela) {
    case Tela.escolher:
      return Text(
        'Começe sua jornada hoje mesmo.',
        style: TextStyle(
          color: const Color.fromARGB(255, 75, 75, 75),
          decoration: TextDecoration.none,
          fontSize: 22,
          fontWeight: FontWeight.w400
        ),
        textAlign: TextAlign.center,
      );
    
    case Tela.email:
      return SizedBox();
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
            fontWeight: FontWeight.w800
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () => aoTrocarTela(Tela.escolher), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back, size: 30, color: Color.fromARGB(255, 36, 56, 155)),
              SizedBox(width: 10,),
              Text(
                'Escolher outra forma de cadastro',
                style: TextStyle(
                  color: Color.fromARGB(255, 36, 56, 155),
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),

        SizedBox(height: 30,),

        Campo(
          label: 'NOME COMPLETO',
          hint: 'Ex: João Silva',
          icon: Icons.person_outline
        ),

        SizedBox(height: 20,),

        Campo(
          label: 'E-MAIL',
          hint: 'seu@email.com',
          icon: Icons.email_outlined
        ),

        SizedBox(height: 20,),

        Campo(
          label: 'TELEFONE',
          hint: '(44) 99999-9999',
          icon: Icons.phone_outlined
        ),

        SizedBox(height: 20,),

        CampoSenha(
          label: 'SENHA',
          hint: '••••••••',
          icon: Icons.lock_outline_rounded
        ),

        SizedBox(height: 30,),

        Row(
          children: [
            CheckBox(),
            SizedBox(width: 10,),
            SizedBox(
              width: 380,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 20,height: 1.5),
                  children: [
                    TextSpan(text: "Eu aceito os "),
                    TextSpan(
                      text: "Termos de Serviço", 
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 56, 155),
                        fontWeight: FontWeight.w900
                      ),
                      recognizer: TapGestureRecognizer()
                    ),
                    TextSpan(text: " e a "),
                    TextSpan(
                      text: "Política de Privacidade",
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 56, 155),
                        fontWeight: FontWeight.w900
                      ),
                      recognizer: TapGestureRecognizer()
                    ),
                    TextSpan(text: "."),
                  ]
                )
              ),
            ),
          ],
        ),

        SizedBox(height: 40,),

        Botao(
          width: double.infinity, 
          height: 80, 
          texto: 'Criar conta', 
          fontSize: 20,
          onPressed: () => Navigator.of(context).pushNamed(Rotas.home),
          corTexto: Colors.white,
          corFundo: const Color.fromARGB(255, 36, 56, 155),
          borda: false
        )
      ],
    );
  }
}