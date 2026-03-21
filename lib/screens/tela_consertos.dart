import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/widgets/logo.dart';


class TelaConsertos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [

            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios, 
                size: 30, 
                color: Color.fromARGB(255, 36, 56, 155)
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Consertos',
                style: TextStyle(
                  color: Color.fromARGB(255, 36, 56, 155),
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  fontWeight: FontWeight(900)
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [

          SizedBox(width: 10,),

          IconButton(
            icon: Icon(Icons.notifications, color: Color.fromARGB(255, 36, 56, 155), size: 35),
            onPressed: () {},
          ),
          
          IconButton(
            icon: Icon(Icons.menu, color: Color.fromARGB(255, 36, 56, 155), size: 40),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
        
              SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Text.rich(
                  TextSpan(
                    text: 'Resolva tudo',
                    style: TextStyle(
                      fontWeight: FontWeight(700),
                      letterSpacing: 0,
                      height: 1.2,
                      fontSize: 50,
                    ),
                    children: [
                      TextSpan(
                        text: ' num instante.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 36, 56, 155),
                          fontStyle: FontStyle.italic
                        )
                      ),
                    ]
                  )
                ),
              ),
        
              SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Profissionais verificados e prontos para atender suas necessidades domésticas com garantia e segurança.',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 75, 75, 75),
                    height: 1.6,
                    fontWeight: FontWeight(500)
                  ),
                ),
              ),
        
              SizedBox(height: 20),
        
              TextField(
                decoration: InputDecoration(
                  hintText: 'O que você precisa consertar hoje?',
                  prefixIcon: Icon(Icons.search),
        
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 218, 218, 218),
                    ),
                  ),
        
                  enabledBorder: InputBorder.none
        
                ),
              ),
        
              SizedBox(height: 40),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    
                  ],
                ),
              )
            ]
          )
        )
      )
    );
  }
}