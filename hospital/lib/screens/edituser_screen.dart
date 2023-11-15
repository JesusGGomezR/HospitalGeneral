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
        backgroundColor: Colors.deepPurple,
        title: Text('Editar Detalles del Usuario'),
      ),
      body: formEditUser(context),
    );
  }

  Padding formEditUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('Nivel (rol)', _rolController, 'Ingresa el rol'),
          SizedBox(height: 16.0),
          _buildTextField('Nombre', _nombreController, 'Ingrese el nombre'),
          SizedBox(height: 16.0),
          _buildTextField('CURP', _curpController, 'Ingrese el CURP'),
          SizedBox(height: 16.0),
          _buildTextField('Correo', _correoController, 'Ingrese el correo'),
          SizedBox(height: 16.0),
          _buildTextField(
            'Contraseña',
            _contrasenaController,
            'Ingrese la contraseña',
            obscureText: true,
          ),
          SizedBox(height: 32.0),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              onPressed: () {
                // Actualizar los detalles del usuario utilizando el UserProvider
                _updateUserDetails(context);
              },
              child: Text('Guardar Cambios'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String hintText, {
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
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
