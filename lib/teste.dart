import 'package:flutter/material.dart';

main() {
  runApp(AppTeste());
}

class AppTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.location_on, 
              color: Colors.blue, 
              size: 40,
            ),
            SizedBox(width: 5),
            Text(
              'Faz', 
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 90, 163),
                fontWeight: FontWeight(900),
                fontSize: 30
              )
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.blue,
              size: 40
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              Icons.menu, 
              color: Colors.blue, 
              size: 40,
            ),
            onPressed: () {

            },
          ),
        ]
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar serviço',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                )
              ),
            )
          ],
        )
      )

    );
  }
}