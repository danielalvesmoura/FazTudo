import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class CardAvaliacao extends StatelessWidget {
  final String usuario;
  final double nota;
  final DateTime data;
  final String descricao;
  final bool autor;
  final Function() botaoDeletar;

  CardAvaliacao({
    required this.usuario,
    required this.nota,
    required this.data,
    required this.descricao,
    required this.autor,
    required this.botaoDeletar
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              usuario,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                decoration: TextDecoration.none,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),

            if(autor)
              IconButton(
                onPressed: botaoDeletar, 
                icon: Icon(
                  Icons.delete_outlined, 
                  color: Colors.red
                )
              )
          ],
        ),

        SizedBox(height: 10,),

        Row(
          children: [
            RatingBarIndicator(
              itemBuilder: (_,_) => Icon(Icons.star, color: Colors.amber,), 
              rating: nota,
              itemSize: 20,
            ),

            Text(
              "  -  ${DateFormat('dd/MM/yyyy').format(DateTime(data.year, data.month, data.day))}",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                decoration: TextDecoration.none,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        SizedBox(height: 20,),

        Text(
          descricao,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            decoration: TextDecoration.none,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}