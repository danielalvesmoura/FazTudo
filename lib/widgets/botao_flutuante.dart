import 'package:flutter/material.dart';

class BotaoFlutuante extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String texto;
  final double bottom;
  final bool enabled;

  BotaoFlutuante({
    required this.onPressed,
    required this.icon,
    required this.texto,
    required this.bottom,
    required this.enabled
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: FloatingActionButton(
            backgroundColor: enabled ? Color.fromARGB(255, 36, 56, 155) : Color.fromARGB(255, 158, 174, 255),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60)
            ),
            onPressed: () => enabled ? onPressed() : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30),
                SizedBox(width: 10),
                Text(texto, style: TextStyle(fontSize: 25))
              ],
            ),
          ),
        ),
      ),
    );
  }
}