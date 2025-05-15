import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  // Variables para las preguntas frecuentes
  List<Map<String, String>> faqs = [
    {
      'question': '¿Cómo usar la aplicación?',
      'answer': 'Solo regístrate, inicia sesión y comienza a explorar las funcionalidades.',
    },
    {
      'question': '¿Cómo cambiar la configuración?',
      'answer': 'Dirígete a la sección de Configuración desde el menú principal para ajustar tus preferencias.',
    },
    {
      'question': '¿Cómo contactar con soporte?',
      'answer': 'Puedes contactarnos a través del formulario de contacto o enviar un correo a soporte@ejemplo.com.',
    },
  ];

  final TextEditingController _messageController = TextEditingController();

  // Función para enviar mensaje de ayuda
  void _sendHelpRequest() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      // Aquí podrías agregar lógica para enviar el mensaje (a un servidor, base de datos, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mensaje enviado, te responderemos pronto.')),
      );
      _messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa un mensaje.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayuda')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "¿Necesitas ayuda? Aquí la encuentras",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Preguntas frecuentes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Mostrar preguntas frecuentes
            ...faqs.map((faq) {
              return ExpansionTile(
                title: Text(faq['question']!),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faq['answer']!),
                  ),
                ],
              );
            }).toList(),
            const SizedBox(height: 20),
            const Text(
              "¿No encuentras lo que buscas? Envíanos un mensaje:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Campo de texto para enviar mensaje
            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Escribe tu mensaje...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Botón para enviar mensaje
            ElevatedButton(
              onPressed: _sendHelpRequest,
              child: const Text('Enviar mensaje'),
            ),
          ],
        ),
      ),
    );
  }
}
