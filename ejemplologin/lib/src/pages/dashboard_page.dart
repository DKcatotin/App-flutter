import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Lista de datos dinámica
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  // Método para agregar un nuevo ítem
  void _addItem() {
    setState(() {
      items.add('Item ${items.length + 1}');
    });
  }

  // Método para eliminar un ítem
  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel Principal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Bienvenido al Panel Principal",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Agregar ítem'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(items[index]),  // Usar el texto del ítem como clave única
                    onDismissed: (direction) {
                      // Remover el ítem de la lista
                      _removeItem(index);
                      // Mostrar un mensaje de confirmación
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${items[index]} eliminado')),
                      );
                    },
                    child: ListTile(
                      title: Text(items[index]),
                      trailing: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
