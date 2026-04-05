import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/rotas.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/tela_meus_servicos/card_aba_servico.dart';

class TelaMeusServicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbasServicos()
      ],
    
    );
  }
}

class AbasServicos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AbasServicosState();
  }
}

enum AbasServicosEnum { publicados, aguardandoPublicacao, acimaDoLimite, expirados, inativos}

class AbasServicosState extends State<AbasServicos> {
  AbasServicosEnum selecionado = AbasServicosEnum.publicados;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardAbaServico(
                  titulo: 'Publicados',
                  selecionado: selecionado == AbasServicosEnum.publicados ? true : false,
                  onTap: () {
                    setState(() {
                      selecionado = AbasServicosEnum.publicados;
                    });
                  },
                  width: 150,
                ),
          
                SizedBox(width: 20,),
          
                CardAbaServico(
                  titulo: 'Aguardando Publicação',
                  selecionado: selecionado == AbasServicosEnum.aguardandoPublicacao ? true : false,
                  onTap: () {
                    setState(() {
                      selecionado = AbasServicosEnum.aguardandoPublicacao;
                    });
                  },
                  width: 300,
                ),
          
                SizedBox(width: 20,),
          
                CardAbaServico(
                  titulo: 'Acima do Limite',
                  selecionado: selecionado == AbasServicosEnum.acimaDoLimite ? true : false,
                  onTap: () {
                    setState(() {
                      selecionado = AbasServicosEnum.acimaDoLimite;
                    });
                  },
                  width: 200,
                ),
          
                SizedBox(width: 20,),
          
                CardAbaServico(
                  titulo: 'Expirados',
                  selecionado: selecionado == AbasServicosEnum.expirados ? true : false,
                  onTap: () {
                    setState(() {
                      selecionado = AbasServicosEnum.expirados;
                    });
                  },
                  width: 130,
                ),
          
                SizedBox(width: 20,),
          
                CardAbaServico(
                  titulo: 'Inativos',
                  selecionado: selecionado == AbasServicosEnum.inativos ? true : false,
                  onTap: () {
                    setState(() {
                      selecionado = AbasServicosEnum.inativos;
                    });
                  },
                  width: 110,
                ),
              ],
            ),
          ),
        ),

        Stack(
          children: [
            Container(
              // color: const Color.fromARGB(255, 219, 219, 219),
              width: double.infinity,
              height: 680,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(height: 30),

                    CardServico(
                      url: 'img/encanamento.png',
                      horario: 'Hoje às 19:40',
                      titulo: 'Revisão e Corserto de Encanamento',
                      subtitulo: 'R\$ 100,00 / hora'
                    ),

                    SizedBox(height: 30),

                    CardServico(
                      url: 'img/mecanica.png',
                      horario: '23/03/2026',
                      titulo: 'Troca de Óleo e Pneus',
                      subtitulo: 'R\$ 100,00 / hora'
                    ),

                    SizedBox(height: 30),

                    CardServico(
                      url: 'img/limpeza.png',
                      horario: '02/02/2026',
                      titulo: 'Limpeza de Casa',
                      subtitulo: 'R\$ 70,00 / hora'
                    ),

                    SizedBox(height: 100),
              
                  ],
                ),
              ),
            ),

            BotaoFlutuante(
              onPressed: () => Navigator.of(context).pushNamed(Rotas.novoServico), 
              icon: Icons.add, 
              texto: 'Novo Serviço',
              bottom: 0,
              enabled: true,
            )
          ],
        ),

      ],
    );
  }
}

class CardServico extends StatelessWidget {
  final String url;
  final String horario;
  final String titulo;
  final String subtitulo;

  CardServico({
    required this.url,
    required this.horario,
    required this.titulo,
    required this.subtitulo
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(url),
                    fit: BoxFit.cover
                  )
                ),
                width: 150,
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Container(
                  width: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(horario, style: TextStyle(color: const Color.fromARGB(255, 117, 117, 117))),
                          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                        ],
                      ),
      
                      Text(titulo, style: TextStyle(fontSize: 20)),
      
                      SizedBox(height: 10,),
      
                      Text(subtitulo, style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              )
            ],
          ),
      
          SizedBox(height: 20,),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Botao(
                  height: 70,
                  width: 200,
                  onPressed: () {},
                  fontSize: 20,
                  texto: 'Ver Detalhes',
                  corTexto: const Color.fromARGB(255, 0, 0, 0),
                  corFundo: const Color.fromARGB(255, 255, 255, 255),
                  borda: true
                ),
                  
                Botao(
                  height: 70,
                  width: 200,
                  onPressed: () {},
                  fontSize: 20,
                  texto: 'Chat',
                  corTexto: Colors.white,
                  corFundo: const Color.fromARGB(255, 36, 56, 155),
                  borda: false
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}