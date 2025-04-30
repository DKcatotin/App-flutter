import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Color.fromARGB(255, 25, 218, 57),
                backgroundImage: AssetImage("images/nn.jpg"),
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: "Monoton",
                  fontSize: 30.0,
                  color: const Color.fromARGB(137, 187, 6, 6),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Ejemplo2',
                style: TextStyle(
                  fontFamily: "PressStart",
                  fontSize: 30.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: const Color.fromARGB(255, 43, 230, 214)),
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  labelText: 'usuario',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                enableInteractiveSelection: false,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  labelText: 'contraseña',
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.red.shade200),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushNamed(context, "/pantalla1");
                      },
                      label: Text("Iniciar Sesion"),
                      icon: Icon(Icons.login),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),

              // Nuevo botón: Registrarse
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    icon: Icon(Icons.app_registration),
                    label: Text("Registrarse"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/forgot");
                    },
                    icon: Icon(Icons.lock_open),
                    label: Text("¿Olvidaste tu contraseña?"),
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
