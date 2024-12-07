import 'package:flutter/material.dart';
import 'dart:async';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late List<IconData> _icons;
  late List<bool> _cardFlipped;
  late Timer _timer;
  bool _gameStarted = false;
  int _elapsedSeconds = 0;
  int _matchesFound = 0;
  List<int> _flippedIndexes = [];

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    // Lista de íconos para el juego
    _icons = [
      Icons.favorite,
      Icons.star,
      Icons.cake,
      Icons.ac_unit,
      Icons.pets,
      Icons.beach_access,
    ];
    _icons = [..._icons, ..._icons]; // Duplicar íconos para hacer pares
    _icons.shuffle(); // Mezclar los íconos
    _cardFlipped = List<bool>.filled(_icons.length, false);
    _elapsedSeconds = 0;
    _matchesFound = 0;
    _flippedIndexes.clear();
  }

  void _startOrRestartGame() {
    if (_gameStarted) {
      // Reiniciar juego
      _timer.cancel();
      _initGame();
      setState(() {
        _gameStarted = false;
      });
    } else {
      // Iniciar juego
      setState(() {
        _gameStarted = true;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _elapsedSeconds++;
        });
      });
    }
  }

  void _flipCard(int index) {
    if (_flippedIndexes.length >= 2 || _cardFlipped[index]) return;

    setState(() {
      _cardFlipped[index] = true;
      _flippedIndexes.add(index);
    });

    if (_flippedIndexes.length == 2) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          final firstIndex = _flippedIndexes[0];
          final secondIndex = _flippedIndexes[1];
          if (_icons[firstIndex] == _icons[secondIndex]) {
            _matchesFound++;
            if (_matchesFound == _icons.length ~/ 2) {
              _timer.cancel();
            }
          } else {
            _cardFlipped[firstIndex] = false;
            _cardFlipped[secondIndex] = false;
          }
          _flippedIndexes.clear();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con la imagen
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover, // Ajusta la imagen para que cubra toda la pantalla
            ),
          ),
          // Contenido del juego
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.green[800], // Fondo verde oscuro para la card
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Tiempo: $_elapsedSeconds segundos',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Letra blanca
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ], // Sombra para resaltar el texto
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20), // Añadir un margen lateral
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,  // 3 columnas
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: _icons.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: _gameStarted ? () => _flipCard(index) : null,
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              return RotationTransition(turns: animation, child: child);
                            },
                            child: _cardFlipped[index]
                                ? Container(
                                    key: ValueKey(true),
                                    decoration: BoxDecoration(
                                      color: Colors.green[800], // Carta verde oscuro cuando está volteada
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        _icons[index],
                                        size: 50, // Aumentar el tamaño del ícono
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Container(
                                    key: ValueKey(false),
                                    decoration: BoxDecoration(
                                      color: Colors.green[300], // Carta verde claro cuando está oculta
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(color: Colors.white, fontSize: 24),
                                      ),
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (!_gameStarted && _matchesFound == _icons.length ~/ 2)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '¡Juego terminado!\nTiempo final: $_elapsedSeconds segundos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5, // 50% del ancho disponible
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800], // Verde oscuro
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.symmetric(vertical: 20), // Aumenta el tamaño vertical del botón
                      textStyle: TextStyle(fontSize: 24), // Aumenta el tamaño del texto
                    ),
                    onPressed: _startOrRestartGame,
                    child: Text(_gameStarted ? 'Reiniciar' : 'Iniciar'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_gameStarted) {
      _timer.cancel();
    }
    super.dispose();
  }
}
