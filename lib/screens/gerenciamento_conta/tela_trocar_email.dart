import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/sessao_service.dart';
import 'package:flutter_application_1/service/usuario_service.dart';
import 'package:flutter_application_1/sessao.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo.dart';

class TelaTrocarEmail extends StatefulWidget {
  @override
  TelaTrocarEmailState createState() => TelaTrocarEmailState();
}

class TelaTrocarEmailState extends State<TelaTrocarEmail> {
  TextEditingController campoNovoEmail = TextEditingController();
  TextEditingController campoConfirmarEmail = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoNovoEmail.dispose();
    campoConfirmarEmail.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  Sessao sessao = Sessao();
  SessaoService sessaoService = SessaoService();
  UsuarioService usuarioService = UsuarioService();


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
                  "Trocar e-mail",
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
                    "Novo E-mail",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.none,
                      fontSize: 50,
                      fontWeight: FontWeight.w600
                    ),
                  ),
        
                  SizedBox(height: 30,),
        
                  Text(
                    "Insira seu novo e-mail abaixo para concluir a alteração.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 73, 73, 73),
                      decoration: TextDecoration.none,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
        
                  SizedBox(height: 70,),
        
                  SizedBox(
                    width: 500,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Campo(
                            label: 'NOVO E-MAIL',
                            hint: 'seu@email.com',
                            icon: Icons.email_outlined,
                            minLines: 1,
                            maxLines: 1,
                            controller: campoNovoEmail,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite o email";
                              }

                              if(campoNovoEmail.text != campoConfirmarEmail.text) return "Os e-mails não coincidem";
                      
                              return null;
                            },
                          ),

                          SizedBox(height: 30,),

                          Campo(
                            label: 'CONFIRMAR NOVO E-MAIL',
                            hint: 'seu@email.com',
                            icon: Icons.email_outlined,
                            minLines: 1,
                            maxLines: 1,
                            controller: campoConfirmarEmail,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite o email";
                              }

                              if(campoNovoEmail.text != campoConfirmarEmail.text) return "Os e-mails não coincidem";
                      
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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
                      usuarioService.trocaEmail(sessao.usuarioLogado!.id!, campoNovoEmail.text);
                      sessaoService.atualizarUsuarioLogado();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
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