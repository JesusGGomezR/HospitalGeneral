class Expedient {
  final id_expediente;
  final clave_expediente;
  final id_paciente;
  final tipo;
  final file;

  Expedient({
    this.id_expediente,
    required this.clave_expediente,
    required this.id_paciente,
    required this.tipo,
    required this.file,
  });

  factory Expedient.fromJson(Map<String, dynamic> json) {
    return Expedient(
      id_expediente: json['id_expediente'],
      clave_expediente: json['clave_expediente'],
      id_paciente: json['id_paciente'],
      tipo: json['tipo'],
      file: json['file'],
    );
  }
}
