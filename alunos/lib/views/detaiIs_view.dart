import 'package:alunos/constants/constants.dart';
import 'package:alunos/service/aluno_service.dart';
import 'package:alunos/views/edit_view.dart';
import 'package:alunos/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:alunos/views/home_view.dart';
import 'package:alunos/model/aluno.dart';

class DetailsView extends StatelessWidget {
  static const String route = "details-view";
  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)!.settings.arguments as Aluno;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.indigo.shade900,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    const BoxDecoration(color: Color(0xffFFFFFF), boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                  ),
                ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name:   ${_arguments.nome}'),
                      const SizedBox(height: 10),
                      Text('Email:    ${_arguments.email}'),
                      const SizedBox(height: 10),
                      Text('Telefone:    ${_arguments.telefone}'),
                      const SizedBox(height: 10),
                      Text('Mensalidade:    R\$ ${_arguments.mensalidade},00'),
                      const SizedBox(height: 10),
                      Text(
                        _arguments.situacao == true
                            ? 'Situação:    Ativo'
                            : 'Situação:    Inativo',
                      ),
                      const SizedBox(height: 10),
                      Text('Observação:    ${_arguments.observacao}'),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextButton(
                    text: 'Editar',
                    func: () => Navigator.pushNamed(
                      context,
                      EditView.route,
                      arguments: _arguments,
                    ),
                  ),
                  CustomTextButton(
                    text: 'Deletar',
                    func: () {
                      AlunoService().deleteStudents(_arguments.id!.toInt());
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeView.route,
                        (route) => false,
                      );
                      showSnackBarOnSuccess(
                        context,
                        "Aluno excluído com sucesso!",
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
