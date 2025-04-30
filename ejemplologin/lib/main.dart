import 'package:flutter/material.dart';
import 'src/pantalla1.dart';

import 'src/formulario.dart';     // Este es el archivo donde está RegisterPage
 

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
   
      },
    );
  }
}
