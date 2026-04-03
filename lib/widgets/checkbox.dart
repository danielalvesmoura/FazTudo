import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  @override
  CheckBoxState createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckBox> {
  bool termosAceitos = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: termosAceitos, 
      side: BorderSide(
        color: const Color.fromARGB(255, 120, 130, 139),
        width: 2,
      ),
      activeColor: Color.fromARGB(255, 36, 56, 155),
      onChanged: (value) {
        setState(() {
          termosAceitos = value!;
        });
      }
    );
  }
}