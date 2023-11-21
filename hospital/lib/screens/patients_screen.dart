import 'package:flutter/material.dart';
import 'package:hospital/models/expedient_model.dart';
import 'package:hospital/provider/expedient_provider.dart';
import 'package:provider/provider.dart';
import 'package:hospital/provider/patient_provider.dart';
import '../models/patient_model.dart';
import 'editpatient_screen.php.dart';
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

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Buscar pacientes'),
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('      CURP: ${patient.curp ?? ''}'),
                      FutureBuilder<List<Expedient>>(
                        future: Provider.of<ExpedientProvider>(context)
                            .getExpedientsForPatient(patient.idPaciente),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            List<Expedient> expedients = snapshot.data!;
                            if (expedients.isNotEmpty) {
                              return Text('                 Expediente: ${expedients[0].clave_expediente}');
                            } else {
                              return Text('                 Expediente: No disponible');
                            }
                          } else {
                            return Text('                 Expediente: No disponible');
                          }
                        },
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.search),
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
                    //child: Text('Consultar'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
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
      ),
    );
  }
}
