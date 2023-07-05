import 'package:alunos/api/api_source.dart';
import 'package:alunos/constants/constants.dart';
import 'package:alunos/model/aluno.dart';
import 'package:alunos/service/aluno_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert' as convert;

// void main() {
//   test('deve retorar uma lista de Alunoa', () async {
//     expect(await AlunoService().fetchStudents(), isA<List<Aluno>>());
//   });
// }

void main() {
  late AlunoService alunoService;

  setUp(() {
    alunoService = AlunoService();
  });

  test('should fetch students successfully', () async {
    final alunos = await alunoService.fetchStudents();

    expect(alunos, isA<List<Aluno>>());
    // expect(alunos.length, 2);

    // expect(alunos[0].id, 17);
    // expect(alunos[0].nome, 'leo');
    // expect(alunos[0].email, 'johndoe@example.com');
    // expect(alunos[0].telefone, '123456789');
    // expect(alunos[0].mensalidade, 100);
    // expect(alunos[0].senha, '123456');
    // expect(alunos[0].situacao, true);
    // expect(alunos[0].observacao, '');

    // expect(alunos[1].id, 18);
    // expect(alunos[1].nome, 'teste');
    // expect(alunos[1].email, 'janesmith@example.com');
    // expect(alunos[1].telefone, '987654321');
    // expect(alunos[1].mensalidade, 150);
    // expect(alunos[1].senha, 'abcdef');
    // expect(alunos[1].situacao, false);
    // expect(alunos[1].observacao, 'Some notes');
  });
}
