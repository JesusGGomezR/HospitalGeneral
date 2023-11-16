import 'package:flutter/material.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/provider/patient_provider.dart';
import 'package:provider/provider.dart';

class AddPatientScreen extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _curpController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _domicilioController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _estatusController = TextEditingController();
  final TextEditingController _derechoHabiendoController =
      TextEditingController();
  final TextEditingController _afiliacionController = TextEditingController();
  final TextEditingController _tipoSanguineoController =
      TextEditingController();
  final TextEditingController _diagnosticoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Agregar Paciente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CURP'),
              TextField(
                controller: _curpController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el CURP',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Nombre'),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el nombre',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Apellidos'),
              TextField(
                controller: _apellidosController,
                decoration: InputDecoration(
                  hintText: 'Ingrese los apellidos',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Teléfono'),
              TextField(
                controller: _telefonoController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el teléfono',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Domicilio'),
              TextField(
                controller: _domicilioController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el domicilio',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Género'),
              TextField(
                controller: _generoController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el género',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Estatus'),
              TextField(
                controller: _estatusController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el estatus',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Derecho Habiendo'),
              TextField(
                controller: _derechoHabiendoController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el derecho habiendo',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Afiliación'),
              TextField(
                controller: _afiliacionController,
                decoration: InputDecoration(
                  hintText: 'Ingrese la afiliación',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Tipo Sanguíneo'),
              TextField(
                controller: _tipoSanguineoController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el tipo sanguíneo',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Diagnóstico'),
              TextField(
                controller: _diagnosticoController,
                decoration: InputDecoration(
                  hintText: 'Ingrese el diagnóstico',
                ),
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 27, 89, 121))),
          onPressed: () {
            _addPatient(context);
          },
          child: Text('Agregar Paciente'),
        ),
      ],
    );
  }

  void _addPatient(BuildContext context) async {
    final patientProvider =
        Provider.of<PatientProvider>(context, listen: false);
    Patient newPatient = Patient(
      curp: _curpController.text,
      nombre: _nombreController.text,
      apellidos: _apellidosController.text,
      telefono: _telefonoController.text,
      domicilio: _domicilioController.text,
      genero: _generoController.text,
      estatus: _estatusController.text,
      derechoHabiendo: _derechoHabiendoController.text,
      afiliacion: _afiliacionController.text,
      tipoSanguineo: _tipoSanguineoController.text,
      diagnostico: _diagnosticoController.text,
    );

    try {
      dynamic response = await patientProvider.addPatient(newPatient);

      if (response != null && response is Map<String, dynamic>) {
        if (response['status'] == 'success') {
          // La adición fue exitosa
          print('Patient added successfully');
        } else {
          // Hubo un error en la adición, muestra el mensaje de error
          print('Error adding patient: ${response['error']}');
        }
      } else {
        // La respuesta del servidor no es un JSON válido
        print('Error adding patient: Unexpected response format');
      }
    } catch (error) {
      // Captura cualquier otra excepción
      print('Error: $error');
      print('Error adding patient: Unexpected error');
    }

    Navigator.pop(context);
  }
}
