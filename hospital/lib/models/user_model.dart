class User {
  final int? id;
  final String? nombre;
  final String? curp;
  final String? correo;
  final String? contrasena;

  User({
    this.id,
    this.nombre,
    this.curp,
    this.correo,
    this.contrasena,
  });

  // Métodos adicionales del modelo, si los hay

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nombre: json['nombre_completo'],    //Estos deben de ser iguales a los campos en la base de datos
      curp: json['curp'],
      correo: json['correo'],
      contrasena: json['password'],
    );
  }
}


