import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/rotas.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/tela_enviar_codigo/campo_codigo.dart';

class TelaEnviarCodigo extends StatefulWidget {
  @override
  TelaEnviarCodigoState createState() => TelaEnviarCodigoState();
}

class TelaEnviarCodigoState extends State<TelaEnviarCodigo> {
  TextEditingController campo1 = TextEditingController();
  TextEditingController campo2 = TextEditingController();
  TextEditingController campo3 = TextEditingController();
  TextEditingController campo4 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campo1.dispose();
    campo2.dispose();
    campo3.dispose();
    campo4.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                BotaoVoltar(),
                
                Text(
                  "Código de Verificação",
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 56, 155),
                    decoration: TextDecoration.none,
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Confirmação de Identidade por E-mail",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.none,
                      fontSize: 45,
                      fontWeight: FontWeight.w600
                    ),
                  ),
        
                  SizedBox(height: 30,),
        
                  Text(
                    "Insira o código de verificação enviado ao e-mail cadastrado para confirmar sua identidade antes de alterar o e-mail.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 73, 73, 73),
                      decoration: TextDecoration.none,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),  
        
                  SizedBox(height: 70,),
        
                  Form(
                    key: _formKey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CampoCodigo(controller: campo1,),
                        CampoCodigo(controller: campo2,),
                        CampoCodigo(controller: campo3,),
                        CampoCodigo(controller: campo4,),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height - 100,),
          
              Positioned(
                child: Botao(
                  width: double.infinity, 
                  height: 80, 
                  texto: 'Entrar', 
                  fontSize: 30,
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed(Rotas.trocarEmail);
                    }
                  },
                  corTexto: Colors.white,
                  corFundo: const Color.fromARGB(255, 36, 56, 155),
                  borda: false
                ),
              )
            ],
          ),
        )

        

      ] 
    );
  }
}