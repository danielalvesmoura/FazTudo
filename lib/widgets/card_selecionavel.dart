import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardSelecionavel extends StatelessWidget {
  final IconData? icone;
  final double tamanhoIcone;
  final double borderRadius;
  final String titulo;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final VoidCallback onTap;
  final bool selecionado;

  final Color corFundoSelecionado;
  final Color corFundoNaoSelecionado;
  final Color corBordaSelecionado;
  final Color corBordaNaoSelecionado;
  final Color corTextoSelecionado;
  final Color corTextoNaoSelecionado;

  const CardSelecionavel({
    this.icone,

    required this.corFundoSelecionado,
    required this.corFundoNaoSelecionado,
    required this.corBordaSelecionado,
    required this.corBordaNaoSelecionado,
    required this.corTextoSelecionado,
    required this.corTextoNaoSelecionado,
    required this.borderRadius,

    required this.tamanhoIcone,
    required this.titulo,
    required this.fontWeight,
    required this.height,
    required this.width,
    required this.onTap,
    required this.selecionado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(
          color: selecionado ? corBordaSelecionado : corBordaNaoSelecionado,
          width: 2
        )),
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: selecionado ? corFundoSelecionado : corFundoNaoSelecionado,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                colocaIcone(icone != null ? true : false, icone, tamanhoIcone, selecionado),
      
                SizedBox(width: icone != null ? 10 : 0),
      
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 20,
                    color: selecionado ? corTextoSelecionado : corTextoNaoSelecionado,
                    height: 1.6,
                    fontWeight: fontWeight
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget colocaIcone(temIcone, icone, tamanhoIcone, selecionado) {
  if(temIcone) {
    return Icon(
      icone,
      size: tamanhoIcone,
      color: selecionado ? Colors.white : const Color.fromARGB(255, 75, 75, 75),
    );
  } else {
    return SizedBox(height: 0, width: 0,);
  }

}