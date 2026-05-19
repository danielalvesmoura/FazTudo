import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/usuario_service.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_application_1/widgets/campo_senha.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/screens/rotas.dart';

class TelaLogin extends StatefulWidget {
  @override
  TelaLoginState createState() => TelaLoginState();
}


class TelaLoginState extends State<TelaLogin> {

  UsuarioService usuarioService = UsuarioService();

  TextEditingController campoEmail = TextEditingController();
  TextEditingController campoSenha = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoEmail.dispose();
    campoSenha.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  String mensagemErro = "";

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

              SizedBox(height: 50),

              Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 60,
                  fontWeight: FontWeight.w700
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Bem-vindo de volta! Por favor, insira seus dados.',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      }, 
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset('icon/icone-google.png',scale: 6,),
                            
                                SizedBox(width: 10),
                                
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    decoration: TextDecoration.none,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                
                    ElevatedButton(
                      onPressed: () {
                      }, 
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset('icon/icone-apple.png',scale: 5,),
                            
                                SizedBox(width: 10),
                                
                                Text(
                                  'Apple',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    decoration: TextDecoration.none,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'ou use seu e-mail',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 56, 56, 56),
                        decoration: TextDecoration.none,
                        fontSize: 22,
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 40),

                    Campo(
                      label: 'E-MAIL',
                      hint: 'seu@email.com',
                      icon: Icons.email_outlined,
                      minLines: 1,
                      maxLines: 1,
                      controller: campoEmail,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Digite o email";
                        }
                
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    CampoSenha(
                      label: 'SENHA',
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

                    SizedBox(height: 20,),

                    Text(
                      mensagemErro,
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.none,
                        fontSize: 22,
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 20,),

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
                )
              )

              
            ]         
          ),
        )
      )
    );
  }
}

