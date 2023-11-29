import 'package:flutter/material.dart';
import 'package:hospital/models/expedient_model.dart';
import 'package:hospital/provider/expedient_provider.dart';
import 'package:provider/provider.dart';

class ExpedientScreen extends StatelessWidget {
  final String expedientS;

  const ExpedientScreen({Key? key, required this.expedientS}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expedientProvider = Provider.of<ExpedientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Detalles del Expediente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<Expedient?>(
            future: expedientProvider.loadExpedientByClave(expedientS),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              Expedient? expedient = snapshot.data;

              return formExpedientDetails(expedient);
            },
          ),
        ),
      ),
    );
  }

  Widget formExpedientDetails(Expedient? expedient) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
          'Clave de Expediente',
          expedientS,
          'Ingrese la clave de expediente',
          readOnly: true,
        ),
        SizedBox(height: 16.0),
        _buildTextField(
          'Tipo',
          expedient?.tipo ?? 'Informe de laboratorio',
          'Ingrese el tipo de expediente',
          readOnly: true,
        ),
        SizedBox(height: 16.0),
        _buildTextField(
          'Archivo',
          expedient?.file ?? 'Inf_Lab.pdf',
          'Ingrese el archivo',
          readOnly: true,
        ),
        SizedBox(height: 16.0),
        _buildTextField(
          'Agregar notas',
          expedient?.file ?? '',
          'Añada una nota',
          readOnly: true,
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    String value,
    String hintText, {
    bool readOnly = false,
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
            readOnly: readOnly,
            initialValue: value,
            style: TextStyle(color: Colors.black),
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
          ),
        ],
      ),
    );
  }
}
