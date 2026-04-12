import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelaTeste extends StatefulWidget {
  @override
  TelaTesteState createState() => TelaTesteState();
}

class TelaTesteState extends State<TelaTeste> {
  ImagePicker picker = ImagePicker();
  XFile? imagem;  

  Future<void> pegarImagem() async {
    XFile? arquivo = await picker.pickImage(source: ImageSource.gallery);

    if(arquivo != null) {
      setState(() {
        imagem = arquivo;
      });
    }
  }

  final formatter = CurrencyTextInputFormatter.currency(
    locale: 'pt_BR',
    symbol: 'R\$'
  );

  final formatter2 = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')}
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          retornaImagem(imagem),
          ElevatedButton(onPressed: pegarImagem, child: Text('selecionar imagem')),
          TextField(
            inputFormatters: [formatter2],
          )
        ],
      ),
    );
  }
}

Widget retornaImagem(imagem) {
  if(imagem != null) {
    return Image.network(imagem!.path);
  } else {
    return SizedBox();
  }
}