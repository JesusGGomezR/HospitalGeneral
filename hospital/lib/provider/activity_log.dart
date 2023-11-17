import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActivityLogProvider extends ChangeNotifier {
  static const String baseUrl = 'http://192.168.1.82/activity_log.php';

  List<String> activityLog = [];

  Future<bool> logActivity(String message) async {
    activityLog.add(message);
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl?action=logActivity'),
        body: {'message': message},
      );

      if (response.statusCode == 200) {
        final responseData = response.body;
        if (responseData == 'success') {
          print('Actividad registrada exitosamente');
          return true;
        } else {
          final error = responseData;
          print(
              'Error al registrar actividad: ${error ?? 'Error desconocido'}');
          return false;
        }
      } else {
        print('Error al registrar.actividad: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error al registrar-actividad: ${e.toString()}');
      return false;
    }
  }
}
