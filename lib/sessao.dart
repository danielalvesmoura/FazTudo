import 'package:flutter_application_1/models/usuario.dart';

class Sessao {
  static final Sessao _instancia = Sessao._construtor();

  factory Sessao() {
    return _instancia;
  }

  Sessao._construtor();

  Usuario? usuarioLogado;
}