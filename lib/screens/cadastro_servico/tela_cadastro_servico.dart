import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/servico.dart';
import 'package:flutter_application_1/screens/cadastro_servico/tela_cadastro_servico_categoria.dart';
import 'package:flutter_application_1/screens/cadastro_servico/tela_cadastro_servico_detalhes.dart';
import 'package:flutter_application_1/screens/cadastro_servico/tela_cadastro_servico_foto.dart';
import 'package:flutter_application_1/screens/cadastro_servico/tela_cadastro_servico_preco.dart';
import 'package:flutter_application_1/repository/servico_repository.dart';
import 'package:flutter_application_1/sessao.dart';

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

  Map<String, dynamic> servico = {
    "url": 'img/encanamento.png',
    "titulo": null,
    "preco": null,
    "descricao": null,
    "cep": null,
    "usuario_id": null
  };

  Sessao sessao = Sessao();

  @override
  void initState() {
    super.initState();
    servico["usuario_id"] = sessao.usuarioLogado!.id!;
  }

  void setTitulo(String titulo) {
    servico["titulo"] = titulo;
  }

  void setCep(String cep) {
    servico["cep"] = cep;
  }

  void setDescricao(String descricao) {
    servico["descricao"] = descricao;
  }

  void setPreco(double preco) {
    servico["preco"] = preco;
  }

  ServicoRepository servicoService = ServicoRepository();

  void finalizar() {
    Servico servicoObjeto = Servico.fromMap(servico);

    servicoService.cadastrar(servicoObjeto);

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 249, 255, 1),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            passo != 1 ? trocarTela(passo - 1) : Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_rounded, color: Color.fromARGB(255, 36, 56, 155), size: 40)
        ),
        title: Text('Passo $passo de 4',style: TextStyle(fontWeight: FontWeight.w700)),

        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: Icon(Icons.close, color: Color.fromARGB(255, 36, 56, 155), size: 40)
          )
        ],
      ),

      body: decideTela(passo, trocarTela, setTitulo, setCep, setDescricao, setPreco, finalizar),
      
    );
  }
}

Widget decideTela(passo, Function(int) trocarTela, Function(String) setTitulo, Function(String) setCep, 
Function(String) setDescricao, Function(double) setPreco, Function() finalizar) {
  switch (passo) {
    case 1:
      return TelaCadastroCategoria(trocarTela: trocarTela,);

    case 2:
      return TelaCadastroFoto(trocarTela: trocarTela);

    case 3:
      return TelaCadastroServicoDetalhes(
        trocarTela: trocarTela, 
        setTitulo: setTitulo, 
        setCep: setCep,
        setDescricao: setDescricao,
      );

    case 4:
      return TelaCadastroServicoPreco(
        trocarTela: trocarTela,
        setPreco: setPreco,
        finalizar: finalizar,
      );

    case 5:
      return Container();

    case 6:
      return Container();

    default:
      return TelaCadastroCategoria(trocarTela: trocarTela,);
  }
}

