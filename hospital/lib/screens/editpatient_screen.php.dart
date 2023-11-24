import 'dart:ui';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/expedient_model.dart';
import 'package:hospital/provider/expedient_provider.dart';
import 'package:hospital/screens/expedient_screen.dart';
import 'package:provider/provider.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/provider/patient_provider.dart';
import '../provider/diagnostico_provider.dart';
import 'diagnostico_screen.dart';
import 'package:intl/intl.dart';

class EditPatientDetailsScreen extends StatefulWidget {
  final Patient patient;

  const EditPatientDetailsScreen({Key? key, required this.patient})
      : super(key: key);

  @override
  _EditPatientDetailsScreenState createState() =>
      _EditPatientDetailsScreenState();
}

class _EditPatientDetailsScreenState extends State<EditPatientDetailsScreen>
    with SingleTickerProviderStateMixin {
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

  late TextEditingController _dxeController;
  late TextEditingController _fechaEgresoController;
  late TextEditingController _medicoEgresoController;
  late TextEditingController _observacionesController;

  late TextEditingController _expedienteController;

  late TabController _tabController;
  //late TextEditingController _diagnosticoController;
  final _formKeyTab1 = GlobalKey<FormState>();
  final _formKeyTab2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    _diagnosticoController = TextEditingController(text: widget.patient.diagnostico);

    _dxeController = TextEditingController(text: widget.patient.dxe);
    _fechaEgresoController =
        TextEditingController(text: widget.patient.fechaEgreso);
    _medicoEgresoController =
        TextEditingController(text: widget.patient.medicoEgreso);
    _observacionesController =
        TextEditingController(text: widget.patient.observaciones);

    _expedienteController = TextEditingController();

    Provider.of<PatientProvider>(context, listen: false)
        .loadConsultaEgresoData(widget.patient.idPaciente);

    Provider.of<PatientProvider>(context, listen: false)
        .loadPatientData();

    Provider.of<ExpedientProvider>(context, listen: false)
        .getExpedientsForPatient(widget.patient.idPaciente)
        .then((expedients) {
      if (expedients.isNotEmpty) {
        // Actualizar el controlador con la clave del primer expediente
        setState(() {
          _expedienteController.text = expedients[0].clave_expediente;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
/////////////////////////////////////

///////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Editar Detalles del Paciente'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Paciente'),
            Tab(text: 'Egreso'),
            Tab(text: 'Embarazada'),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: TabBarView(
          controller: _tabController,
          children: [
            //TODO-----------------------------PESTAÑA 1------------------------
            SingleChildScrollView(
              child: Form(
                key: _formKeyTab1,
                child: formEditPatient(context),
              ),
            ),
            //TODO-----------------------------PESTAÑA 2------------------------
            SingleChildScrollView(
              child: Form(
                key: _formKeyTab2,
                child: formEditEgreso(context),
              ),
            ),
            //TODO-----------------------------PESTAÑA 3------------------------
            Container(child: Text('Pestaña 3')),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 27, 89, 121))),
          onPressed: () {
            if (_formKeyTab1.currentState != null &&
                _formKeyTab1.currentState!.validate()) {
              // Actualizar los detalles del paciente utilizando el PatientProvider
              _updatePatientDetails(context);
            }
          },
          child: Text('Guardar Cambios'),
        ),
      ],
    );
  }

  //TODO---------------------------------PESTAÑA 1------------------------------
  Padding formEditPatient(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  String? expedienteText = _expedienteController.text;
                  if (expedienteText != null && expedienteText.isNotEmpty) {
                    ExpedientProvider expedientProvider =
                        Provider.of<ExpedientProvider>(context, listen: false);
                    Expedient? expedient = await expedientProvider
                        .loadExpedientByClave(expedienteText);
                    if (expedient != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ExpedientScreen(expedient: expedient),
                        ),
                      );
                    } else {
                      // Manejar el caso en el que no se pudo cargar el expediente
                    }
                  } else {
                    // Manejar el caso en el que el texto del expediente es nulo o vacío
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Color.fromARGB(255, 209, 209, 211),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expediente',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _expedienteController,
                        decoration: InputDecoration(
                          hintText: 'Expediente',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                'Agregar diagnóstico',
                _diagnosticoController,
                'Ingrese el diagnóstico',
                (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa el diagnostico';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 27, 89, 121)),
                ),
                onPressed: () {
                  // Abrir la pantalla de historial de diagnósticos
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiagnosticoHistorialScreen(
                        idPaciente: widget.patient.idPaciente,
                        diagnosticoProvider:
                            DiagnosticoProvider('http://192.168.1.82/'),
                      ),
                    ),
                  );
                },
                child: Text('Ver Historial de Diagnósticos'),
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  //TODO---------------------------------PESTAÑA 2------------------------------
  Padding formEditEgreso(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                'DXE',
                _dxeController,
                'Ingrese el DXE',
                (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa el DXE';
                  }
                  return null;
                },
              ),
              _buildDateTimeField(
                'Fecha de egreso',
                _fechaEgresoController,
                'Formato: YYYY-MM-DD HH:MM:SS',
              ),
              _buildTextField(
                'Medico de egreso',
                _medicoEgresoController,
                'Ingrese el medico de egreso',
                (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa el medico de egreso';
                  }
                  return null;
                },
              ),
              _buildTextField(
                'Observaciones',
                _observacionesController,
                'Ingrese observaciones',
                (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa las observaciones';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  //TODO---------------------------------PESTAÑA 3------------------------------

  Widget _buildDateTimeField(
      String label, TextEditingController controller, String hintText) {
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
          DateTimeField(
            controller: controller,
            format: DateFormat("yyyy-MM-dd HH:mm:ss"),
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
            onShowPicker: (context, currentValue) async {
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2101),
              );
              if (date != null) {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                if (time != null) {
                  // Combina la fecha y la hora seleccionadas
                  date = DateTime(
                      date.year, date.month, date.day, time.hour, time.minute);
                }
              }
              return date;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDate(
      String label, TextEditingController controller, String hintText) {
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
          DateTimeField(
            controller: controller,
            format: DateFormat("yyyy-MM-dd"),
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
            onShowPicker: (context, currentValue) async {
              return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2101),
              );
            },
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
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
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
      diagnostico: _diagnosticoController.text,     ///Bueno
    );

    try {
      final Map<String, dynamic> response =
          await patientProvider.updatePatientData(updatedPatient);
      print('Response from server: $response');

      await patientProvider.addDiagnostico(updatedPatient);
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
