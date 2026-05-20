import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/sessao_service.dart';
import 'package:flutter_application_1/service/usuario_service.dart';
import 'package:flutter_application_1/sessao.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo.dart';

class TelaTrocarNome extends StatefulWidget {
  @override
  TelaTrocarNomeState createState() => TelaTrocarNomeState();
}

class TelaTrocarNomeState extends State<TelaTrocarNome> {
  TextEditingController campoNovoNome = TextEditingController();
  TextEditingController campoConfirmarNome = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoNovoNome.dispose();
    campoConfirmarNome.dispose();
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
                    "Novo Nome Completo",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.none,
                      fontSize: 50,
                      fontWeight: FontWeight.w600
                    ),
                  ),
        
                  SizedBox(height: 30,),
        
                  Text(
                    "Insira o novo nome abaixo para concluir a alteração.",
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
                            label: 'NOVO NOME COMPLETO',
                            hint: 'Ex: João Silva',
                            icon: Icons.person_outline,
                            minLines: 1,
                            maxLines: 1,
                            controller: campoNovoNome,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite o nome completo";
                              }
                      
                              return null;
                            },
                          ),

                          SizedBox(height: 30,),

                          Campo(
                            label: 'CONFIRMAR NOME COMPLETO',
                            hint: 'Ex: João Silva',
                            icon: Icons.person_outline,
                            minLines: 1,
                            maxLines: 1,
                            controller: campoConfirmarNome,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite o nome completo";
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
                  texto: 'Salvar', 
                  fontSize: 30,
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      usuarioService.trocaNome(sessao.usuarioLogado!.id!, campoNovoNome.text);
                      sessaoService.atualizarUsuarioLogado();
                      Navigator.of(context).pop(true);
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