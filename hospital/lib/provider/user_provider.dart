import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  // URL de tu backend que maneja la obtención y actualización de datos del usuario
  static const String apiUrl = 'http://192.168.1.82/update_user.php';

  Future<void> loadUserData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        _currentUser = User(
          id: userData['id'],
          nombre: userData['nombre'],
          curp: userData['curp'],
          correo: userData['correo'],
          contrasena: userData['contrasena'],
        );

        notifyListeners();
      } else {
        // Manejar errores de la solicitud HTTP según tus necesidades
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (error) {
      // Manejar errores de conexión u otros errores
      print('Error: $error');
    }
  }

  Future<void> updateUserData(User updatedUser) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.82/update_user.php/${updatedUser.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nombre': updatedUser.nombre,
          'curp': updatedUser.curp,
          'correo': updatedUser.correo,
          'contrasena': updatedUser.contrasena,
        }),
      );

      print('Response status code: ${response.statusCode}');

      // Resto del código...
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.82/get_users.php')); // Ajusta según tu API

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



