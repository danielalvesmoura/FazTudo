import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_1/widgets/cadastro_servico/card_slot_para_foto.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

enum categorias { nenhuma, consertos, limpeza, beleza, transporte, alimentacao }

class TelaCadastroFoto extends StatefulWidget {
  final Function(int) trocarTela;

  TelaCadastroFoto({required this.trocarTela});

  @override
  State<TelaCadastroFoto> createState() => TelaCadastroFotoState();
}

class TelaCadastroFotoState extends State<TelaCadastroFoto> {

  List<XFile> imagens = [];
  int imagemAberta = -1;

  final ImagePicker picker = ImagePicker();
  File? imagem;
  Future<void> pegarImagem() async {
    final XFile? arquivo = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (arquivo != null) {
      setState(() {
        imagens.add(arquivo);
      });
    }
  }


  void removeImagem(imagem) {
    setState(() {
      imagens.remove(imagem);
      imagemAberta = -1;
    });
  }

  void fecharImagem() {
    setState(() {
      imagemAberta = -1;
    });
  }

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
                          width: MediaQuery.of(context).size.width - 150,
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
                    onTap: pegarImagem,
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
          
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: imagens.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CardSlotParaFoto(url: imagens[index].path, onTap: (){
                            setState(() {
                              imagemAberta = index;
                            });
                          }),
                          SizedBox(width: 20),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: imagens.isEmpty ? 0 : 100),
              ],
            ),
          ),
        ),

        BotaoFlutuante(
          onPressed: () {
            widget.trocarTela(3);
          },
          icon: Icons.arrow_forward,
          texto: "Continuar",
          bottom: 20,
          enabled: imagens.isEmpty ? false : true,
        ),

        mostraImagem(imagens, imagemAberta, removeImagem, fecharImagem)
      ],
    );
  }
}

Widget mostraImagem(imagens, imagemAberta, removeImagem, fecharImagem) {
  if(imagemAberta != -1) {
    return Stack(
      children: [
        GestureDetector(
          onTap: fecharImagem,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(188, 0, 0, 0)
            ),
          ),
        ),

        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, 
                children: [
                  FloatingActionButton(
                    shape: CircleBorder(),
                    onPressed: fecharImagem,
                    backgroundColor: Color.fromARGB(255, 36, 56, 155),
                    child: Icon(Icons.close, color: Colors.white, size: 40,),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: 400,
              height: 500,
              child: Image.network(imagens[imagemAberta].path)
            ),

            SizedBox(height: 40,),

            Botao(
              width: 250, 
              height: 80, 
              texto: 'Remover imagem', 
              corTexto: Colors.white, 
              corFundo: Color.fromARGB(255, 36, 56, 155), 
              borda: false, 
              onPressed: (){
                removeImagem(imagens[imagemAberta]);
              }, 
              fontSize: 20
            )
          ],
        ))
      ],
    );
    
     
  } else {
    return SizedBox();
  }
}

