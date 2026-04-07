import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/cadastro_servico/card_categoria_selecionavel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_1/widgets/cadastro_servico/card_slot_para_foto.dart';
import 'package:image_picker/image_picker.dart';

enum categorias { nenhuma, consertos, limpeza, beleza, transporte, alimentacao }

class TelaCadastroServicoDetalhes extends StatefulWidget {
  final Function(int) trocarTela;

  TelaCadastroServicoDetalhes({required this.trocarTela});

  @override
  State<TelaCadastroServicoDetalhes> createState() => TelaCadastroServicoDetalhesState();
}

class TelaCadastroServicoDetalhesState extends State<TelaCadastroServicoDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: 20),

                Text(
                  'Conte-nos os detalhes',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
          
                SizedBox(height: 20),
          
                Text(
                  'Descreva bem o que você oferece e onde atende.',
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.w500
                  ),
                ),
          
                SizedBox(height: 10),
          
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.fromBorderSide(BorderSide(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      width: 3,
                    )),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Descreva bem o que você oferece e onde atende.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 150),
              ],
            ),
          ),
        ),

        BotaoFlutuante(
          onPressed: () {
            widget.trocarTela(2);
          },
          icon: Icons.arrow_forward,
          texto: "Continuar",
          bottom: 20,
          enabled: true,
        ),
      ],
    );
  }
}

