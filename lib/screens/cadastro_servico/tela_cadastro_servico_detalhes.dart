import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/regex.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/campo.dart';
import 'package:flutter_application_1/widgets/subcategorias/subcategorias_conserto_cadastro.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum categorias { nenhuma, consertos, limpeza, beleza, transporte, alimentacao }

class TelaCadastroServicoDetalhes extends StatefulWidget {
  final Function(int) trocarTela;
  final Function(String) setTitulo;
  final Function(String) setCep;
  final Function(String) setDescricao;

  TelaCadastroServicoDetalhes({
    required this.trocarTela,
    required this.setTitulo,
    required this.setCep,
    required this.setDescricao,
  });

  @override
  State<TelaCadastroServicoDetalhes> createState() => TelaCadastroServicoDetalhesState();
}

class TelaCadastroServicoDetalhesState extends State<TelaCadastroServicoDetalhes> {
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

  Regex regex = Regex();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
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
                        
                  SizedBox(height: 60),
                        
                  Campo(
                    label: 'Título do Serviço', 
                    hint: 'Ex: Troca de Pneus e óleo', 
                    icon: null,
                    minLines: 1,
                    maxLines: 2,
                    controller: campoTitulo,
                    validator: (value) {
                      if(value == null || value.trim().isEmpty) {
                        return "Preencha este campo.";
                      }

                      return null;
                    },
                  ),
              
                  SizedBox(height: 30),
              
                  Campo(
                    label: 'Descrição Detalhada', 
                    hint: 'Explique como funciona seu serviço...', 
                    icon: null,
                    minLines: 1,
                    maxLines: 20,
                    controller: campoDescricao,
                    validator: (value) {
                      if(value == null || value.trim().isEmpty) {
                        return "Preencha este campo.";
                      }

                      return null;
                    },
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
                    validator: (value) {
                      if(value == null || value.trim().isEmpty) {
                        return "Preencha este campo.";
                      }

                      if(!regex.validarCep(value)) {
                        return "CEP inválido.";
                      }
              
                      return null;
                    },
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
                  
                  SizedBox(height: 188),
                ],
              ),
            ),
          ),
        ),

        BotaoFlutuante(
          onPressed: () {
            if(_formKey.currentState!.validate()) {
              widget.setTitulo(campoTitulo.text);
              widget.setCep(cepFormatter.getUnmaskedText());
              widget.setDescricao(campoDescricao.text);

              widget.trocarTela(4);
            }
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

