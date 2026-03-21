import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/screens/rotas.dart';

class TelaLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back, 
            color: Color.fromARGB(255, 36, 56, 155),
            size: 40,
          )
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30
          ),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: Logo(
                  tamanho: 50, 
                  mainAxisAlignment: MainAxisAlignment.center,
                  corIcone: Color.fromARGB(255, 36, 56, 155),
                  corTexto: Color.fromARGB(255, 36, 56, 155),
                ),
              ),

              SizedBox(height: 50),

              Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 60,
                  fontWeight: FontWeight(700)
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Bem-vindo de volta! Por favor, insira seus dados.',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight(400)
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      }, 
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset('icon/icone-google.png',scale: 6,),
                            
                                SizedBox(width: 10),
                                
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    decoration: TextDecoration.none,
                                    fontSize: 22,
                                    fontWeight: FontWeight(400)
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                
                    ElevatedButton(
                      onPressed: () {
                      }, 
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset('icon/icone-apple.png',scale: 5,),
                            
                                SizedBox(width: 10),
                                
                                Text(
                                  'Apple',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    decoration: TextDecoration.none,
                                    fontSize: 22,
                                    fontWeight: FontWeight(400)
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              Text(
                'ou use seu e-mail',
                style: TextStyle(
                  color: const Color.fromARGB(255, 56, 56, 56),
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  fontWeight: FontWeight(400)
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),

              FormLogin()


            ]         
          ),
        )
      )
    );
  }
}

class FormLogin extends StatefulWidget {
  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _submit() {
    // if (_formKey.currentState!.validate() == true) {
    //   Navigator.of(context).pushNamed(Rotas.home);
    // }

    Navigator.of(context).pushNamed(Rotas.home);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'email@exemplo.com'
            ),

            validator: (value) {
              if(value == null) {
                return 'digite seu email';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

          TextFormField(
            controller: _senhaController,
            decoration: InputDecoration(
              labelText: 'Senha',
            ),
            obscureText: true,
          ),

          SizedBox(height: 50),

          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 36, 56, 155),
              minimumSize: Size(425, 75),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
      
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ],
            ) 
          ),
        
        ],
      ),
    );
  }
}