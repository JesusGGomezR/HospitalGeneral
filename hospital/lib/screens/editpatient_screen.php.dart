import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/provider/patient_provider.dart';

class EditPatientDetailsScreen extends StatefulWidget {
  final Patient patient;

  const EditPatientDetailsScreen({Key? key, required this.patient})
      : super(key: key);

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
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: formEditPatient(context),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 27, 89, 121))),
          onPressed: () {
            if (_formKey.currentState != null &&
                _formKey.currentState!.validate()) {
              // Actualizar los detalles del paciente utilizando el PatientProvider
              _updatePatientDetails(context);
            }
          },
          child: Text('Guardar Cambios'),
        ),
      ],
    );
  }

  Padding formEditPatient(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          _buildTextField(
            'Apellidos',
            _apellidosController,
            'Ingrese los apellidos',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa los apellidos';
              }
              return null;
            },
          ),
          _buildTextField(
            'Teléfono',
            _telefonoController,
            'Ingrese el teléfono',
            (value) {
              if (value == null || value.isEmpty || !isNumeric(value)) {
                return 'Por favor, ingresa el teléfono';
              } else if (value.length < 10) {
                return 'El teléfono debe tener 10 digitos';
              } else if (value.length > 10) {
                return 'El teléfono debe tener 10 digitos';
              }
              return null;
            },
          ),
          _buildTextField(
            'Domicilio',
            _domicilioController,
            'Ingrese el domicilio',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el domicilio';
              }
              return null;
            },
          ),
          _buildTextField(
            'Género',
            _generoController,
            'Ingrese el género',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el genero Masculino / Femenino';
              }
              return null;
            },
          ),
          _buildTextField(
            'Estatus',
            _estatusController,
            'Ingrese el estatus',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el estado Activo/Inactivo';
              }
              return null;
            },
          ),
          _buildTextField(
            'Derecho Habiendo',
            _derechoHabiendoController,
            'Ingrese el derecho habiendo',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el derecho habiendo';
              }
              return null;
            },
          ),
          _buildTextField(
            'Afiliación',
            _afiliacionController,
            'Ingrese la afiliación',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa la afiliacion en caso de no tener escribe Ninguno';
              }
              return null;
            },
          ),
          _buildTextField(
            'Tipo Sanguíneo',
            _tipoSanguineoController,
            'Ingrese el tipo sanguíneo',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el tipo sanguíneo';
              }
              return null;
            },
          ),
          _buildTextField(
            'Diagnóstico',
            _diagnosticoController,
            'Ingrese el diagnóstico',
            (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa el diagnostico';
              }
              return null;
            },
          ),
          SizedBox(height: 32.0),
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

      // Muestra un SnackBar indicando la actualización exitosa
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Detalles del paciente actualizados con éxito'),
          duration: Duration(seconds: 2),
        ),
      );

      // Navegar de regreso a la pantalla anterior
      Navigator.pop(context);
    } catch (error) {
      // Manejo de errores
      print('Error: $error');

      // Muestra un SnackBar indicando el error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al actualizar los detalles del paciente'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
