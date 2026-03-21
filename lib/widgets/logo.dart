import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double tamanho;
  final MainAxisAlignment mainAxisAlignment;

  const Logo({
    super.key, 
    required this.tamanho,
    required this.mainAxisAlignment
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Icon(Icons.location_on, size: tamanho, color: const Color.fromARGB(255, 0, 140, 255)),
          Text(
            'Faz',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: tamanho * .75,
              fontFamily: 'Manrope'
            ),
          ),
        ],
      ),
    );
  }
}
