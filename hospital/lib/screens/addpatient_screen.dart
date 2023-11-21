import 'package:flutter/material.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/provider/patient_provider.dart';
import 'package:provider/provider.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AddPatientScreen extends StatefulWidget {
  @override
  _AddPatientScreenState createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> with TickerProviderStateMixin {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _curpController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _domicilioController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _estatusController = TextEditingController();
  final TextEditingController _derechoHabiendoController = TextEditingController();
  final TextEditingController _afiliacionController = TextEditingController();
  final TextEditingController _tipoSanguineoController = TextEditingController();

  final TextEditingController _fechaCreacionExpController = TextEditingController();
  final TextEditingController _fechaIngresoController = TextEditingController();
  final TextEditingController _dxiController = TextEditingController();
  final TextEditingController _medicoIngresoController = TextEditingController();

  final TextEditingController _fechaUltimaRevisionExpController = TextEditingController();
  final TextEditingController _fechaPrimeraRevisionController = TextEditingController();
  final TextEditingController _fechaUltimaRevisionController = TextEditingController();
  final TextEditingController _fechaPuerperioController = TextEditingController();

  final TextEditingController _riesgoController = TextEditingController();
  final TextEditingController _trasladoController = TextEditingController();
  final TextEditingController _apeoController = TextEditingController();

  final TextEditingController _diagnostico = TextEditingController();

  final TextEditingController _claveExpediente = TextEditingController();

  late TabController _tabController;


  DateTime _selectedDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Agregar Paciente'),
      ),
      body: Column(
        children: [

          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Paciente',
              ),
              Tab(
                text: 'Primera Consulta',
              ),
              Tab(
                text: 'Embarazadas',
              ),
            ],
            labelColor: Color.fromARGB(255, 27, 89, 121), // Color del texto seleccionado
            unselectedLabelColor: Colors.black, // Color del texto no seleccionado
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Contenido de la pestaña de Paciente
                _buildPatientForm(),
                // Contenido de la pestaña de Primera Consulta
                _buildFirstConsultationForm(),
                // Contenido de la pestaña de Embarazadas
                _buildPregnantForm(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _addPatient(context);
              },
              child: Text('Agregar Paciente'),
            ),
          ),
        ],
      ),
    );
  }
//TODO-------------------------------------FORMULARIO PACIENTE---------------------------------------
  // Funciones para construir los formularios de cada pestaña
  Widget _buildPatientForm() {
    return SingleChildScrollView(
      child: Padding(
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
              },readOnly: true,
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
              },readOnly: true,
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
              },readOnly: true,
            ),
            _buildTextField(
              'Expediente',
              _claveExpediente,
              'Ingrese clave expediente',
                  (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa el expediente';
                }
                return null;
              },readOnly: true,
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
              },readOnly: true,
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
              },readOnly: true,
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
              },readOnly: true,
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
              },readOnly: true,
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
              },readOnly: true,
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
              },readOnly: true,
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
              },readOnly: true,
            ),
            _buildTextField(
              'Diagnóstico',
              _diagnostico,                 //TODO---------Debe de estar en editar pacientes
              'Ingrese el diagnóstico',
              (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa el diagnostico';
                }
                return null;
              },readOnly: true,
            ),
            SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
//TODO-------------------------------------FORMULARIO INGRESO---------------------------------------
  Widget _buildFirstConsultationForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDate(
              'Fecha del expediente',            //TODO---------Este tiene como proposito ser un contador
              _fechaCreacionExpController,
              'Formato: YYYY-MM-DD',
            ),
            _buildDateTimeField(
              'Fecha de ingreso',
              _fechaIngresoController,
              'Formato: YYYY-MM-DD HH:MM:SS',
            ),
            _buildTextField(
              'DXI',
              _dxiController,
              'Ingrese el DXI',
                  (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },readOnly: true,
            ),
            _buildTextField(
              'Medico de ingreso',
              _medicoIngresoController,
              'Ingrese el Medico de ingreso',
                  (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
//TODO-------------------------------------FORMULARIO EMBARAZADA---------------------------------------
  Widget _buildPregnantForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDate(
              'Fecha de la ultimo expediente',
              _fechaUltimaRevisionExpController,
              'Formato: YYYY-MM-DD',
            ),

            _buildDateTimeField(
              'Fecha de la primera consulta',
              _fechaPrimeraRevisionController,
              'Formato: YYYY-MM-DD HH:MM:SS',   //TODO---------Con formato YYYY-MM-DD HH:MM:SS
            ),

            _buildDateTimeField(
              'Fecha de ultima consulta',       //TODO---------Debe de estar en editar pacientes
              _fechaUltimaRevisionController,   //TODO---------Con formato YYYY-MM-DD HH:MM:SS
              'Formato: YYYY-MM-DD HH:MM:SS',
            ),
            _buildDateTimeField(
              'Fecha puerperio',
              _fechaPuerperioController,      //TODO---------Este no tiene sentido en add_patient
              'Formato: YYYY-MM-DD HH:MM:SS', //TODO---------Con formato YYYY-MM-DD HH:MM:SS
            ),
            _buildTextField(
              'Riesgo',                       //TODO---------Este debe ser null, y debe estar en editar pacientes
              _riesgoController,
              'Ingrese ',
                  (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },readOnly: true,
            ),
            _buildTextField(
              'Traslado',                     //TODO---------Este debe ser null, y debe estar en editar pacientes
              _trasladoController,
              'Ingrese ',
                  (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },readOnly: true,
            ),
            _buildTextField(
              'Apeo',
              _apeoController,
              'Ingrese ',
                  (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },readOnly: true,
            ),
          ],
        ),
      ),
    );
  }

  //TODO--------------------------PERSONALIZAR CAMPOS---------------------------
  Widget _buildDateTimeField(String label, TextEditingController controller, String hintText) {
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
                  initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                if (time != null) {
                  // Combina la fecha y la hora seleccionadas
                  date = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                }
              }
              return date;
            },
          ),
        ],
      ),
    );
  }


  Widget _buildDate(String label, TextEditingController controller, String hintText) {
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
    bool obscureText = false, required bool readOnly,
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

  //TODO------------------------------------------------------------------------

  //método _selectDate que abrirá el selector de fecha
  Future<void> _selectDate(TextEditingController controller, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      // Formatea la fecha seleccionada antes de asignarla al controlador
      String formattedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      controller.text = formattedDate;
    }
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

      fechaCreacionExp: _fechaCreacionExpController.text,
      fechaIngreso: _fechaIngresoController.text,
      dxi: _dxiController.text,
      medicoIngreso: _medicoIngresoController.text,

      fechaUltimaRevisionExp: _fechaUltimaRevisionExpController.text,
      fechaPrimeraRevision: _fechaPrimeraRevisionController.text,
      fechaUltimaRevision: _fechaUltimaRevisionController.text,
      fechaPuerperio: _fechaPuerperioController.text,
      riesgo: _riesgoController.text,
      traslado: _trasladoController.text,
      apeo: _apeoController.text,

      diagnostico: _diagnostico.text,

      claveExpediente: _claveExpediente.text,
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


  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
