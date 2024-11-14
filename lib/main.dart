import 'package:flutter/material.dart';
import 'apartado_botones.dart';

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
          headlineLarge: TextStyle(
            fontFamily: 'RubikBubbles',
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
      home: LoginScreen(),
      routes: {
        '/botones': (context) => ApartadoBotones(),
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
      body: Stack(
        children: [
          // Fondo de imagen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/futbol.jpg'),
                fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
              ),
            ),
          ),
          
          // Capa semi-transparente para mejorar la legibilidad
          Container(
            color: Colors.black.withOpacity(0.6), // Ajusta la opacidad para oscurecer el fondo
          ),

          // Contenido de la pantalla de login
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/goku.jpg'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Login de Juan Toaso',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 40),
                    _buildTextField(
                      controller: _emailController,
                      label: 'Correo Electrónico',
                      hintText: 'Ingresa tu correo',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Contraseña',
                      hintText: 'Ingresa tu contraseña',
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    _buildLoginButton(context),
                    SizedBox(height: 16),
                    _buildRegisterButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(icon, color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String email = _emailController.text;
        String password = _passwordController.text;

        if (_validateInput(context, email, password)) {
          Navigator.pushNamed(context, '/botones');
        }
      },
      child: Text('Iniciar Sesión'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Funcionalidad de registro próximamente')),
        );
      },
      child: Text('Regístrate'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade500,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }

  bool _validateInput(BuildContext context, String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return false;
    } else if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un correo válido')),
      );
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }
}
