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
    final List<String> modulos = [
      'Clientes',
      'Vehículos',
      'Mecánicos',
      'Repuestos',
      'Gestión de Servicios',
    ];

    final List<IconData> iconos = [
      Icons.people_alt_rounded,
      Icons.directions_car_rounded,
      Icons.engineering_rounded,
      Icons.build_circle_rounded,
      Icons.assignment_rounded,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicacion de gestion'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: modulos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
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
                      textAlign: TextAlign.center, 
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

