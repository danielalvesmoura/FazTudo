import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CardSlotParaFoto extends StatelessWidget {
  final String url;
  final VoidCallback onTap;

  CardSlotParaFoto({
    required this.url,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: defineConteudo(url)
    );
  }
}

Widget defineConteudo(String url) {
  if (url == "") {
    return SizedBox(
      height: 100, 
      width: 100, 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: [10, 4],
          color: Colors.grey,
          radius: Radius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(244, 229, 229, 235),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: const Color.fromARGB(255, 128, 128, 128),
              ),
            ),
          ),
        )
      ),
    );
    
    
    
  } else {
    // return Image.asset(url, fit: BoxFit.cover);
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 202, 202, 202), width: 2),
            borderRadius: BorderRadius.circular(20)
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.network(url)
          )
        ),
      ],
    );
  }
}
