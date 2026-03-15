import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titulo', style: TextStyle(color: Colors.white)),backgroundColor: Colors.red,
      ),

      body: Text('Contador: $contador.'),

      floatingActionButton: 
        FloatingActionButton(
          onPressed: () => {
            setState(() {
              contador++;
            })
          },

          backgroundColor: Colors.red,
        
        ),

    );
  }
}