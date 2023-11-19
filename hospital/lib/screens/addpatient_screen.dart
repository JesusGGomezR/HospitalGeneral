import 'package:flutter/material.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/provider/patient_provider.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController _diagnosticoController = TextEditingController();

  // Nuevos controladores para "consultasingreso" y "diagnosticosembarazadas"
  final TextEditingController _fechaCreacionExpController = TextEditingController();
  final TextEditingController _fechaIngresoController = TextEditingController();
  final TextEditingController _dxiController = TextEditingController();
  final TextEditingController _medicoIngresoController = TextEditingController();

  final TextEditingController _fechaUltimaRevisionExpController = TextEditingController();
  final TextEditingController _fechaPrimeraRevisionController = TextEditingController();
  final TextEditingController _fechaUltimaRevisionController = TextEditingController();
  final TextEditingController _fechaPuerperioController = TextEditingController();
  final TextEditingController _diagnosticoEmbarazadaController = TextEditingController();
  final TextEditingController _riesgoController = TextEditingController();
  final TextEditingController _trasladoController = TextEditingController();
  final TextEditingController _apeoController = TextEditingController();

  late TabController _tabController;

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
      ),
    );
  }

  Widget _buildFirstConsultationForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              'Fecha del expediente',            //TODO---------Este tiene como proposito ser un contador
              _fechaCreacionExpController,
              'Formato: YYYY-MM-DD',
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
              'Fecha de ingreso',
              _fechaIngresoController,
              'Formato: YYYY-MM-DD',
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
              'DXI',
              _dxiController,
              'Ingrese el DXI',
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
              'Medico de ingreso',
              _medicoIngresoController,
              'Ingrese el Medico de ingreso',
                  (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa el CURP';
                } else if (value.length < 18) {
                  return 'El CURP debe tener 18 caracteres';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPregnantForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              'Fecha de la ultimo expediente',
              _fechaUltimaRevisionExpController,
              'Formato: YYYY-MM-DD',
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
              'Fecha de la primera consulta',
              _fechaPrimeraRevisionController,
              'Formato: YYYY-MM-DD',
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
              'Fecha de ultima consulta',       //TODO---------Debe de estar en editar pacientes
              _fechaUltimaRevisionController,
              'Formato: YYYY-MM-DD',
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
              'Fecha puerperio',
              _fechaPuerperioController,      //TODO---------Este no tiene sentido en add_patient
              'Formato: YYYY-MM-DD',
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
              'Diagnostico',                  //TODO---------Debe de estar en editar pacientes
              _diagnosticoEmbarazadaController,
              'Ingrese ',
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
              'Riesgo',                       //TODO---------Este debe ser null, y debe estar en editar pacientes
              _riesgoController,
              'Ingrese ',
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
              'Traslado',                     //TODO---------Este debe ser null, y debe estar en editar pacientes
              _trasladoController,
              'Ingrese ',
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
              'Apeo',
              _apeoController,
              'Ingrese ',
                  (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa el CURP';
                } else if (value.length < 18) {
                  return 'El CURP debe tener 18 caracteres';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  //TODO--------------------------PERSONALIZAR CAMPOS---------------------------

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

  //TODO------------------------------------------------------------------------

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

      fechaCreacionExp: _fechaCreacionExpController.text,
      fechaIngreso: _fechaIngresoController.text,
      dxi: _dxiController.text,
      medicoIngreso: _medicoIngresoController.text,

      fechaUltimaRevisionExp: _fechaUltimaRevisionExpController.text,
      fechaPrimeraRevision: _fechaPrimeraRevisionController.text,
      fechaUltimaRevision: _fechaUltimaRevisionController.text,
      fechaPuerperio: _fechaPuerperioController.text,
      diagnosticoEmbarazada: _diagnosticoEmbarazadaController.text,
      riesgo: _riesgoController.text,
      traslado: _trasladoController.text,
      apeo: _apeoController.text,
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
