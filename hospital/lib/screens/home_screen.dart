import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<MenuOption> menuOptions = [
    MenuOption("Pacientes", Icons.personal_injury, (BuildContext context) {
      // Lógica para la opción "Pacientes"
      print('Clic en Pacientes');
      Navigator.pushReplacementNamed(
          context, 'patients'); // Reemplaza 'pacientes' con la ruta adecuada
    }),
    MenuOption("Usuarios", Icons.person, (BuildContext context) {
      // Lógica para la opción "Usuarios"
      print('Clic en Usuarios');
      Navigator.pushReplacementNamed(context as BuildContext,
          'user'); // Reemplaza 'user' con la ruta adecuada
    }),
    MenuOption("Manual", Icons.menu_book, (BuildContext context) {
      // Lógica para la opción "Manual"
      print('Clic en Manual');
      // Puedes agregar aquí la navegación o la lógica deseada
    }),
    MenuOption("Acerca de", Icons.person_search, (BuildContext context) {
      // Lógica para la opción "Ajustes"
      print('Clic en Ajustes');
      // Puedes agregar aquí la navegación o la lógica deseada
    }),
    MenuOption("Salir", Icons.output, (BuildContext context) {
      // Lógica para la opción "Salir"
      print('Clic en Salir');
      Navigator.pushReplacementNamed(context as BuildContext, 'login');
      // Puedes agregar aquí la navegación o la lógica deseada
    }),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Tamaño de la pantalla

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 89, 121),
        title: Text('Administrador'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'), // Reemplaza con la ruta de tu imagen
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                alignment: Alignment.center, // Centra el contenido del Container
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 600 ? 5 : 2,
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: menuOptions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => menuOptions[index].onTap(context),
                      child: Card(
                        elevation: 1.0,
                        color: Colors.white.withOpacity(0.7), // Ajusta el valor de opacidad según sea necesario
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                menuOptions[index].icon,
                                size: constraints.maxWidth > 600
                                    ? size.width * 0.05
                                    : size.width * 0.13,
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                menuOptions[index].name,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth > 600
                                      ? size.width * 0.02
                                      : size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
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
