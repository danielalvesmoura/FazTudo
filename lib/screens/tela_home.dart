import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/logo.dart';

class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.blue, size: 40),
            SizedBox(width: 5),
            Text(
              'Faz',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 90, 163),
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue, size: 40),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.blue, size: 40),
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar serviços',
                prefixIcon: Icon(Icons.search),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 218, 218, 218),
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 218, 218, 218),
                  ),
                ),

                filled: true,
                fillColor: const Color.fromARGB(255, 209, 209, 209),
              ),
            ),

            SizedBox(height: 20),

            Container(
              child: Column(
                children: [
                  Text(
                    'Categorias',
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
