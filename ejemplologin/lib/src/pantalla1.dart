import 'package:flutter/material.dart';
import 'home.dart'; // Asegúrate que esta ruta esté correcta según tu estructura

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AppLogin extends StatefulWidget {
  const AppLogin({super.key});

  @override
  State<AppLogin> createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 100.0,
                backgroundColor: Color.fromARGB(255, 25, 218, 57),
                backgroundImage: AssetImage("images/nn.jpg"),
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontFamily: "Monoton",
                  fontSize: 30.0,
                  color: Color.fromARGB(137, 187, 6, 6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Ejemplo2',
                style: TextStyle(
                  fontFamily: "PressStart",
                  fontSize: 30.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Color.fromARGB(255, 43, 230, 214)),
              ),
              TextField(
                controller: _userController,
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  labelText: 'usuario',
                  icon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: _passController,
                obscureText: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  labelText: 'contraseña',
                  icon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.red.shade200),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        String username = _userController.text.trim();
                        if (username.isNotEmpty) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomePage(username: username),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ingresa un nombre de usuario')),
                          );
                        }
                      },
                      label: const Text("Iniciar Sesión"),
                      icon: const Icon(Icons.login),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    icon: const Icon(Icons.app_registration),
                    label: const Text("Registrarse"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/forgot");
                    },
                    icon: const Icon(Icons.lock_open),
                    label: const Text("¿Olvidaste tu contraseña?"),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
