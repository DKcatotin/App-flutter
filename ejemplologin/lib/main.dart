import 'package:ejemplologin/src/home.dart';
import 'package:flutter/material.dart';
import 'src/pantalla1.dart';
import 'src/formulario.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
  '/': (context) => const AppLogin(),
  '/register': (context) => const RegisterPage(),
  '/home': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return HomePage(username: args ?? 'UsuarioDesconocido');
  },
},
    );
  }
}
