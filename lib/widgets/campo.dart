import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Campo extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final int minLines;
  final int maxLines;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  Campo({
    required this.label,
    required this.hint,
    required this.icon,
    required this.minLines,
    required this.maxLines,
    this.formatters,
    this.controller,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color.fromARGB(255, 65, 65, 65),
            decoration: TextDecoration.none,
            fontSize: 17,
            fontWeight: FontWeight.w700 
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          inputFormatters: formatters,
          controller: controller,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),

            hint: Text(
              hint,
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 120, 130, 139)
              ),
            ),

            prefixIcon: icon == null ? null : Icon(icon, color: const Color.fromARGB(255, 120, 130, 139))

          ),
        )
      ],
    );
  }
}