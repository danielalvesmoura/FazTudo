import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/tela_home/card_categoria.dart';
import 'package:flutter_application_1/screens/rotas.dart';

class PaginaDashboard extends StatelessWidget {
  // final VoidCallback onTapConserto;
  // final VoidCallback onTapLimpeza;
  // final VoidCallback onTapBeleza;
  // final VoidCallback onTapTransporte;
  // final VoidCallback onTapAlimentacao;

  // const PaginaDashboard({
  //   required this.onTapConserto,
  //   required this.onTapLimpeza,
  //   required this.onTapBeleza,
  //   required this.onTapTransporte,
  //   required this.onTapAlimentacao
  // })

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
  
        SizedBox(height: 20),
  
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: Text.rich(
            TextSpan(
              text: 'Encontre o ',
              style: TextStyle(
                fontWeight: FontWeight(700),
                letterSpacing: 0,
                height: 1.2,
                fontSize: 50,
              ),
              children: [
                TextSpan(
                  text: 'Serviço',
                  style: TextStyle(
                    color: Color.fromARGB(255, 36, 56, 155)
                  )
                ),
                TextSpan(text: ' ideal para você.')
              ]
            )
          ),
        ),
  
        SizedBox(height: 20),
  
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'O mercado selecionado para profissionais locais. Profissionais verificados, confiáveis ​​e bem perto.',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 75, 75, 75),
              height: 1.6,
              fontWeight: FontWeight(500)
            ),
          ),
        ),
  
        SizedBox(height: 20),
  
        TextField(
          decoration: InputDecoration(
            hintText: 'Buscar por qualquer serviço...',
            prefixIcon: Icon(Icons.search),
  
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 218, 218, 218),
              ),
            ),
  
            enabledBorder: InputBorder.none
  
          ),
        ),
  
        SizedBox(height: 40),
  
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 220,
              child: Text(
                'Buscar por Categoria',
                style: TextStyle(
                  fontSize: 35,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  height: 1.2,
                  fontWeight: FontWeight(800),
                  fontFamily: 'Manrope'
                ),
              ),
            ),
  
            SizedBox(
              width: 150,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Ver todas as categorias',
                  style: TextStyle(
                    fontSize: 20,
                    height: 1,
                    color: Color.fromARGB(255, 36, 56, 155),
                    fontWeight: FontWeight(700),
                    fontFamily: 'Manrope'
                  ),
                ),
              ),
            )
          ],
        ),
  
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                CardCategoria(url: 'icon/ferramenta.png', tamanhoIcone: 4, titulo: 'Conserto', onTap: (){
                  Navigator.of(context).pushNamed(Rotas.consertos);
                }),
                CardCategoria(url: 'icon/aspirador.png', tamanhoIcone: 7, titulo: 'Limpeza', onTap: (){}),
                CardCategoria(url: 'icon/cabeca.png', tamanhoIcone: 4, titulo: 'Beleza', onTap: (){}),
                CardCategoria(url: 'icon/carro.png', tamanhoIcone: 7, titulo: 'Transporte', onTap: (){}),
                CardCategoria(url: 'icon/hamburger.png', tamanhoIcone: 7, titulo: 'Alimentação', onTap: (){}),
              ],
            ),
          ),
        )
      ],
    );
  }
}