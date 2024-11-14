import 'package:flutter/material.dart';
import 'package:login/calculadora_screen.dart'; // Asegúrate de importar la pantalla de calculadora

class ApartadoBotones extends StatefulWidget {
  @override
  _ApartadoBotonesState createState() => _ApartadoBotonesState();
}

class _ApartadoBotonesState extends State<ApartadoBotones> {
  int _selectedTimeIndex = 0; // Estado para el selector de tiempo
  int _selectedViewIndex = 0; // Estado para el selector de vista
  double _sliderValue = 50.0; // Valor del slider

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

            // Slider llamativo con animación
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Slider Llamativo'),
                    Slider(
                      value: _sliderValue,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (double newValue) {
                        setState(() {
                          _sliderValue = newValue;
                        });
                      },
                    ),
                    Text('Valor: ${_sliderValue.toStringAsFixed(2)}'),
                  ],
                ),
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

           Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    IconButton(
      icon: Icon(Icons.home, size: 40, color: Colors.blue),
      onPressed: () {
        print('Botón Home presionado');
      },
      iconSize: 40,
    ),
    SizedBox(width: 20),
    IconButton(
      icon: Icon(Icons.search, size: 40, color: Colors.green),
      onPressed: () {
        print('Botón Search presionado');
      },
      iconSize: 40,
    ),
    SizedBox(width: 20),
    IconButton(
      icon: Icon(Icons.settings, size: 40, color: Colors.red),
      onPressed: () {
        print('Botón Settings presionado');
      },
      iconSize: 40,
    ),
    SizedBox(width: 20), // Espacio entre los botones
    IconButton(
      icon: Icon(Icons.link, size: 40, color: Colors.purple),  // Icono de enlace
      onPressed: () {
        print('Botón Add Link presionado');
      },
      iconSize: 40,
    ),
  ],
),

            SizedBox(height: 20),

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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
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
  color: const Color.fromARGB(255, 72, 154, 221), // Cambia este valor por el color que desees
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
            IconButton(
              icon: Icon(Icons.contact_mail, size: 30, color: Colors.white),
              onPressed: () {
                print("Contact button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.info, size: 30, color: Colors.white),
              onPressed: () {
                print("Info button pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
