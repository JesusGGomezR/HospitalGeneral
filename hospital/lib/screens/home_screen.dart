
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<MenuOption> menuOptions = [
    MenuOption("Pacientes", Icons.supervised_user_circle, (BuildContext context) {
      // Lógica para la opción "Pacientes"
      print('Clic en Pacientes');
      Navigator.pushReplacementNamed(context, 'pacientes');  // Reemplaza 'pacientes' con la ruta adecuada
    }),
    MenuOption("Usuarios", Icons.person, (BuildContext context) {
      // Lógica para la opción "Usuarios"
      print('Clic en Usuarios');
      Navigator.pushReplacementNamed(context as BuildContext, 'user');  // Reemplaza 'user' con la ruta adecuada
    }),
    MenuOption("Manual", Icons.menu_book, (BuildContext context) {
      // Lógica para la opción "Manual"
      print('Clic en Manual');
      // Puedes agregar aquí la navegación o la lógica deseada
    }),
    MenuOption("Ajustes", Icons.settings, (BuildContext context) {
      // Lógica para la opción "Ajustes"
      print('Clic en Ajustes');
      // Puedes agregar aquí la navegación o la lógica deseada
    }),
    MenuOption("Salir", Icons.output, (BuildContext context) {
      // Lógica para la opción "Salir"
      print('Clic en Salir');
      // Puedes agregar aquí la navegación o la lógica deseada
    }),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Tamaño de la pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: menuOptions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => menuOptions[index].onTap(context),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      menuOptions[index].icon,
                      size: 50.0,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      menuOptions[index].name,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MenuOption {
  final String name;
  final IconData icon;
  final Function(BuildContext) onTap;

  MenuOption(this.name, this.icon, this.onTap);
}


