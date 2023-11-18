import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActivityLogProvider extends ChangeNotifier {
  static const String baseUrl = 'http://192.168.1.82/activity_log.php';

  Future<bool> logActivity(String message) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}),
      );

      if (response.statusCode == 200) {
        print('Actividad registrada exitosamente');
        print('Respuesta del servidor: ${response.body}');
        return true;
      } else {
        print('Error al registrar actividad: ${response.statusCode}');
        print('Respuesta del servidor: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error al registrar actividad: $e');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getLogs() async {
    final response = await http.get(Uri.parse('$baseUrl?action=getLogs'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      return [];
    }
  }
}

