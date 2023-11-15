import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hospital/models/patient_model.dart';

class PatientProvider extends ChangeNotifier {
  Patient? _currentPatient;

  Patient? get currentPatient => _currentPatient;

  static const String apiUrl =
      'http://192.168.1.82/update_patient.php'; // Asegúrate de actualizar la URL

  Future<void> loadPatientData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.1.82/load_patient.php')); // Asegúrate de actualizar la URL

      if (response.statusCode == 200) {
        final Map<String, dynamic> patientData = json.decode(response.body);
        _currentPatient = Patient(
          idPaciente: patientData['id_paciente'],
          curp: patientData['curp'],
          nombre: patientData['nombre'],
          apellidos: patientData['apellidos'],
          telefono: patientData['telefono'],
          domicilio: patientData['domicilio'],
          genero: patientData['genero'],
          estatus: patientData['estatus'],
          derechoHabiendo: patientData['derecho_habiendo'],
          afiliacion: patientData['afiliacion'],
          tipoSanguineo: patientData['tipo_sanguineo'],
          diagnostico: patientData['diagnostico'],
        );

        notifyListeners();
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Map<String, dynamic>> updatePatientData(Patient updatedPatient) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.82/update_patient.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id_paciente': updatedPatient.idPaciente,
          'curp': updatedPatient.curp,
          'nombre': updatedPatient.nombre,
          'apellidos': updatedPatient.apellidos,
          'telefono': updatedPatient.telefono,
          'domicilio': updatedPatient.domicilio,
          'genero': updatedPatient.genero,
          'estatus': updatedPatient.estatus,
          'derecho_habiendo': updatedPatient.derechoHabiendo,
          'afiliacion': updatedPatient.afiliacion,
          'tipo_sanguineo': updatedPatient.tipoSanguineo,
          'diagnostico': updatedPatient.diagnostico,
        }),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      // Si la respuesta no es un mapa, devolver un mapa de error
      if (responseData is! Map<String, dynamic>) {
        return {'status': 'error', 'error': 'Error updating patient data'};
      }

      print('Response from server: $responseData');

      return responseData;
    } catch (error) {
      print('Error: $error');
      // Devuelve un mapa de error en caso de excepción
      return {'status': 'error', 'error': 'Error updating patient data'};
    }
  }

  Future<List<Patient>> getPatients() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.1.82/get_patients.php')); // Asegúrate de actualizar la URL

      if (response.statusCode == 200) {
        final List<dynamic> patientDataList = json.decode(response.body);

        // Asegúrate de que patientDataList es una lista
        if (patientDataList is List) {
          // Mapea cada elemento de la lista a un objeto Patient
          final List<Patient> patients = patientDataList.map((patientData) {
            return Patient.fromJson(patientData);
          }).toList();

          return patients;
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

  Future<Map<String, dynamic>> addPatient(Patient newPatient) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.82/add_patient.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'curp': newPatient.curp,
          'nombre': newPatient.nombre,
          'apellidos': newPatient.apellidos,
          'telefono': newPatient.telefono,
          'domicilio': newPatient.domicilio,
          'genero': newPatient.genero,
          'estatus': newPatient.estatus,
          'derecho_habiendo': newPatient.derechoHabiendo,
          'afiliacion': newPatient.afiliacion,
          'tipo_sanguineo': newPatient.tipoSanguineo,
          'diagnostico': newPatient.diagnostico,
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
      return {'status': 'error', 'error': 'Error updating patient data'};
    }
  }
}
