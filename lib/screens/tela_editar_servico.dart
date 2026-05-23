import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/servico.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/botao_voltar.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_application_1/widgets/subcategorias/subcategorias_conserto_cadastro.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum categorias { nenhuma, consertos, limpeza, beleza, transporte, alimentacao }

class TelaEditarServico extends StatefulWidget {
  final Servico servico;

  TelaEditarServico({required this.servico});

  @override
  TelaEditarServicoState createState() => TelaEditarServicoState();
}

class TelaEditarServicoState extends State<TelaEditarServico> {
  final cepFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  TextEditingController campoTitulo = TextEditingController();
  TextEditingController campoCep = TextEditingController();
  TextEditingController campoDescricao = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    campoTitulo.dispose();
    campoCep.dispose();
    campoDescricao.dispose();
  }

  @override
  void initState() {
    super.initState();
    campoTitulo.text = widget.servico.titulo;
    campoCep.text = widget.servico.cep;
    campoDescricao.text = widget.servico.descricao;
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
                  "Editar Serviço",
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
                      image: AssetImage(widget.servico.url),
                      fit: BoxFit.cover
                    )
                  ),
                
                  height: 300,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                        child: Column(
                          children: [  
                        
                            SizedBox(height: 30),
                        
                            Campo(
                              label: 'Título do Serviço', 
                              hint: 'Ex: Troca de Pneus e óleo', 
                              icon: null,
                              minLines: 1,
                              maxLines: 2,
                              controller: campoTitulo,
                            ),
                                        
                            SizedBox(height: 30),
                                        
                            Campo(
                              label: 'Descrição Detalhada', 
                              hint: 'Explique como funciona seu serviço...', 
                              icon: null,
                              minLines: 1,
                              maxLines: 20,
                              controller: campoDescricao,
                            ),
                                        
                            SizedBox(height: 30),
                                        
                            Campo(
                              label: 'CEP', 
                              hint: '00000-000', 
                              icon: null,
                              minLines: 1,
                              maxLines: 20,
                              formatters: [cepFormatter],
                              controller: campoCep,
                            ),
                                        
                            SizedBox(height: 30),
                                        
                            Row(
                              children: [
                                Text(
                                  'Subcategoria',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 65, 65, 65),
                                    decoration: TextDecoration.none,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SubcategoriasConsertoCadastro(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            
          ],
        ),

        BotaoFlutuante(
          onPressed: () {
           
          },
          icon: Icons.arrow_forward, 
          texto: "Salvar",
          bottom: 20,
          enabled: true,
        ),

        
      ],
    );
  }
}

