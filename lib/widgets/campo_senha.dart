import 'package:flutter/material.dart';

class CampoSenha extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;

  CampoSenha({
    required this.label,
    required this.hint,
    required this.icon,
  });

  @override
  CampoSenhaState createState() => CampoSenhaState();
}

class CampoSenhaState extends State<CampoSenha> {
  late String label;
  late String hint;
  late IconData icon;

  @override
  void initState() {
    super.initState();
    label = widget.label;
    hint = widget.hint;
    icon = widget.icon;
  }

  bool mostrarSenha = false;

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
          obscureText: !mostrarSenha,
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

            prefixIcon: Icon(icon, color: const Color.fromARGB(255, 120, 130, 139)),
            
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    mostrarSenha = !mostrarSenha;
                  });
                }, 
                icon: Icon(
                  mostrarSenha ? Icons.visibility_off_outlined : Icons.visibility_outlined, 
                  color: const Color.fromARGB(255, 120, 130, 139)
                )
              ),
            )

          ),
        )
      ],
    );
  }
}