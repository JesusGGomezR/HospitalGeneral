import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<MenuOption> menuOptions = [
    MenuOption("Pacientes", Icons.supervised_user_circle),
    MenuOption("Opción 2", Icons.star),
    MenuOption("Opción 3", Icons.settings),
    MenuOption("Opción 4", Icons.camera),
    MenuOption("Opción 5", Icons.mail),
    MenuOption("Opción 6", Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),      //Espacio entre las opciones el borde
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,                    //Columnas que tiene el menu
            crossAxisSpacing: 25.0,               //Espacio entre botones
            mainAxisSpacing: 20.0,                //Espacio entre botones
          ),

          itemCount: menuOptions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Acción al hacer clic en una opción del menú
                print('Clic en ${menuOptions[index].name}');
              },
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(menuOptions[index].icon),
                    SizedBox(height: 5.0),
                    Text(menuOptions[index].name),
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
