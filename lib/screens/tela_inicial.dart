import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/botao.dart';
import 'package:flutter_application_1/screens/rotas.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/fundo_tela_inicial.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          width: double.infinity,

          height: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent],
            ),
          ),
        ),

        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(
                  tamanho: 100,
                  mainAxisAlignment: MainAxisAlignment.start,
                  corIcone: Color.fromARGB(255, 0, 140, 255),
                  corTexto: Colors.white,
                ),

                SizedBox(height: 40),

                Text(
                  'Tudo o que você precisa em um só lugar',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: 40),

                Text(
                  'Conectamos você aos melhores profissionais da sua região para transformar sua casa com confiança e agilidade.',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 182, 182, 182),
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    height: 1.9,
                  ),
                ),

                SizedBox(height: 60),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Rotas.teste);
                  },

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
                            'Começar agora',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),

                          Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Rotas.login);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(92, 129, 129, 129),
                    minimumSize: Size(425, 75),
                    side: BorderSide(
                      color: const Color.fromARGB(59, 255, 255, 255),
                    ),
                  ),
                  child: Text(
                    'Já tenho uma conta',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
