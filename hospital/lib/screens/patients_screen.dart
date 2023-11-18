import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hospital/models/expedient_model.dart';
import 'package:hospital/provider/expedient_provider.dart';
import 'package:provider/provider.dart';
import 'package:hospital/provider/patient_provider.dart'; // Asegúrate de importar el provider correcto
import '../models/patient_model.dart'; // Asegúrate de importar el modelo correcto
import 'editpatient_screen.php.dart'; // Asegúrate de importar la pantalla de edición correcta
import 'package:hospital/screens/addpatient_screen.dart';

class EditPatientScreen extends StatefulWidget {
  @override
  _EditPatientScreenState createState() => _EditPatientScreenState();
}

class _EditPatientScreenState extends State<EditPatientScreen> {
  TextEditingController searchController = TextEditingController();
  List<Patient> allPatients = [];
  List<Patient> filteredPatients = [];
  List<Expedient> allExpedients = [];
  List<Expedient> filteredExpedients = [];

  @override
  void initState() {
    super.initState();

    // Cargar la lista completa de pacientes al iniciar la pantalla
    loadPatients();
    loadExpedients();
    // Agregar un listener para el evento onChanged del TextField
    searchController.addListener(() {
      filterPatients(searchController.text);
    });
  }

  void loadExpedients() async {
    final expedientProvider =
        Provider.of<ExpedientProvider>(context, listen: false);
    allExpedients = await expedientProvider.getExpedients();
    setState(() {
      filteredExpedients = allExpedients;
    });
  }

  void loadPatients() async {
    final patientProvider =
        Provider.of<PatientProvider>(context, listen: false);
    allPatients = await patientProvider.getPatients();
    setState(() {
      filteredPatients = allPatients;
    });
  }

  void filterPatients(String query) {
    final List<Patient> filteredList = allPatients
        .where((patient) =>
            patient.curp.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredPatients = filteredList;
    });
  }

  void filterExpedients(String query) {
    final List<Expedient> filteredList =
        allExpedients.where((expedient) => expedient.id_expediente).toList();
    setState(() {
      filteredExpedients = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Editar Paciente'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            try {
              // Navegar de regreso cuando se presiona el botón de retroceso
              Navigator.pushReplacementNamed(context, 'home');
            } catch (e) {
              print('Error al regresar: $e');
            }
          },
        ),
      ),
      body: FutureBuilder<List<Patient>>(
          future: patientProvider.getPatients(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error al cargar pacientes'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No hay pacientes disponibles'));
            } else {
              return listPatient(context);
            }
          }),
    );
  }

  Column listPatient(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Buscar por CURP',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: min(filteredPatients.length, filteredExpedients.length),
            itemBuilder: (context, index) {
              Patient patient = filteredPatients[index];
              Expedient expedient = filteredExpedients[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Aquí puedes colocar el widget adicional en la columna izquierda
                    // Por ejemplo, un ícono, un círculo, etc.
                    Icon(Icons
                        .person), // Esto es solo un ejemplo, puedes personalizarlo según tus necesidades

                    // Espaciador para separar el widget adicional de la lista
                    SizedBox(width: 8),
                    Text(expedient.clave_expediente ?? ''),
                    SizedBox(width: 8),

                    // Listado de pacientes
                    Expanded(
                      child: ListTile(
                        title: Text('${patient.nombre} ${patient.apellidos}'),
                        subtitle: Text(patient.curp ?? ''),
                        trailing: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 27, 89, 121))),
                          onPressed: () {
                            // Navegar a la pantalla de edición con el paciente seleccionado
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditPatientDetailsScreen(patient: patient),
                              ),
                            );
                          },
                          child: Text('Editar'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16.0), // Ajusta el espacio según tus necesidades
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 15, 25),
          child: Container(
            alignment: Alignment.centerRight, // Alineación a la derecha
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 27, 89, 121),
                ),
              ),
              onPressed: () {
                // Navegar a la pantalla para agregar un nuevo paciente
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPatientScreen(),
                  ),
                );
              },
              child: Text('Agregar Paciente'),
            ),
          ),
        ),
      ],
    );
  }
}
