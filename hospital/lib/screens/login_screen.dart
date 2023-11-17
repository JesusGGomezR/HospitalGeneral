import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hospital/widgets/input_decoration.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hospital/provider/activity_log.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController curpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //TODO------------------------------------------------------------------------

  Future<void> loginUser(
      String username, String password, BuildContext context) async {
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    final activityLogProvider =
        Provider.of<ActivityLogProvider>(context, listen: false);

    print(hashedPassword);
    // ignore: unnecessary_null_comparison
    if (curpController != null && hashedPassword != null) {
      final response = await http.post(
        Uri.parse('http://192.168.1.82/login.php'),
        body: {
          'curp': curpController.text,
          'password': hashedPassword,
        },
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);

        if (result['status'] == 'success') {
          // Usuario autenticado, puedes redirigir al usuario a la pantalla principal o realizar otras acciones
          activityLogProvider.logActivity(
              'Inicio de sesión exitoso para el usuario $username');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, 'home');
        } else {
          // Autenticación fallida, muestra un mensaje de error
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error de autenticación'),
              content: Text('Verifica tus credenciales e intenta nuevamente.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        // Error en la solicitud HTTP
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Ocurrió un error. Por favor, intenta nuevamente.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      print('Error: Los controladores no están inicializados.');
    }
  }

  //TODO-------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //tamano de la pantalla
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [cajasuperior(size), icono(), form(context)],
        ),
      ),
    );
  }

  SingleChildScrollView form(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            // height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Inicio', style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 30),
                Container(
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                            hintext: 'GORJ090101HTGTMNSA2',
                            labeltext: 'Usuario',
                            icono: const Icon(Icons.person_2_rounded),
                          ),
                          controller: curpController,
                        ),

                        const SizedBox(
                            height: 30), //Espacio entre los campos del login

                        TextFormField(
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                            hintext: '***********',
                            labeltext: 'Contraseña',
                            icono: const Icon(Icons.lock_rounded),
                          ),
                          controller: passwordController,
                        ),
                        const SizedBox(height: 30),

                        MaterialButton(
                          //Boton login
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          color: Color.fromARGB(255, 27, 89, 121),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            // Llama a la función loginUser al hacer clic en el botón Ingresar
                            loginUser(curpController.text,
                                passwordController.text, context);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            '', //Crear una cuenta nueva
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  SafeArea icono() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Container cajasuperior(Size size) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 27, 89, 121),
          Color.fromRGBO(90, 70, 178, 1),
        ]),
      ),
      width: double.infinity,
      height: size.height * 0.4, //Porcentaje del area
      child: Stack(
        children: [
          Positioned(child: circulos(), top: 90, left: 30),
          Positioned(child: circulos(), top: -40, left: -30),
          Positioned(child: circulos(), top: -50, right: -20),
          Positioned(child: circulos(), bottom: -50, left: -20),
          Positioned(child: circulos(), bottom: 120, right: 20),
        ],
      ),
    );
  }

  Container circulos() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 2555, 255, 0.05),
      ),
    );
  }
}
