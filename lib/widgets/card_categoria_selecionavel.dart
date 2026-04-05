import 'package:flutter/material.dart';

class CardCategoriaSelecionavel extends StatelessWidget {
  final String url;
  final double tamanhoIcone;
  final String titulo;
  final VoidCallback onTap;
  final bool selecionado;


  const CardCategoriaSelecionavel({
    required this.url,
    required this.tamanhoIcone,
    required this.titulo,
    required this.onTap,
    required this.selecionado,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 190,
        height: 190,
        decoration: BoxDecoration(
          border: Border.all(
            color: selecionado ? Color.fromARGB(255, 36, 56, 155) : Colors.white,
            width: 4
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(url, scale: tamanhoIcone,),

            SizedBox(height: 10),
      
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                height: 1.2,
                fontWeight: FontWeight.w800,
                fontFamily: 'Manrope'
              ),
            ),

          ]
        ),
      ),
    );
  }
}