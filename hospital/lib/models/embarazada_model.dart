class ConsultaEmbarazadaData {
  final String? fechaUltimaRevisionExp;     ///Editar
  final String? fechaPrimeraRevision;
  final String? fechaUltimaRevision;        ///Editar
  final String? fechaPuerperio;             ///Editar
  final String? riesgo;                     ///Editar o historial?
  final String? traslado;                   ///Editar o historial?
  final String? apeo;                       ///Editar o historial?


  ConsultaEmbarazadaData({
    this.fechaUltimaRevisionExp,
    this.fechaPrimeraRevision,
    this.fechaUltimaRevision,
    this.fechaPuerperio,
    this.riesgo,
    this.traslado,
    this.apeo,
  });

  factory ConsultaEmbarazadaData.fromJson(Map<String, dynamic> json) {
    return ConsultaEmbarazadaData(
      fechaUltimaRevisionExp: json['fecha_ultima_revision_exp'],
      fechaPrimeraRevision: json['fecha_primera_revision'],
      fechaUltimaRevision: json['fecha_ultima_revision'],
      fechaPuerperio: json['fecha_puerperio'],
      riesgo: json['riesgo'],
      traslado: json['traslado'],
      apeo: json['apeo'],
    );
  }
}