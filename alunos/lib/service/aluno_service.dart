import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:alunos/service/i_aluno_service.dart';
import 'package:alunos/api/api_source.dart';
import 'package:alunos/constants/constants.dart';
import 'package:alunos/model/aluno.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json; charset=UTF-8',
  "Authorization": "Bearer $apiKey"
};

class AlunoService implements IAlunoService {
  @override
  Future<List<Aluno>> fetchStudents() async {
    try {
      var response = await http.get(
        Uri.parse(ApiSource.baseURL + ApiSource.alunos),
        headers: headers,
      );
      var decodedData = convert.jsonDecode(response.body);

      final newAlunos = decodedData["data"].map<Aluno>((alunoData) {
        return Aluno(
          id: alunoData["id"],
          nome: alunoData["attributes"]["nome"],
          email: alunoData["attributes"]["email"],
          telefone: alunoData["attributes"]["telefone"],
          mensalidade: alunoData["attributes"]["mensalidade"],
          senha: alunoData["attributes"]["senha"],
          situacao: alunoData["attributes"]["situacao"],
          observacao: alunoData["attributes"]["observacao"],
        );
      }).toList();

      return newAlunos;
    } catch (error) {
      throw Exception(
          '[LOG: OCORREU UM ERRO NO MÉTODO FETCHSTUDENTS]: ${error.toString()}');
    }
  }

  @override
  Future<void> createStudents() async {
    try {
      Map<String, dynamic> _aluno = {
        "data": {
          "nome": nomeController.text,
          "email": emailController.text,
          "telefone": telefoneController.text,
          "mensalidade": mensalidadeController.text,
          "senha": senhaController.text,
          "situacao": situacao,
          "observacao": observacaoController.text
        }
      };
      var _body = convert.jsonEncode(_aluno);
      var response = await http.post(
        Uri.parse(ApiSource.baseURL + ApiSource.alunos),
        headers: headers,
        body: _body,
      );
    } catch (error) {
      throw Exception(
          '[LOG: OCORREU UM ERRO NO MÉTODO CREATESTUDENTS]: ${error.toString()}');
    }
  }

  @override
  Future<void> editStudents(int id,
      {String? nome,
      String? email,
      String? telefone,
      int? mensalidade,
      String? senha,
      bool? situacao,
      String? observacao}) async {
    try {
      Map<String, dynamic> _aluno = {
        "data": {
          "nome": nome,
          "email": email,
          "telefone": telefone,
          "mensalidade": mensalidade,
          "senha": senha,
          "situacao": situacao,
          "observacao": observacao,
        }
      };
      var _body = convert.jsonEncode(_aluno);
      await http.put(
        Uri.parse('${ApiSource.baseURL}${ApiSource.alunos}/$id'),
        headers: headers,
        body: _body,
      );
    } catch (error) {
      throw Exception(
          '[LOG: OCORREU UM ERRO NO MÉTODO EDITSTUDENTS]: ${error.toString()}');
    }
  }

  @override
  Future<void> deleteStudents(int id) async {
    try {
      await http
          .delete(Uri.parse('${ApiSource.baseURL}${ApiSource.alunos}/$id'));
    } catch (error) {
      throw Exception(
          '[LOG: OCORREU UM ERRO NO MÉTODO DELETESTUDENTS]: ${error.toString()}');
    }
  }
}
