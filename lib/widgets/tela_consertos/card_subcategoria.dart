import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardSubcategoria extends StatelessWidget {
  final IconData icone;
  final double tamanhoIcone;
  final Color corTexto;
  final Color corFundo;
  final String titulo;
  final VoidCallback onTap;

  const CardSubcategoria({
    required this.icone,
    required this.tamanhoIcone,
    required this.corTexto,
    required this.corFundo,
    required this.titulo,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: corFundo,
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
              Icon(icone, size: tamanhoIcone, color: corTexto),
              SizedBox(width: 10),
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 20,
                  color: corTexto,
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