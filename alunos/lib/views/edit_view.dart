import 'package:alunos/constants/constants.dart';
import 'package:alunos/model/aluno.dart';
import 'package:alunos/service/aluno_service.dart';
import 'package:alunos/utils/validator.dart';
import 'package:alunos/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:alunos/widgets/text_field.dart';

class EditView extends StatefulWidget {
  static const String route = "edit-view";

  const EditView({
    Key? key,
  });
  @override
  _EditViewState createState() => _EditViewState();
}

class _EditViewState extends State<EditView> with Validator {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)!.settings.arguments as Aluno;
    final _nomeController = TextEditingController(text: _arguments.nome);
    final _emailController = TextEditingController(text: _arguments.email);
    final _telefoneController =
        TextEditingController(text: _arguments.telefone);
    final _mensalidadeController =
        TextEditingController(text: _arguments.mensalidade.toString());
    final _senhaController = TextEditingController(text: _arguments.senha);
    final _observacaoController =
        TextEditingController(text: _arguments.observacao);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo.shade900,
        elevation: 0.0,
        title: const Text(
          'Editar Aluno',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Textfield(
                  hintText: 'Nome',
                  controller: _nomeController,
                  icon: const Icon(Icons.account_box),
                  hintStyle: const TextStyle(),
                  textInputType: TextInputType.name,
                  onChanged: (val) => _nomeController.text = val,
                  validator: nomeValidate,
                ),
                Textfield(
                  controller: _emailController,
                  hintText: "Email",
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.mail_outline),
                  textInputType: TextInputType.emailAddress,
                  onChanged: (val) => _emailController.text = val,
                  validator: emailValidate,
                ),
                Textfield(
                  hintText: "Telefone",
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.phone),
                  controller: _telefoneController,
                  textInputType: TextInputType.phone,
                  onChanged: (val) => _telefoneController.text = val,
                  validator: telefoValidate,
                ),
                Textfield(
                  hintText: "Mensalidade",
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.monetization_on),
                  controller: _mensalidadeController,
                  textInputType: TextInputType.number,
                  onChanged: (val) => _mensalidadeController.text = val,
                  validator: mensalidadeValidate,
                ),
                Textfield(
                  hintText: "Senha",
                  hintStyle: const TextStyle(),
                  textInputType: TextInputType.text,
                  icon: IconButton(
                    icon:
                        Icon(obscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                  controller: _senhaController,
                  obscure: obscure,
                  onChanged: (val) => _senhaController.text = val,
                  validator: senhaValidate,
                ),
                Textfield(
                  hintText: "Observação",
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.info),
                  controller: _observacaoController,
                  textInputType: TextInputType.text,
                  onChanged: (val) => _observacaoController.text = val,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _arguments.situacao as bool ? 'Ativo' : 'Inativo',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      value: _arguments.situacao as bool,
                      onChanged: (_) {
                        if (situacao != _arguments.situacao) {
                          setState(() {
                            _arguments.situacao = situacao;
                          });
                        } else {
                          setState(() {
                            _arguments.situacao = !situacao;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.indigo),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AlunoService().editStudents(
                          _arguments.id!.toInt(),
                          nome: _nomeController.text,
                          email: _emailController.text,
                          telefone: _telefoneController.text,
                          mensalidade:
                              int.tryParse(_mensalidadeController.text),
                          senha: _senhaController.text,
                          situacao: _arguments.situacao,
                          observacao: _observacaoController.text,
                        );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeView.route,
                          (route) => false,
                        );
                        showSnackBarOnSuccess(
                          context,
                          'Informações atualizadas com sucesso!',
                        );
                      }
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
