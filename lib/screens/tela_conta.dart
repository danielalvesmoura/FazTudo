import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/logo.dart';

class TelaConta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(tamanho: 100),

          SizedBox(height: 40),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: Text('Entrar em uma conta existente'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              minimumSize: Size(250, 50),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            child: Text('Cadastrar uma nova conta'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              minimumSize: Size(250, 50),
            ),
          ),
        ],
      ),
    );
  }
}
