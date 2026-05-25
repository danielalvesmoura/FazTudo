import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/gerenciamento_conta/tela_trocar_nome.dart';
import 'package:flutter_application_1/screens/rotas.dart';
import 'package:flutter_application_1/sessao.dart';
import 'package:flutter_application_1/widgets/tela_config/opcao.dart';
import 'package:flutter_application_1/widgets/tela_config/separador.dart';
import 'package:flutter_application_1/widgets/tela_config/titulo_opcoes.dart';

class TelaConfig extends StatefulWidget {
  @override
  TelaConfigState createState() => TelaConfigState();
}

class TelaConfigState extends State<TelaConfig> {
  Sessao sessao = Sessao();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 40),

              SizedBox(width: 10,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sessao.usuarioLogado!.nome,
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 22,
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
      
                  Text(
                    "Meu perfil",
                    style: TextStyle(
                      color: Color.fromARGB(255, 36, 56, 155),
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),

          Separador(),

          TituloOpcoes(texto: "PAGAMENTOS"),

          Opcao(
            texto: "Carrinho",
            onTap: () => {},
          ),

          Opcao(
            texto: "Gerenciar pagamentos",
            onTap: () => {},
          ),

          Opcao(
            texto: "Formas de pagamento",
            onTap: () => {},
          ),

          Separador(),

          TituloOpcoes(texto: "COMPRAR NA FAZ"),

          Opcao(
            texto: "Favoritos",
            onTap: () => {},
          ),

          Opcao(
            texto: "Buscas salvas",
            onTap: () => {},
          ),

          Opcao(
            texto: "Minhas compras",
            onTap: () => {},
          ),

          Separador(),

          TituloOpcoes(texto: "CONTA"),

          Opcao(
            texto: "Trocar nome de usuário",
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => TelaTrocarNome())
              );
              
              setState(() {});
            }
            
            ,
          ),

          Opcao(
            texto: "Trocar senha",
            onTap: () => Navigator.of(context).pushNamed(Rotas.trocarSenha),
          ),

          Opcao(
            texto: "Trocar email",
            onTap: () => Navigator.of(context).pushNamed(Rotas.enviarCodigo),
          ),

          Opcao(
            texto: "Excluir conta",
            onTap: () => Navigator.of(context).pushNamed(Rotas.excluirConta),
          ),

          Opcao(
            texto: "Sair",
            onTap: () {
              Navigator.of(context).pop(context);
              Navigator.of(context).pop(context);
            },
          ),

        ],
      ),
    );
  }
}