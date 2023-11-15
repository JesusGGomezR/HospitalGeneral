import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hospital/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  static const String apiUrl = 'http://192.168.1.82/update_user.php';

  Future<void> loadUserData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.1.82/load_user.php'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        _currentUser = User(
          id: userData['id'],
          id_rol: userData['id_rol'],
          nombre: userData['nombre_completo'],
          curp: userData['curp'],
          correo: userData['correo'],
          contrasena: userData['password'],
        );

        notifyListeners();
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<Map<String, dynamic>> updateUserData(User updatedUser) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://192.168.1.82/update_user.php'), // Actualiza la URL al nuevo nombre del script
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id': updatedUser.id,
          'id_rol': updatedUser.id_rol,
          'nombre_completo': updatedUser.nombre,
          'curp': updatedUser.curp,
          'correo': updatedUser.correo,
          'password': updatedUser.contrasena,
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
        // Si la respuesta no es un mapa, lanza una excepción
        throw Exception('Respuesta del servidor no es un JSON válido');
      }
    } catch (error) {
      print('Error: $error');
      // En caso de error, puedes lanzar una excepción o devolver un mapa indicando el error
      throw Exception('Error updating user data');
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.1.82/get_users.php'));

      if (response.statusCode == 200) {
        final List<dynamic> userDataList = json.decode(response.body);

        // Asegúrate de que userDataList es una lista
        if (userDataList is List) {
          // Mapea cada elemento de la lista a un objeto User
          final List<User> users = userDataList.map((userData) {
            return User.fromJson(userData);
          }).toList();

          return users;
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
}
