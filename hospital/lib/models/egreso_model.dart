class ConsultaEgresoData {
  final String? dxe;
  final String? fechaEgreso;
  final String? medicoEgreso;
  final String? observaciones;

  ConsultaEgresoData({
    this.dxe,
    this.fechaEgreso,
    this.medicoEgreso,
    this.observaciones,
  });

  factory ConsultaEgresoData.fromJson(Map<String, dynamic> json) {
    return ConsultaEgresoData(
      dxe: json['dxe'],
      fechaEgreso: json['fecha_egreso'],
      medicoEgreso: json['medico_egreso'],
      observaciones: json['observaciones'],
    );
  }
}
