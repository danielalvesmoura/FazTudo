import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastro_servico/tela_cadastro_servico_categoria.dart';
import 'package:flutter_application_1/screens/cadastro_servico/tela_cadastro_servico_foto.dart';
import 'package:flutter_application_1/screens/rotas.dart';
import 'package:flutter_application_1/widgets/botao_flutuante.dart';
import 'package:flutter_application_1/widgets/card_categoria.dart';
import 'package:flutter_application_1/widgets/cadastro_servico/card_categoria_selecionavel.dart';

class TelaCadastroServico extends StatefulWidget {
  @override
  TelaCadastroServicoState createState() => TelaCadastroServicoState();
}



class TelaCadastroServicoState extends State<TelaCadastroServico> {
  int passo = 1;
  
  void trocarTela(passo) {
    setState(() {
      this.passo = passo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            passo != 1 ? trocarTela(passo - 1) : Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_rounded, color: Color.fromARGB(255, 36, 56, 155), size: 40)
        ),
        title: Text('Passo $passo de 6',style: TextStyle(fontWeight: FontWeight.w700)),

        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: Icon(Icons.close, color: Color.fromARGB(255, 36, 56, 155), size: 40)
          )
        ],
      ),

      body: decideTela(passo, trocarTela),
      
    );
  }
}

Widget decideTela(passo, Function(int) trocarTela) {
  switch (passo) {
    case 1:
      return TelaCadastroCategoria(trocarTela: trocarTela,);

    case 2:
      return TelaCadastroFoto(trocarTela: trocarTela);

    default:
      return TelaCadastroCategoria(trocarTela: trocarTela,);
  }
}

