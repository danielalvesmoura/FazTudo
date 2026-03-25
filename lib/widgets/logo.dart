import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double tamanho;
  final MainAxisAlignment mainAxisAlignment;
  final Color corIcone;
  final Color corTexto;

  const Logo({
    super.key, 
    required this.tamanho,
    required this.mainAxisAlignment,
    required this.corIcone,
    required this.corTexto
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Icon(Icons.location_on, size: tamanho, color: corIcone),
          Text(
            'Faz',
            style: TextStyle(
              color: corTexto,
              decoration: TextDecoration.none,
              fontSize: tamanho * .75,
              fontWeight: FontWeight.w800
            ),
          ),
        ],
      ),
    );
  }
}
