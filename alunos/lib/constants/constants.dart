import 'package:flutter/material.dart';

String apiKey =
    "6d04608271334b2f59760bdb610e9fadd04d29563e0b5e69c0c7ade0a279d6f61018418654f5bf104ffe57b3e49c62b83f80a93f3307d52a3c7fccc09666ce19e00a70b0ef8f38d77ea3f040e5b4407a54765540b71e4765f55c6b705f77f71fe9cbc0b0d7bd411d3a8f9b2b4b7383b271e43b4afa9b42c348f8acc6ced12945";

final nomeController = TextEditingController();
final emailController = TextEditingController();
final telefoneController = TextEditingController();
final mensalidadeController = TextEditingController();
final senhaController = TextEditingController();
final observacaoController = TextEditingController();
bool situacao = false;
bool obscure = true;

showSnackBarOnSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 3),
    ),
  );
}
