class Patient {
  final idPaciente;
  final curp;
  final nombre;
  final apellidos;
  final telefono;
  final domicilio;
  final genero;
  final estatus;
  final derechoHabiendo;
  final afiliacion;
  final tipoSanguineo;
  final diagnostico;

  Patient({
    this.idPaciente,
    required this.curp,
    required this.nombre,
    required this.apellidos,
    required this.telefono,
    required this.domicilio,
    required this.genero,
    required this.estatus,
    required this.derechoHabiendo,
    required this.afiliacion,
    required this.tipoSanguineo,
    required this.diagnostico,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      idPaciente: json['id_paciente'],
      curp: json['curp'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      telefono: json['telefono'],
      domicilio: json['domicilio'],
      genero: json['genero'],
      estatus: json['estatus'],
      derechoHabiendo: json['derecho_habiendo'],
      afiliacion: json['afiliacion'],
      tipoSanguineo: json['tipo_sanguineo'],
      diagnostico: json['diagnostico'],
    );
  }
}
