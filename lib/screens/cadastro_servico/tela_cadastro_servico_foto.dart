import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/card_categoria_selecionavel.dart';

enum categorias { nenhuma, consertos, limpeza, beleza, transporte, alimentacao }

class TelaCadastroFoto extends StatefulWidget {
  final Function(int) trocarTela;

  TelaCadastroFoto({required this.trocarTela});

  @override
  State<TelaCadastroFoto> createState() => TelaCadastroFotoState();
}

class TelaCadastroFotoState extends State<TelaCadastroFoto> {
  categorias selecionado = categorias.nenhuma;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Perfeito! Agora adicione algumas fotos do seu anúncio',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),

              SizedBox(height: 20),

              Text(
                'Até 20 fotos nos formatos JPG, GIF, PNG, HEIC ou WEBP.',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 203, 255),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lightbulb_circle_outlined, 
                        color: const Color.fromARGB(255, 61, 0, 80),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 125,
                        child: Text(
                          'Fotos com boa qualidade ajudam a vender mais rápido.',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 55, 0, 80)
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

        BotaoFlutuante(
          onPressed: () {
            widget.trocarTela(2);
          },
          icon: Icons.arrow_forward,
          texto: "Continuar",
          bottom: 20,
          enabled: selecionado != categorias.nenhuma ? true : false,
        ),
      ],
    );
  }
}
