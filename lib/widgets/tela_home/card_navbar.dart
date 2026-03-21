import 'package:flutter/material.dart';

class CardNavbar extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double size;
  final String titulo;
  final Color cor;

  const CardNavbar({
    required this.onTap,
    required this.icon,
    required this.size,
    required this.titulo,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        width: 120,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: size, color: cor),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 15,
                height: 1,
                color: cor,
                fontWeight: FontWeight(700),
                fontFamily: 'Manrope'
              ),
            ),
          ],
        ),
      ),
    );
  }
}