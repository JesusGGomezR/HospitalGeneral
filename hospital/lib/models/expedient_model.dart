class Expedient {
  final id_expediente;
  final clave_expediente;
  final id_paciente;
  final tipo;
  final file;

  Expedient({
    this.id_expediente,
    this.clave_expediente,
    this.id_paciente,
    this.tipo,
    this.file,
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
