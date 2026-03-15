import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.red)
    );
  }
}
