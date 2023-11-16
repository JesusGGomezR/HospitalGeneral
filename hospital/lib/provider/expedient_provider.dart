import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hospital/models/expedient_model.dart';

class ExpedientProvider extends ChangeNotifier {
  Expedient? _currentExpedient;

  Expedient? get currentExpedient => _currentExpedient;

  static const String apiUrl =
      'http://192.168.1.82/update_expedient.php'; // Asegúrate de actualizar la URL

  Future<void> loadExpedientData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.1.82/load_expedient.php')); // Asegúrate de actualizar la URL

      if (response.statusCode == 200) {
        final Map<String, dynamic> expedientData = json.decode(response.body);
        _currentExpedient = Expedient(
          id_expediente: expedientData['id_expediente'],
          clave_expediente: expedientData['clave_expediente'],
          id_paciente: expedientData['id_paciente'],
          tipo: expedientData['tipo'],
          file: expedientData['file'],
        );

        notifyListeners();
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Map<String, dynamic>> updateExpedientData(
      Expedient updatedExpedient) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.82/update_expedient.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id_expediente': updatedExpedient.id_expediente,
          'clave_expediente': updatedExpedient.clave_expediente,
          'id_paciente': updatedExpedient.id_paciente,
          'tipo': updatedExpedient.tipo,
          'file': updatedExpedient.file,
        }),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      // Si la respuesta no es un mapa, devolver un mapa de error
      // ignore: unnecessary_type_check
      if (responseData is! Map<String, dynamic>) {
        return {'status': 'error', 'error': 'Error updating expedient data'};
      }

      print('Response from server: $responseData');

      return responseData;
    } catch (error) {
      print('Error: $error');
      // Devuelve un mapa de error en caso de excepción
      return {'status': 'error', 'error': 'Error updating expedient data'};
    }
  }

  Future<List<Expedient>> getExpedients() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.1.82/get_expedient.php')); // Asegúrate de actualizar la URL

      if (response.statusCode == 200) {
        final List<dynamic> expedientDataList = json.decode(response.body);

        // Asegúrate de que patientDataList es una lista
        // ignore: unnecessary_type_check
        if (expedientDataList is List) {
          // Mapea cada elemento de la lista a un objeto Patient
          final List<Expedient> expedients =
              expedientDataList.map((expedientData) {
            return Expedient.fromJson(expedientData);
          }).toList();

          return expedients;
        } else {
          print('Error: La respuesta del servidor no es una lista');
          return [];
        }
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<Map<String, dynamic>> addExpedient(Expedient newExpedient) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.82/add_expedient.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id_expediente': newExpedient.id_expediente,
          'clave_expediente': newExpedient.clave_expediente,
          'id_paciente': newExpedient.id_paciente,
          'tipo': newExpedient.tipo,
          'file': newExpedient.file,
        }),
      );

      // Decodifica la respuesta del servidor
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Verifica si la respuesta es un mapa (JSON válido)
      if (responseData is Map<String, dynamic>) {
        print('Response from server: $responseData');

        // Devuelve la respuesta del servidor
        return responseData;
      } else {
        // Si la respuesta no es un mapa, devuelve un mapa con un indicador de error
        return {
          'status': 'error',
          'error': 'Respuesta del servidor no es un JSON válido'
        };
      }
    } catch (error) {
      print('Error: $error');
      // En caso de error, devuelve un mapa con un indicador de error
      return {'status': 'error', 'error': 'Error updating expedient data'};
    }
  }
}
