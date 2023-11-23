class DiagnosticoModel {
  final  idHistorialDiagnostico;
  final  idPaciente;
  final  diagnostico;
  final  fechaRegistro;

  DiagnosticoModel({
     this.idHistorialDiagnostico,
     this.idPaciente,
     this.diagnostico,
     this.fechaRegistro,
  });

  factory DiagnosticoModel.fromJson(Map<String, dynamic> json) {
    return DiagnosticoModel(
      idHistorialDiagnostico: json['id_historial_diagnostico'],
      idPaciente: json['id_paciente'],
      diagnostico: json['diagnostico'],
      fechaRegistro: DateTime.parse(json['fecha_registro']),
    );
  }
}
