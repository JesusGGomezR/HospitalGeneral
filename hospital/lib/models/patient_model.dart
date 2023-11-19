class Patient {
  final  idPaciente;
  final  curp;
  final  nombre;
  final  apellidos;
  final  telefono;
  final  domicilio;
  final  genero;
  final  estatus;
  final  derechoHabiendo;
  final  afiliacion;
  final  tipoSanguineo;
  final  diagnostico;

  // Propiedades para la tabla "consultasingreso" y "diagnosticosembarazadas"
  final fechaCreacionExp;
  final fechaIngreso;
  final dxi;
  final medicoIngreso;

  final fechaUltimaRevisionExp;
  final fechaPrimeraRevision;
  final fechaUltimaRevision;
  final fechaPuerperio;
  final diagnosticoEmbarazada;
  final riesgo;
  final traslado;
  final apeo;

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

    // Propiedades de "consultasingreso" y "diagnosticosembarazadas"
    this.fechaCreacionExp,
    this.fechaIngreso,
    this.dxi,
    this.medicoIngreso,

    this.fechaUltimaRevisionExp,
    this.fechaPrimeraRevision,
    this.fechaUltimaRevision,
    this.fechaPuerperio,
    this.diagnosticoEmbarazada,
    this.riesgo,
    this.traslado,
    this.apeo,
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

      // Mapea las propiedades adicionales
      fechaCreacionExp: json['fecha_creacion_exp'],
      fechaIngreso: json['fecha_ingreso'],
      dxi: json['dxi'],
      medicoIngreso: json['medico_ingreso'],
      fechaUltimaRevisionExp: json['fecha_ultima_revision_exp'],
      fechaPrimeraRevision: json['fecha_primera_revision'],
      fechaUltimaRevision: json['fecha_ultima_revision'],
      fechaPuerperio: json['fecha_puerperio'],
      diagnosticoEmbarazada: json['diagnostico_embarazada'],
      riesgo: json['riesgo'],
      traslado: json['traslado'],
      apeo: json['apeo'],
    );
  }
}

