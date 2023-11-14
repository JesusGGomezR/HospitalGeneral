class User {
  final id;
  final nombre;
  final curp;
  final correo;
  final contrasena;

  User({
    required this.id,
    required this.nombre,
    required this.curp,
    required this.correo,
    required this.contrasena,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nombre: json['nombre_completo'],
      curp: json['curp'],
      correo: json['correo'],
      contrasena: json['password'],
    );
  }
}








