import 'package:flutter/material.dart';

class CardNavbar extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double size;
  final String titulo;
  final bool selecionado;

  const CardNavbar({
    required this.onTap,
    required this.icon,
    required this.size,
    required this.titulo,
    required this.selecionado,
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
            Icon(
              icon, 
              size: size, 
              color: selecionado ? Color.fromARGB(255, 36, 56, 155) : Color.fromARGB(255, 146, 150, 172)
            ),

            Text(
              titulo,
              style: TextStyle(
                fontSize: 15,
                height: 1,
                color: selecionado ? Color.fromARGB(255, 36, 56, 155) : Color.fromARGB(255, 146, 150, 172),
                fontWeight: FontWeight.w700,
                fontFamily: 'Manrope'
              ),
            ),
          ],
        ),
      ),
    );
  }
}