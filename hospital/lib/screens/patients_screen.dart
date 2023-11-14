import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    // Cargar la lista completa de pacientes al iniciar la pantalla
    loadPatients();
    // Agregar un listener para el evento onChanged del TextField
    searchController.addListener(() {
      filterPatients(searchController.text);
    });
  }

  void loadPatients() async {
    final patientProvider = Provider.of<PatientProvider>(context, listen: false);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
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
              itemCount: filteredPatients.length,
              itemBuilder: (context, index) {
                Patient patient = filteredPatients[index];

                return ListTile(
                  title: Text('${patient.nombre} ${patient.apellidos}'),
                  subtitle: Text(patient.curp ?? ''),
                  trailing: ElevatedButton(
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
                );
              },
            ),
          ),
          SizedBox(height: 16.0), // Ajusta el espacio según tus necesidades
          ElevatedButton(
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
        ],
      ),
    );
  }
}

