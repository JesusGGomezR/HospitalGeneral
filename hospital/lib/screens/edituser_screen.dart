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
  late TextEditingController _nombreController;
  late TextEditingController _curpController;
  late TextEditingController _correoController;
  late TextEditingController _contrasenaController;

  @override
  void initState() {
    super.initState();
    // Inicializa los controladores con los datos actuales del usuario
    _nombreController = TextEditingController(text: widget.user.nombre ?? '');
    _curpController = TextEditingController(text: widget.user.curp ?? '');
    _correoController = TextEditingController(text: widget.user.correo ?? '');
    _contrasenaController = TextEditingController(text: widget.user.contrasena ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Detalles del Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre'),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre',
              ),
            ),
            SizedBox(height: 16.0),
            Text('CURP'),
            TextField(
              controller: _curpController,
              decoration: InputDecoration(
                hintText: 'Ingrese el CURP',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Correo'),
            TextField(
              controller: _correoController,
              decoration: InputDecoration(
                hintText: 'Ingrese el correo',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Contraseña'),
            TextField(
              controller: _contrasenaController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Ingrese la contraseña',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Actualizar los detalles del usuario utilizando el UserProvider
                _updateUserDetails(context);
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateUserDetails(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    // Crea un nuevo usuario con los detalles actualizados
    User updatedUser = User(
      id: widget.user.id,
      nombre: _nombreController.text,
      curp: _curpController.text,
      correo: _correoController.text,
      contrasena: _contrasenaController.text,
    );

    // Llama a la función en el UserProvider para actualizar los detalles del usuario
    userProvider.updateUserData(updatedUser);

    // Navega de regreso a la pantalla anterior
    Navigator.pop(context);
  }
}
