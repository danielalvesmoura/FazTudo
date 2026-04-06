import 'package:flutter/material.dart';

class Campo extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;

  Campo({
    required this.label,
    required this.hint,
    required this.icon,
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
        TextField(
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

            prefixIcon: Icon(icon, color: const Color.fromARGB(255, 120, 130, 139))

          ),
        )
      ],
    );
  }
}