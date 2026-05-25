import 'package:flutter/material.dart';
import 'package:flutter_application_1/dto/servicos_tela_consertos_dto.dart';
import 'package:flutter_application_1/models/avaliacao.dart';
import 'package:flutter_application_1/screens/tela_editar_avaliacao.dart';
import 'package:flutter_application_1/repository/avaliacao_repository.dart';
import 'package:flutter_application_1/service/avaliacao_service.dart';
import 'package:flutter_application_1/sessao.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_application_1/widgets/tela_avaliacao/card_avaliacao.dart';
import 'package:flutter_application_1/widgets/tela_config/separador.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TelaAvaliacoes extends StatefulWidget {
  final ServicoTelaConsertosDTO servico;

  TelaAvaliacoes({required this.servico});

  @override
  TelaAvaliacoesState createState() => TelaAvaliacoesState();
}

class TelaAvaliacoesState extends State<TelaAvaliacoes> {
  TextEditingController campoDescricao = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoDescricao.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  double _notaUsuario = 0;

  List<Map<String,dynamic>> avaliacoes = [];

  AvaliacaoRepository avaliacaoRepository = AvaliacaoRepository();
  AvaliacaoService avaliacaoService = AvaliacaoService();

  bool usuarioJaAvaliou = true;
  
  Sessao sessao = Sessao();

  Future<void> preencheLista() async {
    List<Map<String,dynamic>>? resultado = await avaliacaoRepository.listaTodos(widget.servico.id);

    print(resultado);

    if(resultado != null) avaliacoes = resultado;
    usuarioJaAvaliou = await avaliacaoService.usuarioJaAvaliou(widget.servico.id, sessao.usuarioLogado!.id!);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    preencheLista();
  }

  String escolhaNota = "";

  bool editando = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BotaoVoltar(),
                  
                  Text(
                    "Avaliações",
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

              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/encanamento.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  
                    height: 300,
                  ),
              
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
                        child: Column(
                          children: [

                            if(editando)
                              Container(),

                            if(!editando)
                              SizedBox(
                                height: 650,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "TÍTULO DO SERVIÇO",
                                              style: TextStyle(
                                                color: Color.fromARGB(193, 0, 0, 0),
                                                decoration: TextDecoration.none,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Text(
                                              widget.servico.titulo,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                decoration: TextDecoration.none,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                              
                                            SizedBox(height: 20,),
                              
                                            Separador(),
                                                
                                            SizedBox(height: 30,),
                              
                                            if(sessao.usuarioLogado!.id! == widget.servico.usuario_id)
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.person_outline, color: Color.fromARGB(166, 0, 0, 0)),
                                                      SizedBox(width: 10,),
                                                      Text(
                                                        "Este serviço é seu",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(166, 0, 0, 0),
                                                          decoration: TextDecoration.none,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                              
                                                  SizedBox(height: 30,),
                                                ],
                                              ),
                              
                                            if(usuarioJaAvaliou && sessao.usuarioLogado!.id! != widget.servico.usuario_id)
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.check, color: Color.fromARGB(166, 0, 0, 0)),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    "Você já avaliou esse serviço",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(166, 0, 0, 0),
                                                      decoration: TextDecoration.none,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                                
                                            if(!usuarioJaAvaliou && sessao.usuarioLogado!.id! != widget.servico.usuario_id)
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Deixe uma avaliação:",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                      decoration: TextDecoration.none,
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                              
                                                  SizedBox(height: 20,),
                                                  
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      RatingBar.builder(
                                                        itemBuilder: (_,_) => Icon(Icons.star, color: Colors.amber,), 
                                                        initialRating: 0,
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
                                                            maxLines: 5,
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
                              
                                                  SizedBox(height: 30,),
                              
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Botao(
                                                        width: 200, 
                                                        height: 60, 
                                                        texto: "Enviar Avaliação", 
                                                        corTexto: Colors.white, 
                                                        corFundo: Color.fromARGB(255, 36, 56, 155), 
                                                        borda: false, 
                                                        onPressed: () {
                                                          print(sessao.usuarioLogado!.id);
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
                              
                                                            Sessao sessao = Sessao();
                              
                                                            avaliacaoRepository.cadastrar(
                                                              _notaUsuario, 
                                                              campoDescricao.text, 
                                                              widget.servico.id, 
                                                              sessao.usuarioLogado!.id!,
                                                              DateTime.now()
                                                            );
                                                      
                                                            preencheLista();
                                                          }
                                                        }, 
                                                        fontSize: 25
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),  
                                          ],
                                        ),
                                      ),
                              
                                      if(!usuarioJaAvaliou && sessao.usuarioLogado!.id! != widget.servico.usuario_id)
                                        SizedBox(height: 50,),
                              
                                      if(usuarioJaAvaliou && sessao.usuarioLogado!.id! != widget.servico.usuario_id)
                                        SizedBox(height: 30,),
                                  
                                      Text(
                                        "Avalições dos Usuários",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          decoration: TextDecoration.none,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                  
                                      SizedBox(height: 30,),
                              
                                      if(avaliacoes.isEmpty)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.info_outline, color: Color.fromARGB(166, 0, 0, 0)),
                                            SizedBox(width: 10,),
                                            Text(
                                              "Este serviço ainda não foi avaliado",
                                              style: TextStyle(
                                                color: Color.fromARGB(166, 0, 0, 0),
                                                decoration: TextDecoration.none,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                              
                                      SizedBox(
                                        height: 550,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              for(Map<String, dynamic> avaliacao in avaliacoes)
                                                Column(
                                                  children: [
                                                    CardAvaliacao(
                                                      data: DateTime.parse(avaliacao["data"]),
                                                      nota: avaliacao["nota"],
                                                      usuario: avaliacao["nome"],
                                                      descricao: avaliacao["descricao"],
                                                      autor: avaliacao["usuario_id"] == sessao.usuarioLogado!.id! ? true : false,
                                                      botaoDeletar: () {
                                                        avaliacaoRepository.deletar(avaliacao["id"]);
                                                        preencheLista();
                                                        _notaUsuario = 0;
                                                      },
                                                      botaoEditar: () async {
                                                        await Navigator.of(context).push(
                                                          MaterialPageRoute(builder: (_) => TelaEditarAvaliacao(avaliacao: Avaliacao.fromMap(avaliacao),))
                                                        );

                                                        preencheLista();
                                                      },
                                                    ),
                                                    SizedBox(height: 40,),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )

              
          
              
            ],
          ),
        ),
      ] 
    );
  }
}