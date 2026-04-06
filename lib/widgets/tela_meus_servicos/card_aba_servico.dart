import 'package:flutter/material.dart';

class CardAbaServico extends StatelessWidget {
  final String titulo;
  final bool selecionado;
  final VoidCallback onTap;
  final int width;

  CardAbaServico({
    required this.titulo,
    required this.selecionado,
    required this.onTap,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Text(
              titulo, 
              style: TextStyle(
                color: Color.fromARGB(255, 36, 56, 155),
                fontWeight: FontWeight.w700,
                fontSize:25
              ),
            ),

            SizedBox(height: 20,),
            
            insereLinha(selecionado, width)
          ],
        ),
      ),
    );
  }
}

Widget insereLinha(selecionado, width) {
  if(selecionado) {
    return Container(
      color: Color.fromARGB(255, 36, 56, 155),
      width: width,
      height: 3,
    );
  } else {
    return Container(
      width: width,
      height: 3,
    );
  }
}
