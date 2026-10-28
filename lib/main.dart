import 'package:flutter/material.dart';

void main() {
  runApp(const AppTaller());
}

class AppTaller extends StatelessWidget {
  const AppTaller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Taller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const PantallaMenuPrincipal(),
    );
  }
}

class PantallaMenuPrincipal extends StatelessWidget {
  const PantallaMenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos tus 5 botones específicos
    final List<String> modulos = [
      'Clientes',
      'Vehículos',
      'Mecánicos',
      'Repuestos',
      'Gestión de Servicios',
    ];

    // Iconos ideales para cada categoría automotriz
    final List<IconData> iconos = [
      Icons.people_alt_rounded,       // Clientes
      Icons.directions_car_rounded,   // Vehículos
      Icons.engineering_rounded,      // Mecánicos
      Icons.build_circle_rounded,     // Repuestos
      Icons.assignment_rounded,       // Gestión de Servicios
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GestorApp El Ultimo Arranque'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: modulos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Mantiene la estructura de 2 columnas
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2, // Ajustamos un poco la altura de los botones
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  // Muestra en la consola de VS Code qué módulo se seleccionó
                  print('Abriendo módulo: ${modulos[index]}');
                },
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconos[index],
                      size: 44,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      modulos[index],
                      textAlign: TextAlign.center, // Centra el texto si es largo
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

