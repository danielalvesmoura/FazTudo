import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/usuario_repository.dart';
import 'package:flutter_application_1/service/sessao_service.dart';
import 'package:flutter_application_1/sessao.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_application_1/widgets/campo_senha.dart';

class TelaExcluirConta extends StatefulWidget {
  @override
  TelaExcluirContaState createState() => TelaExcluirContaState();
}

class TelaExcluirContaState extends State<TelaExcluirConta> {
  TextEditingController campoEmail = TextEditingController();
  TextEditingController campoSenha = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoEmail.dispose();
    campoSenha.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  Sessao sessao = Sessao();
  SessaoService sessaoService = SessaoService();

  UsuarioRepository usuarioRepository = UsuarioRepository();

  String mensagemErro = "";

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
                  "Trocar Nome",
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
                    "Excluir conta",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.none,
                      fontSize: 50,
                      fontWeight: FontWeight.w600
                    ),
                  ),
        
                  SizedBox(height: 30,),
        
                  Text(
                    "Insira o e-mail e senha da conta abaixo para confirmar sua identidade antes de excluir a conta.",
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
              SizedBox(height: MediaQuery.of(context).size.height - 150,),

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
          
              Positioned(
                child: Botao(
                  width: double.infinity, 
                  height: 80, 
                  texto: 'Entrar', 
                  fontSize: 30,
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      if(campoEmail.text == sessao.usuarioLogado!.email && campoSenha.text == sessao.usuarioLogado!.senha) {
                        usuarioRepository.deletar(sessao.usuarioLogado!.id!);
                        sessaoService.atualizarUsuarioLogadoPorId();
                        
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
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
                ),
              )
            ],
          ),
        )

        

      ] 
    );
  }
}