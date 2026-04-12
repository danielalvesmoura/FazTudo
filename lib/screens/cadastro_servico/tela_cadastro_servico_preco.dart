import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/card_selecionavel.dart';

enum categorias { nenhuma, consertos, limpeza, beleza, transporte, alimentacao }

class TelaCadastroServicoPreco extends StatefulWidget {
  final Function(int) trocarTela;

  TelaCadastroServicoPreco({required this.trocarTela});

  @override
  State<TelaCadastroServicoPreco> createState() => TelaCadastroServicoPrecoState();
}

enum TipoPreco {apartirde, precofixo}
enum Tempo {hora, servico, dia}

class TelaCadastroServicoPrecoState extends State<TelaCadastroServicoPreco> {

  TipoPreco tipoPreco = TipoPreco.apartirde;
  Tempo tempo = Tempo.hora;

  var precoController = TextEditingController();

  final formatter = CurrencyTextInputFormatter.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

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
                  'Quanto custa ser serviço?',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
          
                SizedBox(height: 20),
          
                Text(
                  'Defina um valor base para atrair orçamentos.',
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.w500
                  ),
                ),
          
                SizedBox(height: 60),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardSelecionavel(
                      corBordaSelecionado: Colors.transparent,
                      corBordaNaoSelecionado: Colors.transparent,
                      corFundoSelecionado: Color.fromARGB(255, 36, 56, 155),
                      corFundoNaoSelecionado: Color.fromARGB(255, 209, 209, 209),
                      corTextoNaoSelecionado: Colors.grey,
                      corTextoSelecionado: Colors.white,
                      borderRadius: 30,
                      tamanhoIcone: 2, 
                      fontWeight: FontWeight.w500,
                      titulo: 'A partir de', 
                      icone: null,
                      height: 60,
                      width: 180,
                      onTap: () {
                        setState(() {
                          tipoPreco = TipoPreco.apartirde; 
                        });
                      },
                      selecionado: tipoPreco == TipoPreco.apartirde ? true : false
                    ),

                    SizedBox(width: 20),

                    CardSelecionavel(
                      corBordaSelecionado: Colors.transparent,
                      corBordaNaoSelecionado: Colors.transparent,
                      corFundoSelecionado: Color.fromARGB(255, 36, 56, 155),
                      corFundoNaoSelecionado: Color.fromARGB(255, 209, 209, 209),
                      corTextoNaoSelecionado: Colors.grey,
                      corTextoSelecionado: Colors.white,
                      borderRadius: 30,
                      tamanhoIcone: 2, 
                      fontWeight: FontWeight.w500,
                      titulo: 'Preço Fixo', 
                      icone: null,
                      height: 60,
                      width: 180,
                      onTap: () {
                        setState(() {
                          tipoPreco = TipoPreco.precofixo; 
                        });
                      },
                      selecionado: tipoPreco == TipoPreco.precofixo ? true : false
                    ),
                  ],
                ),

                SizedBox(height: 50),

                Text(
                  'VALOR',
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 56, 155),
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),
                ),

                SizedBox(height: 20),

                TextField(
                  style: TextStyle(
                    fontSize: 70
                  ),
                  controller: precoController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'R\$ 0,00',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 70
                    ),
                  ),
                  inputFormatters: [formatter],
                  onChanged: (value) => setState(() {}),
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardSelecionavel(
                      corBordaSelecionado: Color.fromARGB(255, 36, 56, 155),
                      corBordaNaoSelecionado: Colors.transparent,
                      corFundoSelecionado: Colors.white,
                      corFundoNaoSelecionado: Colors.white,
                      corTextoNaoSelecionado: Color.fromARGB(255, 95, 95, 95),
                      corTextoSelecionado: Color.fromARGB(255, 36, 56, 155),
                      borderRadius: 15,
                      tamanhoIcone: 2, 
                      titulo: '/hora', 
                      fontWeight: FontWeight.w600,
                      icone: null,
                      height: 60,
                      width: 100,
                      onTap: () {
                        setState(() {
                          tempo = Tempo.hora; 
                        });
                      },
                      selecionado: tempo == Tempo.hora ? true : false
                    ),

                    SizedBox(width: 20),

                    CardSelecionavel(
                      corBordaSelecionado: Color.fromARGB(255, 36, 56, 155),
                      corBordaNaoSelecionado: Colors.transparent,
                      corFundoSelecionado: Colors.white,
                      corFundoNaoSelecionado: Colors.white,
                      corTextoNaoSelecionado: Color.fromARGB(255, 95, 95, 95),
                      corTextoSelecionado: Color.fromARGB(255, 36, 56, 155),
                      borderRadius: 15,
                      tamanhoIcone: 2, 
                      titulo: '/servico', 
                      fontWeight: FontWeight.w600,
                      icone: null,
                      height: 60,
                      width: 130,
                      onTap: () {
                        setState(() {
                          tempo = Tempo.servico; 
                        });
                      },
                      selecionado: tempo == Tempo.servico ? true : false
                    ),

                    SizedBox(width: 20),

                    CardSelecionavel(
                      corBordaSelecionado: Color.fromARGB(255, 36, 56, 155),
                      corBordaNaoSelecionado: Colors.transparent,
                      corFundoSelecionado: Colors.white,
                      corFundoNaoSelecionado: Colors.white,
                      corTextoNaoSelecionado: const Color.fromARGB(255, 95, 95, 95),
                      corTextoSelecionado: Color.fromARGB(255, 36, 56, 155),
                      borderRadius: 15,
                      tamanhoIcone: 2, 
                      titulo: '/dia', 
                      fontWeight: FontWeight.w600,
                      icone: null,
                      height: 60,
                      width: 100,
                      onTap: () {
                        setState(() {
                          tempo = Tempo.dia; 
                        });
                      },
                      selecionado: tempo == Tempo.dia ? true : false
                    ),
                  ],
                ),
                
                SizedBox(height: 188),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BotaoFlutuante(
                onPressed: () {
                  widget.trocarTela(5);
                },
                icon: Icons.arrow_forward, 
                texto: "Continuar",
                bottom: 20,
                enabled: precoController.text.isEmpty ? false : true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

