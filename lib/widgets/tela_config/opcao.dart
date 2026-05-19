import 'package:flutter/material.dart';

class Opcao extends StatelessWidget {
  final String texto;
  final Function()? onTap;

  Opcao({
    required this.texto,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              texto,
              style: TextStyle(
                color: Color.fromARGB(255, 49, 49, 49),
                decoration: TextDecoration.none,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
        
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}