import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CardSlotParaFoto extends StatelessWidget {
  final String url;

  CardSlotParaFoto({required this.url});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
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
    );
  }
}
