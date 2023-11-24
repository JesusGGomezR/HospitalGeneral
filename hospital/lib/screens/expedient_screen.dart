import 'package:flutter/material.dart';
import 'package:hospital/models/expedient_model.dart';
import 'package:hospital/provider/expedient_provider.dart';
import 'package:provider/provider.dart';

class ExpedientScreen extends StatelessWidget {
  final String expedientS;

  // Constructor que recibe un expediente
  const ExpedientScreen({Key? key, required this.expedientS}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtén la instancia del proveedor de expedientes
    final expedientProvider = Provider.of<ExpedientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Expediente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Expedient?>(
          // Llama al método loadExpedientByClave al inicio
          future: expedientProvider.loadExpedientByClave(expedientS),
          builder: (context, snapshot) {
            // Verifica si hay un error
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            // Verifica si la operación está en curso
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // Obtén el expediente actual del snapshot
            Expedient? expedient = snapshot.data;

            // Ahora puedes acceder a los datos del expediente en el proveedor
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clave de Expediente:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  expedientS,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Tipo:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                // Verifica si el expediente tiene un valor antes de mostrar el tipo
                Text(
                  expedient?.tipo ?? 'Sin tipo',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Archivo:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                // Verifica si el expediente tiene un valor antes de mostrar el tipo
                Text(
                  expedient?.file ?? 'Sin archivo',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
