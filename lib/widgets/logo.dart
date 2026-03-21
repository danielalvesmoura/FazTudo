import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double tamanho;

  const Logo({super.key, required this.tamanho});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on, size: tamanho, color: Colors.white),
          Text(
            'Faz',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: tamanho * .75,
            ),
          ),
        ],
      ),
    );
  }
}
