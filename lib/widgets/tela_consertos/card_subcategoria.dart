import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardSubcategoria extends StatelessWidget {
  final IconData? icone;
  final double tamanhoIcone;
  final String titulo;
  final VoidCallback onTap;
  final bool selecionado;

  const CardSubcategoria({
    this.icone,
    required this.tamanhoIcone,
    required this.titulo,
    required this.onTap,
    required this.selecionado,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: selecionado ? Color.fromARGB(255, 36, 56, 155) : const Color.fromARGB(255, 209, 209, 209),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5
          ),
          child: Row(
            children: [
              colocaIcone(icone != null ? true : false, icone, tamanhoIcone, selecionado),

              SizedBox(width: icone != null ? 10 : 0),

              Text(
                titulo,
                style: TextStyle(
                  fontSize: 20,
                  color: selecionado ? Colors.white : const Color.fromARGB(255, 75, 75, 75),
                  height: 1.6,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
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