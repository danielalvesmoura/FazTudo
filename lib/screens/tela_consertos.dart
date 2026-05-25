import 'package:flutter/material.dart';
import 'package:flutter_application_1/dao/subcategoria_dao.dart';
import 'package:flutter_application_1/dto/servicos_tela_consertos_dto.dart';
import 'package:flutter_application_1/models/servico.dart';
import 'package:flutter_application_1/models/subcategoria.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:flutter_application_1/repository/usuario_repository.dart';
import 'package:flutter_application_1/screens/subcategoria/tela_lista_subcategorias.dart';
import 'package:flutter_application_1/screens/tela_avaliacoes.dart';
import 'package:flutter_application_1/repository/servico_repository.dart';
import 'package:flutter_application_1/sessao.dart';
import 'package:flutter_application_1/widgets/subcategorias/subcategorias_conserto.dart';
import 'package:flutter_application_1/widgets/tela_consertos/card_oferta.dart';

class TelaConsertos extends StatefulWidget {
  @override
  TelaConsertosState createState() => TelaConsertosState();
}

class TelaConsertosState extends State<TelaConsertos> {
  Sessao sessao = Sessao();

  List<ServicoTelaConsertosDTO> consertos = [];

  List<Subcategoria> subcategorias = [];

  SubcategoriaDAO subcategoriaDao = SubcategoriaDAO();
  ServicoRepository servicoRepository = ServicoRepository();
  UsuarioRepository usuarioRepository = UsuarioRepository();

  Future<void> preencheLista() async {
    List<Subcategoria> resultadoSubcategorias = await subcategoriaDao.getSubcategorias();
    List<ServicoTelaConsertosDTO> resultadoServicos = await servicoRepository.listaTodos();

    subcategorias = resultadoSubcategorias;
    consertos = resultadoServicos;

    setState(() {});
  }

  Future<String> retornaUsuarioId(Servico servico) async {
    Usuario usuario = await usuarioRepository.encontraPorId(servico.usuario_id);

    return usuario.nome;
  }

  @override
  void initState() {
    super.initState();
    preencheLista();
  }

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
                  fontWeight: FontWeight.w900
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
                      fontWeight: FontWeight.w700,
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
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
        
              SizedBox(height: 30),
        
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
                child: SubcategoriasConserto(subcategorias: subcategorias,)
              ),

              SizedBox(height: 10),

              if(sessao.usuarioLogado!.nome == "admin")
                TextButton(
                  onPressed: () async {
                    final reconstroi = await Navigator.of(context).push<bool>(
                      MaterialPageRoute(
                        builder: (_) => TelaListaSubcategorias()
                      ));

                    if(reconstroi == true) preencheLista();
                  }, 
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.edit, color: Color.fromARGB(255, 36, 56, 155), size: 20),

                      SizedBox(width: 10),

                      Text(
                        "Editar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 36, 56, 155),
                          fontSize: 20
                        ),
                      ),
                    ],
                  )
                ),
        
              SizedBox(height: 40),

              SizedBox(
                height: 650,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(ServicoTelaConsertosDTO servico in consertos)
                        Column(
                          children: [
                            CardOferta(
                              urlImagem: 'img/encanamento.png',
                              titulo: servico.titulo,
                              preco: 'R\$ ${servico.preco} / hora', 
                              descricao: servico.descricao,
                              usuario: servico.nomeUsuario,
                              avaliacao: servico.avaliacao != null ? servico.avaliacao : 0,
                              botaoAvaliacao: () async {
                                await Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => TelaAvaliacoes(
                                    servico: servico,
                                  ))
                                );

                                preencheLista();
                              },
                            ),
                            SizedBox(height: 60)
                          ],
                        ),
                    ],
                  )
                ),
              )
              
            ]
          )
        ),
        
      )
    );
  }
}

