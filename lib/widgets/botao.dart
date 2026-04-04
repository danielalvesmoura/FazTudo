import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final double width;
  final double height;
  final String texto;
  final VoidCallback onPressed;
  
  const Botao({
    required this.width,
    required this.height,
    required this.texto,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
    
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 36, 56, 155),
        minimumSize: Size(width, height),
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
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ],
      ) 
    );
  }
}