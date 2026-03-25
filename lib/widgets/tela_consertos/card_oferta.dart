import 'package:flutter/material.dart';

class CardOferta extends StatelessWidget {
  final String urlImagem;
  final String titulo;
  final String preco;
  final String descricao;
  final String usuario;

  const CardOferta({
    super.key, 
    required this.urlImagem, 
    required this.titulo, 
    required this.preco, 
    required this.descricao, 
    required this.usuario
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            urlImagem,
            height: 200,
            width: 400,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    height: 1.3,
                    fontWeight: FontWeight.w700
                  ),
                ),
            
                Text(
                  preco,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    height: 1.6,
                    fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  descricao,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    height: 1.6,
                    fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        Icon(Icons.person_pin),

                        SizedBox(width: 10),

                        Text(
                          usuario,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.6,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),

                    ElevatedButton(
                      onPressed: (){}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 36, 56, 155)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.shopping_bag_outlined, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Encomendar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                height: 1.6,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ]
                        ),
                      ),
                    )
                  ],
                )
            
              ],
            ),
          )    
        ]
      ),
    );
  }
}