import 'package:flutter/material.dart';

class CampoCodigo extends StatelessWidget {
  final TextEditingController controller;

  CampoCodigo({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 300,
        width: 61,
        child: Material(
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if(controller.text.isEmpty) return "";
            },
            maxLength: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              height: 0
            ),
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 36, 56, 155)
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}