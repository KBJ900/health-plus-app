// =============================
// 🟩 SECCIÓN: Importación de paquetes
// =============================

import 'package:flutter/material.dart';

// =============================
// 🟩 SECCIÓN: HomeDoctorPage
// =============================

class HomeDoctorPage extends StatefulWidget {
  HomeDoctorPage({Key? key}) : super(key: key);

  @override
  _HomeDoctorPageState createState() => _HomeDoctorPageState();
}

// =============================
// 🟩 SECCIÓN: Estado de HomeDoctorPage
// =============================

class _HomeDoctorPageState extends State<HomeDoctorPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _users = List.generate(20, (index) {
    return {
      'name': 'Expediente $index',
      'email': 'Expedient$index@example.com',
    };
  });
  List<Map<String, String>> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = _users;
    _searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterUsers);
    _searchController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _users.where((user) {
        final name = user['name']!.toLowerCase();
        final email = user['email']!.toLowerCase();
        return name.contains(query) || email.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // =============================
            // 🟩 SECCIÓN: Fondo de imagen
            // =============================
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // =============================
            // 🟩 SECCIÓN: Cabecera
            // =============================
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 103, 116),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(
                      children: const [
                        Text(
                          'Bienvenido',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Test doctor',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // =============================
                // 🟩 SECCIÓN: Subtítulo "Lista de Expedientes"
                // =============================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 103, 116),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      'Lista de Expedientes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // =============================
                // 🟩 SECCIÓN: Barra de búsqueda
                // =============================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(34),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(34),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Buscar por nombre o email...',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ),

                // =============================
                // 🟩 SECCIÓN: Lista de usuarios filtrados
                // =============================
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: _filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = _filteredUsers[index];
                      return _AnimatedCard(user: user);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =============================
// 🟩 SECCIÓN: _AnimatedCard
// =============================

class _AnimatedCard extends StatefulWidget {
  final Map<String, String> user;

  const _AnimatedCard({Key? key, required this.user}) : super(key: key);

  @override
  State<_AnimatedCard> createState() => _AnimatedCardState();
}

// =============================
// 🟩 SECCIÓN: Estado de _AnimatedCard
// =============================

class _AnimatedCardState extends State<_AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) return;
        _controller.reset();
        _controller.forward();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final rotation = _controller.value * 2 * 3.1416;
          return Transform(
            transform: Matrix4.rotationY(rotation),
            alignment: Alignment.center,
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: const Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Stack(
            children: [
              // =============================
              // 🟩 SECCIÓN: Contenido de la tarjeta
              // =============================
              Column(
                children: [
                  const Spacer(),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.green[400]?.withOpacity(0.8),
                    child: const Icon(
                      Icons.insert_drive_file,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 11, 103, 116),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.user['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.user['email']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
