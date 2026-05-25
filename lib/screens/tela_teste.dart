import 'package:flutter/material.dart';

class TelaTeste extends StatefulWidget {
  @override
  TelaTesteState createState() => TelaTesteState();
}

class TelaTesteState extends State<TelaTeste> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if(value == null || value.isEmpty) return null;

                final regex = RegExp(r'(?=.+[a-zA-Z])(?=.*@)');

                if(regex.hasMatch(value)) {
                  return "válido";
                } else {
                  return "inválido";
                }
              },
              autovalidateMode: AutovalidateMode.always,
            )
          )
        ],
      ),
    );
  }
}
