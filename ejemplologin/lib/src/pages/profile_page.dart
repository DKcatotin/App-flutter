import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variables para el perfil
  String name = "John Doe";
  String email = "johndoe@example.com";
  String bio = "Desarrollador de Flutter y amante de la tecnología.";

  // Controladores para los campos de texto
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  // Función para guardar cambios
  void _saveProfile() {
    setState(() {
      name = nameController.text;
      email = emailController.text;
      bio = bioController.text;
    });
    // Aquí podrías agregar lógica para guardar estos datos en una base de datos o servidor
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perfil actualizado')),
    );
  }

  @override
  void initState() {
    super.initState();
    // Inicializar los controladores con los valores actuales
    nameController.text = name;
    emailController.text = email;
    bioController.text = bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Aquí está tu perfil",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo electrónico'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Biografía'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Guardar Cambios'),
            ),
            const SizedBox(height: 20),
            Text('Nombre: $name', style: const TextStyle(fontSize: 16)),
            Text('Correo: $email', style: const TextStyle(fontSize: 16)),
            Text('Biografía: $bio', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
