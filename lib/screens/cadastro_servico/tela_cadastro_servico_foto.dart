import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/cadastro_servico/card_categoria_selecionavel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_1/widgets/cadastro_servico/card_slot_para_foto.dart';
import 'package:image_picker/image_picker.dart';

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
        SingleChildScrollView(
          child: Padding(
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
          
                SizedBox(height: 50),
          
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector( 
                    onTap: () {},
                    child: DottedBorder(
                      dashPattern: [10,4],
                      color: Colors.grey,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(50),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(244, 243, 242, 255),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 36, 56, 155),
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Icon(Icons.camera_alt_outlined, size: 60, color: Colors.white,),
                                  ),
                                ),
                                
                                SizedBox(height: 30),
          
                                Text(
                                  textAlign: TextAlign.center,
                                  'Escolha suas fotos aqui',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0)
                                  ),
                                ),
          
                                SizedBox(height: 20),
          
                                Text(
                                  textAlign: TextAlign.center,
                                  'Formatos aceitos: JPG, PNG.\nTamanho máximo: 10MB por foto.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(255, 99, 99, 99),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 40),
          
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardSlotParaFoto(url: "",),
                      SizedBox(width: 20),
                      CardSlotParaFoto(url: ""),
                      SizedBox(width: 20),
                      CardSlotParaFoto(url: ""),
                    ],
                  ),
                ),

                SizedBox(height: 500),
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
          enabled: selecionado != categorias.nenhuma ? true : false,
        ),
      ],
    );
  }
}

