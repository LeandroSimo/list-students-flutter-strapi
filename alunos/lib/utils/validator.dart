import 'package:alunos/utils/validator_utils.dart';

class Validator {
  String? nomeValidate(text) {
    if (text.isEmpty) {
      return 'Nome Inválido!';
    }
    return null;
  }

  String? emailValidate(String? text) {
    if (text!.isEmpty) {
      return 'E-mail Inválido!';
    }
    if (!text.contains('@')) {
      return 'O e-mail deve conter \'@\'';
    }
    if (text.isValidEmail() == false) {
      return 'O e-mail está incorreto';
    }
    return null;
  }

  String? telefoValidate(text) {
    if (text.isEmpty) {
      return 'Telefone Inválido!';
    }
    return null;
  }

  String? mensalidadeValidate(text) {
    if (text.isEmpty) {
      return 'Valor Inválido!';
    }
    return null;
  }

  String? senhaValidate(text) {
    if (text.isEmpty) {
      return 'Senha Inválida!';
    }
    return null;
  }
}
