import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String? _nombre;
  String? _email;
  String? _cedula;
  String? _direccion;
  String? _telefono;
  String? _genero;
  String? _estadoCivil;

  final List<String> _generos = ['Masculino', 'Femenino', 'Otro'];
  final List<String> _estadosCiviles = ['Soltero', 'Casado', 'Divorciado', 'Viudo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Registro'),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Nombre',
                icon: Icons.person,
                onSaved: (value) => _nombre = value,
                validator: (value) => value == null || value.isEmpty ? 'Ingrese su nombre' : null,
              ),
              _buildTextField(
                label: 'Cédula',
                icon: Icons.badge,
                keyboardType: TextInputType.number,
                onSaved: (value) => _cedula = value,
                validator: (value) => value == null || value.isEmpty ? 'Ingrese su cédula' : null,
              ),
              _buildTextField(
                label: 'Dirección',
                icon: Icons.home,
                onSaved: (value) => _direccion = value,
                validator: (value) => value == null || value.isEmpty ? 'Ingrese su dirección' : null,
              ),
              _buildTextField(
                label: 'Teléfono',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                onSaved: (value) => _telefono = value,
                validator: (value) => value == null || value.length < 7 ? 'Teléfono inválido' : null,
              ),
              _buildTextField(
                label: 'Correo electrónico',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value,
                validator: (value) =>
                    value == null || !value.contains('@') ? 'Correo inválido' : null,
              ),
              const SizedBox(height: 15),
              const Text(
                'Género:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                children: _generos.map((genero) {
                  return RadioListTile<String>(
                    title: Text(genero),
                    value: genero,
                    groupValue: _genero,
                    onChanged: (value) {
                      setState(() {
                        _genero = value;
                      });
                    },
                  );
                }).toList(),
              ),
              if (_genero == null)
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
                  child: Text(
                    'Seleccione su género',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              _buildDropdown(
                label: 'Estado civil',
                icon: Icons.favorite,
                items: _estadosCiviles,
                onChanged: (value) => _estadoCivil = value,
                validator: (value) => value == null ? 'Seleccione su estado civil' : null,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text("Grabar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      final generoSeleccionado = _genero != null;
                      if (isValid && generoSeleccionado) {
                        _formKey.currentState!.save();
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Datos guardados"),
                            content: Text(
                              "Nombre: $_nombre\n"
                              "Cédula: $_cedula\n"
                              "Dirección: $_direccion\n"
                              "Teléfono: $_telefono\n"
                              "Correo: $_email\n"
                              "Género: $_genero\n"
                              "Estado civil: $_estadoCivil",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else if (!generoSeleccionado) {
                        setState(() {}); // Para mostrar el error visual
                      }
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text("Salir"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required List<String> items,
    required FormFieldSetter<String?> onChanged,
    required FormFieldValidator<String?> validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        items: items.map((item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
