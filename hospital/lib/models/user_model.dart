class User {
  final id;
  final id_rol;
  final nombre;
  final curp;
  final correo;
  final contrasena;

  User({
    required this.id,
    required this.id_rol,
    required this.nombre,
    required this.curp,
    required this.correo,
    required this.contrasena,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      id_rol: json['id_rol'],
      nombre: json['nombre_completo'],
      curp: json['curp'],
      correo: json['correo'],
      contrasena: json['password'],
    );
  }
}
