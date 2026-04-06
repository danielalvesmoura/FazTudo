import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/card_categoria_selecionavel.dart';

enum categorias { nenhuma, consertos, limpeza, beleza, transporte, alimentacao }

class TelaCadastroCategoria extends StatefulWidget {
  final Function(int) trocarTela;

  TelaCadastroCategoria({required this.trocarTela});

  @override
  State<TelaCadastroCategoria> createState() => TelaCadastroCategoriaState();
}

class TelaCadastroCategoriaState extends State<TelaCadastroCategoria> {
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
                'Escolha uma categoria',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),

              SizedBox(height: 20),

              Text(
                'Escolha a categoria principal que melhor descreve o serviço. Isso ajuda os clientes certos a encontrarem você.',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 20),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  CardCategoriaSelecionavel(
                    url: 'icon/ferramenta.png',
                    tamanhoIcone: 4,
                    titulo: 'Conserto',
                    onTap: () {
                      setState(() {
                        selecionado != categorias.consertos
                            ? selecionado = categorias.consertos
                            : selecionado = categorias.nenhuma;
                      });
                    },
                    selecionado: selecionado == categorias.consertos
                        ? true
                        : false,
                  ),

                  CardCategoriaSelecionavel(
                    url: 'icon/aspirador.png',
                    tamanhoIcone: 7,
                    titulo: 'Limpeza',
                    onTap: () {
                      setState(() {
                        selecionado != categorias.limpeza
                            ? selecionado = categorias.limpeza
                            : selecionado = categorias.nenhuma;
                      });
                    },
                    selecionado: selecionado == categorias.limpeza
                        ? true
                        : false,
                  ),

                  CardCategoriaSelecionavel(
                    url: 'icon/cabeca.png',
                    tamanhoIcone: 4,
                    titulo: 'Beleza',
                    onTap: () {
                      setState(() {
                        selecionado != categorias.beleza
                            ? selecionado = categorias.beleza
                            : selecionado = categorias.nenhuma;
                      });
                    },
                    selecionado: selecionado == categorias.beleza
                        ? true
                        : false,
                  ),

                  CardCategoriaSelecionavel(
                    url: 'icon/carro.png',
                    tamanhoIcone: 7,
                    titulo: 'Transporte',
                    onTap: () {
                      setState(() {
                        selecionado != categorias.transporte
                            ? selecionado = categorias.transporte
                            : selecionado = categorias.nenhuma;
                      });
                    },
                    selecionado: selecionado == categorias.transporte
                        ? true
                        : false,
                  ),

                  CardCategoriaSelecionavel(
                    url: 'icon/hamburger.png',
                    tamanhoIcone: 7,
                    titulo: 'Alimentação',
                    onTap: () {
                      setState(() {
                        selecionado != categorias.alimentacao
                            ? selecionado = categorias.alimentacao
                            : selecionado = categorias.nenhuma;
                      });
                    },
                    selecionado: selecionado == categorias.alimentacao
                        ? true
                        : false,
                  ),
                ],
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
