import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<MenuOption> menuOptions = [
    MenuOption("Pacientes", Icons.supervised_user_circle),
    MenuOption("Usuarios", Icons.person),
    MenuOption("Manual", Icons.menu_book),
    MenuOption("Ajustes", Icons.settings),
    MenuOption("Salir", Icons.output),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;             //tamano de la pantalla
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
              onTap: () {
                Navigator.pushReplacementNamed(context, 'user');
                print('Clic en ${menuOptions[index].name}');
              },
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),          // Ajusta el radio de las esquinas aquí
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

  MenuOption(this.name, this.icon);
}

