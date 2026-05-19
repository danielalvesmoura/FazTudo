import 'package:flutter/material.dart';

class Separador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}