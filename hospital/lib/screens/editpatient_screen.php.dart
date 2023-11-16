import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hospital/models/patient_model.dart'; // Asegúrate de importar el modelo correcto
import 'package:hospital/provider/patient_provider.dart'; // Asegúrate de importar el provider correcto

class EditPatientDetailsScreen extends StatefulWidget {
  final Patient patient;

  EditPatientDetailsScreen({required this.patient});

  @override
  _EditPatientDetailsScreenState createState() =>
      _EditPatientDetailsScreenState();
}

class _EditPatientDetailsScreenState extends State<EditPatientDetailsScreen> {
  late TextEditingController _curpController;
  late TextEditingController _nombreController;
  late TextEditingController _apellidosController;
  late TextEditingController _telefonoController;
  late TextEditingController _domicilioController;
  late TextEditingController _generoController;
  late TextEditingController _estatusController;
  late TextEditingController _derechoHabiendoController;
  late TextEditingController _afiliacionController;
  late TextEditingController _tipoSanguineoController;
  late TextEditingController _diagnosticoController;

  @override
  void initState() {
    super.initState();
    // Inicializa los controladores con los datos actuales del paciente
    _curpController = TextEditingController(text: widget.patient.curp);
    _nombreController = TextEditingController(text: widget.patient.nombre);
    _apellidosController =
        TextEditingController(text: widget.patient.apellidos);
    _telefonoController = TextEditingController(text: widget.patient.telefono);
    _domicilioController =
        TextEditingController(text: widget.patient.domicilio);
    _generoController = TextEditingController(text: widget.patient.genero);
    _estatusController = TextEditingController(text: widget.patient.estatus);
    _derechoHabiendoController =
        TextEditingController(text: widget.patient.derechoHabiendo);
    _afiliacionController =
        TextEditingController(text: widget.patient.afiliacion);
    _tipoSanguineoController =
        TextEditingController(text: widget.patient.tipoSanguineo);
    _diagnosticoController =
        TextEditingController(text: widget.patient.diagnostico);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Editar Detalles del Paciente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
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
            // Actualizar los detalles del paciente utilizando el PatientProvider
            _updatePatientDetails(context);
          },
          child: Text('Guardar Cambios'),
        ),
      ],
    );
  }

  void _updatePatientDetails(BuildContext context) async {
    final patientProvider =
        Provider.of<PatientProvider>(context, listen: false);

    // Crea un nuevo paciente con los detalles actualizados
    Patient updatedPatient = Patient(
      idPaciente: widget.patient.idPaciente,
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
      final Map<String, dynamic> response =
          await patientProvider.updatePatientData(updatedPatient);
      print('Response from server: $response');

      // Recargar la lista después de la actualización
      await patientProvider.loadPatientData();

      // Navegar de regreso a la pantalla anterior
      Navigator.pop(context);
    } catch (error) {
      // Manejo de errores
      print('Error: $error');
    }
  }
}
