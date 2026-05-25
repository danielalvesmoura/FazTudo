import 'package:flutter/material.dart';

class TelaTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          ),
        ],
      )
    );
  }
}
