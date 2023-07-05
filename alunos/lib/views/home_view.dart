import 'package:alunos/service/aluno_service.dart';
import 'package:alunos/views/create_view.dart';
import 'package:alunos/views/detaiIs_view.dart';
import 'package:alunos/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

import 'package:alunos/model/aluno.dart';

class HomeView extends StatelessWidget {
  static const String route = "/";
  _showSnackBarOnFail(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red[800],
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alunos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.indigo.shade900,
        actions: [
          SizedBox(
            width: 110,
            child: CustomTextButton(
                text: 'Adicionar',
                func: () => Navigator.pushNamed(context, CreateView.route)),
          )
        ],
      ),
      body: FutureBuilder(
        future: AlunoService().fetchStudents(),
        builder: (context, AsyncSnapshot<List<Aluno>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print(
                '[LOG: ERRO NO SNAPSHOT DA LISTA DE ALUNOS]: ${snapshot.error}');
            return _showSnackBarOnFail(
                context, "Erro ao exibir lista de alunos");
          } else {
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text("Não há alunos cadastrados!"),
                  )
                : ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, index) {
                      final aluno = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              foregroundColor: aluno.situacao == true
                                  ? Colors.greenAccent.shade700
                                  : Colors.pink,
                              child: Text(
                                  aluno.nome!.substring(0, 1).toUpperCase()),
                            ),
                            trailing: Text(
                              aluno.situacao == true
                                  ? 'Status:    Ativo'
                                  : 'Status:    Inativo',
                            ),
                            title: Text(aluno.nome.toString()),
                            subtitle: Text(aluno.email.toString()),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DetailsView.route,
                                arguments: snapshot.data![index],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
