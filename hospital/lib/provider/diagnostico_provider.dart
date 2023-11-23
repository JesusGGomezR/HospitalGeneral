import 'package:hospital/models/diagnostico_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiagnosticoProvider {
  final String baseUrl;

  DiagnosticoProvider(this.baseUrl);

  Future<List<DiagnosticoModel>> getDiagnosticoByPaciente(idPaciente) async {
    final response = await http.get(Uri.parse('$baseUrl/get_diagnostico.php?id_paciente=$idPaciente'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => DiagnosticoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load diagnostic history');
    }
  }
}

