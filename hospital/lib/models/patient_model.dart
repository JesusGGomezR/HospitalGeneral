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

  // Propiedades para la tabla "consultasingreso"
  final fechaCreacionExp;
  final fechaIngreso;
  final dxi;
  final medicoIngreso;

  // Propiedades para la tabla "diagnosticosembarazadas"
  final fechaUltimaRevisionExp;
  final fechaPrimeraRevision;
  final fechaUltimaRevision;
  final fechaPuerperio;
  final riesgo;
  final traslado;
  final apeo;

  // Propiedades para la tabla "consultasegreso"
  final dxe;
  final fechaEgreso;
  final medicoEgreso;
  final observaciones;

  // Propiedades para la tabla "Diagnostico"
  final diagnostico;
  final fecha_registro;

  // Propiedades para la tabla "Expediente"
  final claveExpediente;


  Patient({
    this.idPaciente,
     this.curp,
     this.nombre,
     this.apellidos,
     this.telefono,
     this.domicilio,
     this.genero,
     this.estatus,
     this.derechoHabiendo,
     this.afiliacion,
     this.tipoSanguineo,

    // Propiedades
    this.fechaCreacionExp,
    this.fechaIngreso,
    this.dxi,
    this.medicoIngreso,

    this.fechaUltimaRevisionExp,
    this.fechaPrimeraRevision,
    this.fechaUltimaRevision,
    this.fechaPuerperio,

    this.riesgo,
    this.traslado,
    this.apeo,

    this.dxe,
    this.fechaEgreso,
    this.medicoEgreso,
    this.observaciones,

    this.diagnostico,
    this.fecha_registro,

    this.claveExpediente,

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

      fechaCreacionExp: json['fecha_creacion_exp'],
      fechaIngreso: json['fecha_ingreso'],
      dxi: json['dxi'],
      medicoIngreso: json['medico_ingreso'],

      fechaUltimaRevisionExp: json['fecha_ultima_revision_exp'],
      fechaPrimeraRevision: json['fecha_primera_revision'],
      fechaUltimaRevision: json['fecha_ultima_revision'],
      fechaPuerperio: json['fecha_puerperio'],
      riesgo: json['riesgo'],
      traslado: json['traslado'],
      apeo: json['apeo'],

      dxe: json['dxe'],
      fechaEgreso: json['fecha_egreso'],
      medicoEgreso: json['medico_egreso'],
      observaciones: json['observaciones'],

      diagnostico: json['diagnostico'],
      fecha_registro: json['fecha_registro'],

      claveExpediente: json['clave_expediente'],
    );
  }
}

