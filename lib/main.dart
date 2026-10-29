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
      title: 'GestorApp El Ultimo Arranque',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 186, 25, 63)),
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

    final List<Widget> pantallas = [
      const PantallaClientes(),
      const PantallaVehiculos(),
      const PantallaMecanicos(),
      const PantallaRepuestos(),
      const PantallaServicios(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('El Ultimo Arranque'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pantallas[index]),
                  );
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

class PantallaClientes extends StatelessWidget {
  const PantallaClientes({super.key});

  @override
  Widget build(BuildContext context) {
    final clientes = ['Juan Pérez', 'María López', 'Carlos Mendoza', 'Ana Gómez'];

    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(clientes[index]),
            subtitle: Text('Cliente ID: #00${index + 1}'),
          );
        },
      ),
    );
  }
}

class PantallaVehiculos extends StatelessWidget {
  const PantallaVehiculos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vehículos')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Vehículo registrado con éxito')),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Registrar Nuevo Vehículo'),
        ),
      ),
    );
  }
}

class PantallaMecanicos extends StatelessWidget {
  const PantallaMecanicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mecánicos')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Text('R')),
                title: const Text('Ricardo Gómez'),
                subtitle: const Text('Especialidad: Motores'),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(8)),
                  child: const Text('Disponible', style: TextStyle(color: Colors.green)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaRepuestos extends StatefulWidget {
  const PantallaRepuestos({super.key});

  @override
  State<PantallaRepuestos> createState() => _PantallaRepuestosState();
}

class _PantallaRepuestosState extends State<PantallaRepuestos> {
  int stockPastillas = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repuestos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pastillas de Freno (Brembo)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Stock actual: $stockPastillas unidades', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: () => setState(() => stockPastillas--), 
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                IconButton.filledTonal(
                  onPressed: () => setState(() => stockPastillas++), 
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PantallaServicios extends StatefulWidget {
  const PantallaServicios({super.key});

  @override
  State<PantallaServicios> createState() => _PantallaServiciosState();
}

class _PantallaServiciosState extends State<PantallaServicios> {
  bool servicioIniciado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Servicios')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.playlist_add_check_circle, 
              size: 80, 
              color: servicioIniciado ? Colors.green : Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              servicioIniciado ? 'Orden de Trabajo: EN PROCESO' : 'Orden de Trabajo: DETENIDA',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Switch(
              value: servicioIniciado,
              onChanged: (valor) {
                setState(() {
                  servicioIniciado = valor;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
