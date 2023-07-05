import 'package:alunos/constants/constants.dart';
import 'package:alunos/service/aluno_service.dart';
import 'package:alunos/utils/validator.dart';
import 'package:alunos/views/home_view.dart';
import 'package:alunos/widgets/text_field.dart';
import 'package:flutter/material.dart';

class CreateView extends StatefulWidget {
  static const String route = "create-view";

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> with Validator {
  final _formKey = GlobalKey<FormState>();

  _clear() {
    nomeController.clear();
    emailController.clear();
    telefoneController.clear();
    senhaController.clear();
    mensalidadeController.clear();
    observacaoController.clear();
    if (situacao) {
      setState(() {
        situacao = !situacao;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //  print(widget.id);
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
          'Criar Aluno',
          style: TextStyle(color: Colors.white),
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
                  controller: nomeController,
                  icon: const Icon(Icons.account_box),
                  hintStyle: const TextStyle(),
                  textInputType: TextInputType.name,
                  validator: nomeValidate,
                ),
                Textfield(
                  controller: emailController,
                  hintText: 'Email',
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.mail_outline),
                  textInputType: TextInputType.emailAddress,
                  validator: emailValidate,
                ),
                Textfield(
                  hintText: 'Telefone',
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.phone),
                  controller: telefoneController,
                  textInputType: TextInputType.phone,
                  validator: telefoValidate,
                ),
                Textfield(
                  hintText: 'Mensalidade',
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.monetization_on),
                  controller: mensalidadeController,
                  textInputType: TextInputType.number,
                  validator: mensalidadeValidate,
                ),
                Textfield(
                  hintText: 'Senha',
                  hintStyle: const TextStyle(),
                  icon: IconButton(
                    icon:
                        Icon(obscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                  controller: senhaController,
                  obscure: obscure,
                  textInputType: TextInputType.text,
                  validator: senhaValidate,
                ),
                Textfield(
                  hintText: 'Observação',
                  hintStyle: const TextStyle(),
                  icon: const Icon(Icons.info),
                  controller: observacaoController,
                  textInputType: TextInputType.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      situacao ? 'Ativo' : 'Inativo',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      value: situacao,
                      onChanged: (_) {
                        setState(() {
                          situacao = !situacao;
                        });
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
                        AlunoService().createStudents();
                        _clear();
                        showSnackBarOnSuccess(
                          context,
                          'Aluno criado com sucesso!',
                        );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeView.route,
                          (route) => false,
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
