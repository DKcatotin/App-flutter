import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          backgroundColor: Colors.indigo,
        ),
        body: const Center(
          child: Text(
            "Crear una pantalla de una app ",
            style: TextStyle(
              fontFamily: "NerkoOne",
              fontSize: 40.0,
              color: Color.fromARGB(225, 50, 50, 50),
            ),
          ),
        ),
        //pie de pagina 
        /*
        djdaidniandand
        maodoadoamdmam
        mdodmm
        */
        bottomNavigationBar: BottomAppBar(
          color: Colors.indigo,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Acción del botón izquierdo
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Atrás"),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Acción del botón derecho
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text("Siguiente"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
