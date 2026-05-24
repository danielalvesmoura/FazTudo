class Regex {
  final emailRegex = RegExp(
    r'^[^@]+@[^@]+\.[^@]+$',
  );

  final senhaRegex = RegExp(
    r'^(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
  );

  final cepRegex = RegExp(
    r'^\d{5}-\d{3}$',
  );

  final telefoneRegex = RegExp(
    r'^\(\d{2}\)\s\d{4,5}-\d{4}$',
  );
  

  bool validarEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  bool validarSenha(String senha) {
    return senhaRegex.hasMatch(senha);
  }

  bool validarCep(String cep) {
    return cepRegex.hasMatch(cep);
  }

  bool validarTelefone(String telefone) {
    return telefoneRegex.hasMatch(telefone);
  }
}