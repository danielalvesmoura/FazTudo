import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final double width;
  final double height;
  final String texto;
  final Color corTexto;
  final Color corFundo;
  final bool borda;
  final double fontSize;
  final VoidCallback onPressed;
  
  const Botao({
    required this.width,
    required this.height,
    required this.texto,
    required this.corTexto,
    required this.corFundo,
    required this.borda,
    required this.onPressed,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
    
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: corFundo,
        minimumSize: Size(width, height),
        side: borda ? BorderSide(color: const Color.fromARGB(255, 150, 150, 150)) : BorderSide.none
      ),

      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                texto,
                style: TextStyle(
                  fontSize: fontSize,
                  color: corTexto
                ),
              ),
            ],
          ),
        ],
      ) 
    );
  }
}