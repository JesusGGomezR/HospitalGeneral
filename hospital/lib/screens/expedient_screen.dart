import 'package:flutter/material.dart';
import 'package:hospital/models/expedient_model.dart'; // Asegúrate de ide importar tu proveedor de expedientes

class ExpedientScreen extends StatelessWidget {
  final Expedient expedient;

  // Constructor que recibe un expediente
  const ExpedientScreen({Key? key, required this.expedient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Expediente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              expedient.clave_expediente,
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
            Text(
              expedient.tipo,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
