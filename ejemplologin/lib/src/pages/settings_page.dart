import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Variables de configuración
  bool isDarkMode = false;
  bool areNotificationsEnabled = true;
  double fontSize = 16.0;

  // Función para guardar la configuración
  void _saveSettings() {
    // Aquí podrías agregar lógica para guardar los datos (localmente, en una base de datos o servidor)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Configuración guardada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Configuración de la aplicación",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            // Opción para el modo oscuro
            SwitchListTile(
              title: const Text('Modo oscuro'),
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
            // Opción para las notificaciones
            SwitchListTile(
              title: const Text('Notificaciones'),
              value: areNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  areNotificationsEnabled = value;
                });
              },
            ),
            // Selector de tamaño de fuente
            ListTile(
              title: const Text('Tamaño de fuente'),
              subtitle: Text('Fuente actual: $fontSize'),
              trailing: DropdownButton<double>(
                value: fontSize,
                items: const [
                  DropdownMenuItem(child: Text('Pequeña'), value: 12.0),
                  DropdownMenuItem(child: Text('Mediana'), value: 16.0),
                  DropdownMenuItem(child: Text('Grande'), value: 20.0),
                ],
                onChanged: (double? newValue) {
                  setState(() {
                    fontSize = newValue ?? 16.0;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Guardar Configuración'),
            ),
            const SizedBox(height: 20),
            // Mostrar las configuraciones actuales
            Text('Modo oscuro: ${isDarkMode ? 'Activado' : 'Desactivado'}'),
            Text('Notificaciones: ${areNotificationsEnabled ? 'Habilitadas' : 'Desactivadas'}'),
            Text('Tamaño de fuente: $fontSize'),
          ],
        ),
      ),
    );
  }
}
