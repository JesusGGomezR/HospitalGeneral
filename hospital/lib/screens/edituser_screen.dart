import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hospital/models/user_model.dart';
import 'package:hospital/provider/user_provider.dart';

class EditUserDetailsScreen extends StatefulWidget {
  final User user;

  EditUserDetailsScreen({required this.user});

  @override
  _EditUserDetailsScreenState createState() => _EditUserDetailsScreenState();
}

class _EditUserDetailsScreenState extends State<EditUserDetailsScreen> {
  late TextEditingController _rolController;
  late TextEditingController _nombreController;
  late TextEditingController _curpController;
  late TextEditingController _correoController;
  late TextEditingController _contrasenaController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Inicializa los controladores con los datos actuales del usuario
    _rolController = TextEditingController(text: widget.user.id_rol);
    _nombreController = TextEditingController(text: widget.user.nombre);
    _curpController = TextEditingController(text: widget.user.curp);
    _correoController = TextEditingController(text: widget.user.correo);
    _contrasenaController = TextEditingController(text: widget.user.contrasena);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Editar Detalles del Usuario'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: formEditUser(context),
        ),
      ),
    );
  }

  Padding formEditUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            'Nivel (rol)',
            _rolController,
            'Ingresa el rol',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el rol';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          _buildTextField(
            'Nombre',
            _nombreController,
            'Ingrese el nombre',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el nombre';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          _buildTextField(
            'CURP',
            _curpController,
            'Ingrese el CURP',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el CURP';
              } else if (value.length < 18) {
                return 'El CURP debe tener 18 caracteres';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          _buildTextField(
            'Correo',
            _correoController,
            'Ingrese el correo',
            (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Por favor, ingresa un correo válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            'Contraseña',
            _contrasenaController,
            'Ingrese la contraseña',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa la contraseña';
              }
              // Encriptar la contraseña usando SHA-256
              String hashedPassword =
                  sha256.convert(utf8.encode(value)).toString();
              _contrasenaController.text = hashedPassword;
              // Puedes almacenar la contraseña encriptada o usarla según tus necesidades
              print('Contraseña encriptada: $hashedPassword');

              return null;
            },
            obscureText: true,
          ),
          SizedBox(height: 32.0),
          Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 21, 74, 102))),
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  // Todas las validaciones son exitosas, procesar los datos
                  _updateUserDetails(context);
                }
              },
              child: const Text('Guardar Cambios'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String hintText,
    String? Function(String?)? validator, {
    bool obscureText = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: Color.fromARGB(255, 209, 209, 211),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }

  void _updateUserDetails(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Crea un nuevo usuario con los detalles actualizados
    User updatedUser = User(
      id: widget.user.id,
      id_rol: widget.user.id_rol,
      nombre: _nombreController.text,
      curp: _curpController.text,
      correo: _correoController.text,
      contrasena: _contrasenaController.text,
    );

    try {
      final Map<String, dynamic> response =
          await userProvider.updateUserData(updatedUser);
      print('Response from server: $response');

      // Recargar la lista después de la actualización
      await userProvider.loadUserData();

      // Navegar de regreso a la pantalla anterior
      Navigator.pop(context);
    } catch (error) {
      // Manejo de errores
      print('Error: $error');
    }
  }
}
