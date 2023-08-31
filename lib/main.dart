import 'package:flutter/material.dart';
import 'package:login/home/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Nombre de usuario'),
            autovalidateMode: AutovalidateMode.always,
            validator: (value) {
              if (value != null && !value.isNotEmpty) {
                return 'Por favor ingresa tu nombre de usuario';
              } else if (value != null && value.length < 3) {
                return 'El nombre de usuario debe tener al menos 3 caracteres';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Por favor ingresa tu correo electrónico';
              } else if (value != null && !value.contains(RegExp(r"^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"))) {
                return 'el correo no es valido';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Por favor ingresa tu contraseña';
              } else if (value != null && value.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              } else if (value != null && !value.contains(RegExp(r'[A-Za-z]'))) {
                return 'La contraseña debe contener al menos una letra';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            color: Colors.blueAccent.shade400,
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Procesando Datos')));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Welcome()));
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
