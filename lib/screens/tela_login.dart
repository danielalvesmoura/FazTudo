import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/logo.dart';

class TelaLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: 
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [

                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(
                      Icons.arrow_back, 
                      color: Colors.white
                    )
                  ),

                  SizedBox(width: 10,),
            
                  Text(
                    'Entrar',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20
                    ),
                  ),

                ],
              ),
            ),
          leadingWidth: 700,
          actions: [
            Logo(tamanho: 30)
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              Text(
                'Entre na sua conta e começe seus negócios!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              Text(
                'Acesse e aproveite toda a experiência do Faz!',
                style: TextStyle(
                  fontWeight: FontWeight.w600, 
                  fontSize: 15,
                  color: Colors.grey
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40,),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome de usuário ou E-mail',
                        border: OutlineInputBorder()
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        )
      )
    );
  }
}
