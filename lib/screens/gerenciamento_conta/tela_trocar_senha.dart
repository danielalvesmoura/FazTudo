import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo_senha.dart';

class TelaTrocarSenha extends StatefulWidget {
  @override
  TelaTrocarSenhaState createState() => TelaTrocarSenhaState();
}

class TelaTrocarSenhaState extends State<TelaTrocarSenha> {
  TextEditingController campoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            BotaoVoltar(),
            
            Text(
              "Trocar senha",
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
                "Nova senha",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  decoration: TextDecoration.none,
                  fontSize: 50,
                  fontWeight: FontWeight.w600
                ),
              ),

              SizedBox(height: 30,),

              Text(
                "Insira sua nova senha abaixo para concluir a alteração.",
                style: TextStyle(
                  color: Color.fromARGB(255, 73, 73, 73),
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 50,),

              SizedBox(
                width: 500,
                child: Column(
                  children: [
                    CampoSenha(
                      label: 'SENHA ATUAL',
                      hint: '••••••••',
                      icon: Icons.lock_outline_rounded,
                      controller: campoSenha,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Digite a senha";
                        }
                            
                        return null;
                      },
                    ),

                    SizedBox(height: 30,),

                    CampoSenha(
                      label: 'NOVA SENHA',
                      hint: '••••••••',
                      icon: Icons.lock_outline_rounded,
                      controller: campoSenha,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Digite a senha";
                        }
                            
                        return null;
                      },
                    ),

                    SizedBox(height: 30,),

                    CampoSenha(
                      label: 'CONFIRMAR NOVA SENHA',
                      hint: '••••••••',
                      icon: Icons.lock_outline_rounded,
                      controller: campoSenha,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Digite a senha";
                        }
                            
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              Botao(
                width: double.infinity, 
                height: 80, 
                texto: 'Entrar', 
                fontSize: 30,
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    if(await usuarioService.validaLogin(campoEmail.text, campoSenha.text)) {
                      Navigator.of(context).pushNamed(Rotas.home);
                    } else {
                      setState(() {
                        mensagemErro = "Email ou senha incorretos";
                      });
                    }
                  } else {
                    setState(() {
                      mensagemErro = "";
                    });
                  }
                },
                corTexto: Colors.white,
                corFundo: const Color.fromARGB(255, 36, 56, 155),
                borda: false
              )
            ],
          ),
        )

        
      ],
    );
  }
}