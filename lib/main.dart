import 'package:flutter/material.dart';
import 'apartado_botones.dart'; // Importa el archivo de ApartadoBotones

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App con RubikBubbles y Goku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'RubikBubbles',
            fontSize: 16,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'RubikBubbles',
            fontSize: 14,
            color: Colors.black,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'RubikBubbles',
            fontSize: 32,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'RubikBubbles',
            fontSize: 28,
            color: Colors.black,
          ),
        ),
      ),
      home: LoginScreen(),
      routes: {
        '/botones': (context) => ApartadoBotones(), // Define la ruta para ApartadoBotones
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App con RubikBubbles',
          style: TextStyle(
            fontFamily: 'RubikBubbles',
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/goku.jpg', // Asegúrate de que la ruta sea correcta
                height: 200,
              ),
              SizedBox(height: 20),

              Text(
                'Login de Juan Toaso',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              SizedBox(height: 40),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  hintText: 'Ingresa tu correo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingresa tu contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Por favor, completa todos los campos')),
                    );
                  } else {
                    // Navegar a ApartadoBotones si el inicio de sesión es exitoso
                    Navigator.pushNamed(context, '/botones');
                  }
                },
                child: Text('Iniciar Sesión'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontFamily: 'RubikBubbles', fontSize: 18),
                ),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  // Aquí puedes añadir la lógica para la navegación a la pantalla de registro
                  print("Ir a la pantalla de registro");
                },
                child: Text('Regístrate'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontFamily: 'RubikBubbles', fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
