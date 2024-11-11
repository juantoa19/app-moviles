import 'package:flutter/material.dart';
import 'package:login/calculadora_screen.dart'; // Asegúrate de importar la pantalla de calculadora

class ApartadoBotones extends StatefulWidget {
  @override
  _ApartadoBotonesState createState() => _ApartadoBotonesState();
}

class _ApartadoBotonesState extends State<ApartadoBotones> {
  final bool_isHovered = false;
  bool _isPressed = false;
  bool _isPressedFade = false;
  double _buttonSize = 50.0;
  bool _isButtonClicked = false; // Estado para el botón de cambio de color
  int _selectedTimeIndex = 0; // Estado para el selector de tiempo
  int _selectedViewIndex = 0; // Estado para el selector de vista

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apartado de Botones'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Selector de tiempo (Day, Week, Month, Year)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ToggleButtons(
                isSelected: List.generate(4, (index) => index == _selectedTimeIndex),
                onPressed: (index) {
                  setState(() {
                    _selectedTimeIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                selectedColor: Colors.white,
                fillColor: Colors.teal,
                color: Colors.grey,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Day"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Week"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Month"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Year"),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),

            // Selector de vista (Individual / Grupal)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ToggleButtons(
                isSelected: List.generate(2, (index) => index == _selectedViewIndex),
                onPressed: (index) {
                  setState(() {
                    _selectedViewIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(50),
                selectedColor: Colors.white,
                fillColor: Colors.blueGrey,
                color: Colors.grey,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.person),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.group),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Fila de botones con iconos comunes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.home, size: 40, color: Colors.blue),
                  onPressed: () {
                    print('Botón Home presionado');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search, size: 40, color: Colors.green),
                  onPressed: () {
                    print('Botón Search presionado');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings, size: 40, color: Colors.red),
                  onPressed: () {
                    print('Botón Settings presionado');
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            // Nuevos botones con diferentes animaciones

            // Botón con rotación
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isPressed = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isPressed = false;
                  });
                },
                onTap: () {
                  print("Botón con rotación presionado");
                },
                child: AnimatedRotation(
                  turns: _isPressed ? 0.2 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C9CAF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Botón Rotación',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),

            // Botón con fade
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isPressedFade = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isPressedFade = false;
                  });
                },
                onTap: () {
                  print("Botón Fade presionado");
                },
                child: AnimatedOpacity(
                  opacity: _isPressedFade ? 0.5 : 1.0,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 16, 192, 54),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Botón Fade',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),

            // Botón de expansión
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _buttonSize = 70.0; // Expansión al presionar
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _buttonSize = 50.0; // Vuelve a su tamaño original
                  });
                },
                onTap: () {
                  print("Botón Expansión presionado");
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _buttonSize,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 73, 73),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Botón Expansión',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Botón con animación de cambio de color al presionar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isButtonClicked = true; // Cambio de color al presionar
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isButtonClicked = false; // Vuelve al color original
                  });
                },
                onTap: () {
                  print("Botón con cambio de color presionado");
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _isButtonClicked ? Colors.deepOrange : Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Botón Cambio de Color',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),

            // Botón de calculadora
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  // Navegar a la pantalla de la calculadora
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculadoraScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Calculadora',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal[600],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, size: 30, color: Colors.white),
              onPressed: () {
                print("Home button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, size: 30, color: Colors.white),
              onPressed: () {
                print("Settings button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.help, size: 30, color: Colors.white),
              onPressed: () {
                print("Help button pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
