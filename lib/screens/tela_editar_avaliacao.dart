import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/avaliacao.dart';
import 'package:flutter_application_1/service/avaliacao_service.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TelaEditarAvaliacao extends StatefulWidget {
  final Avaliacao avaliacao;

  TelaEditarAvaliacao({required this.avaliacao});

  @override
  TelaEditarAvaliacaoState createState() => TelaEditarAvaliacaoState();
}

class TelaEditarAvaliacaoState extends State<TelaEditarAvaliacao> {
  TextEditingController campoDescricao = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoDescricao.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  double _notaUsuario = 0;

  String escolhaNota = "";

  AvaliacaoService avaliacaoService = AvaliacaoService();

  late Avaliacao avaliacao;

  @override
  void initState() {
    super.initState();
    avaliacao = widget.avaliacao;
    _notaUsuario = avaliacao.nota;
    campoDescricao.text = avaliacao.descricao;
  }

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
                  "Editar Avaliação",
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
                    "Edite sua avaliação",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.none,
                      fontSize: 50,
                      fontWeight: FontWeight.w600
                    ),
                  ),
        
                  SizedBox(height: 30,),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        itemBuilder: (_,_) => Icon(Icons.star, color: Colors.amber,), 
                        initialRating: avaliacao.nota,
                        allowHalfRating: true,
                        itemSize: 80,
                        onRatingUpdate: (rating) {
                          _notaUsuario = rating;
                        }
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        escolhaNota,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 0, 0),
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                      
                  SizedBox(height: 30,),
                      
                  SizedBox(
                    width: 500,
                    child: Form(
                      key: _formKey, 
                      child: Column(
                        children: [
                          Campo(
                            label: 'DETALHE SUA AVALIAÇÃO',
                            hint: 'Ex: Ótimo serviço!',
                            icon: Icons.star_border_outlined,
                            minLines: 1,
                            maxLines: 17,
                            controller: campoDescricao,
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Digite a descrição";
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
                      if(_notaUsuario == 0) {
                        setState(() {
                          escolhaNota = "Escolha uma nota";
                        });
                        return;
                      } else {
                        setState(() {
                          escolhaNota = "";
                        });
                        
                      };

                      avaliacao.nota = _notaUsuario;
                      avaliacao.descricao = campoDescricao.text;

                      avaliacaoService.update(avaliacao.id!, avaliacao);
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