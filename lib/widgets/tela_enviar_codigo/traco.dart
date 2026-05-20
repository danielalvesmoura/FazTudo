import 'package:flutter/material.dart';

class Traco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "-",
        style: TextStyle(
          decoration: TextDecoration.none,
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 50
        ),
      ),
    );
  }
}