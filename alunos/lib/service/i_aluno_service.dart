import 'package:alunos/model/aluno.dart';

abstract class IAlunoService {
  Future<List<Aluno>> fetchStudents();
  Future<void> createStudents();
  Future<void> editStudents(
    int id, {
    String? nome,
    String? email,
    String? telefone,
    int? mensalidade,
    String? senha,
    bool? situacao,
    String? observacao,
  });
  Future<void> deleteStudents(int id);
}
