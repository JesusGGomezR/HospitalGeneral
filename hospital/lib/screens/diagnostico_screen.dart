import 'package:flutter/material.dart';
import 'package:hospital/models/diagnostico_model.dart';
import 'package:hospital/provider/diagnostico_provider.dart';

class DiagnosticoHistorialScreen extends StatelessWidget {
  final idPaciente;
  final DiagnosticoProvider diagnosticoProvider;

  DiagnosticoHistorialScreen({this.idPaciente, required this.diagnosticoProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Historial de Diagnósticos'),
      ),
      body: FutureBuilder<List<DiagnosticoModel>>(
        future: diagnosticoProvider.getDiagnosticoByPaciente(idPaciente),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<DiagnosticoModel> diagnosticos = snapshot.data ?? [];
            return ListView.builder(
              itemCount: diagnosticos.length,
              itemBuilder: (context, index) {
                DiagnosticoModel diagnostico = diagnosticos[index];
                return ListTile(
                  title: Text(diagnostico.diagnostico),
                  subtitle: Text('Fecha: ${diagnostico.fechaRegistro}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

