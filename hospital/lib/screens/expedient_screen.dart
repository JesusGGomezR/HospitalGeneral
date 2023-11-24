import 'package:flutter/material.dart';
import 'package:hospital/models/expedient_model.dart';
import 'package:hospital/provider/expedient_provider.dart'; // Asegúrate de ide importar tu proveedor de expedientes

class ExpedientScreen extends StatelessWidget {
  final String expedientS;

  // Constructor que recibe un expediente
  const ExpedientScreen({Key? key, required this.expedientS}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Expedient expedient;
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
            Text(
              'CCCC',
              //expedient.tipo.toString(),
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
