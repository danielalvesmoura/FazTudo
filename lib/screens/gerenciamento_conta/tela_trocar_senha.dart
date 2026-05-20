import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/usuario_service.dart';
import 'package:flutter_application_1/sessao.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo_senha.dart';

class TelaTrocarSenha extends StatefulWidget {
  @override
  TelaTrocarSenhaState createState() => TelaTrocarSenhaState();
}

class TelaTrocarSenhaState extends State<TelaTrocarSenha> {
  TextEditingController campoSenhaAtual = TextEditingController();
  TextEditingController campoNovaSenha = TextEditingController();
  TextEditingController campoConfirmarSenha = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoSenhaAtual.dispose();
    campoNovaSenha.dispose();
    campoConfirmarSenha.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  Sessao sessao = Sessao();
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
        
                  SizedBox(height: 70,),
        
                  SizedBox(
                    width: 500,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CampoSenha(
                            label: 'SENHA ATUAL',
                            hint: '••••••••',
                            icon: Icons.lock_outline_rounded,
                            controller: campoSenhaAtual,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite a senha";
                              }

                              if(sessao.usuarioLogado!.senha != campoSenhaAtual.text) {
                                return "Senha incorreta";
                              }
                                  
                              return null;
                            },
                          ),
                      
                          SizedBox(height: 40,),
                      
                          CampoSenha(
                            label: 'NOVA SENHA',
                            hint: '••••••••',
                            icon: Icons.lock_outline_rounded,
                            controller: campoNovaSenha,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite a senha";
                              }

                              if(campoConfirmarSenha.text != campoNovaSenha.text) {
                                return "As senhas não batem";
                              }
                                  
                              return null;
                            },
                          ),
                      
                          SizedBox(height: 40,),
                      
                          CampoSenha(
                            label: 'CONFIRMAR NOVA SENHA',
                            hint: '••••••••',
                            icon: Icons.lock_outline_rounded,
                            controller: campoConfirmarSenha,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite a senha";
                              }

                              if(campoConfirmarSenha.text != campoNovaSenha.text) {
                                return "As senhas não batem";
                              }
                                  
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
                      usuarioService.trocaSenha(sessao.usuarioLogado!.id!, campoNovaSenha.text);
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