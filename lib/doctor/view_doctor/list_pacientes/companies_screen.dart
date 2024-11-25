import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  final Map<String, dynamic> company;

  const CompanyScreen({Key? key, required this.company}) : super(key: key);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  late TextEditingController _companyNameController;
  late TextEditingController _contactNumberController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;

  bool _isEditing = false; // Controla si los campos son editables

  @override
  void initState() {
    super.initState();
    // Inicializar los controladores con la información de la compañía.
    _companyNameController = TextEditingController(text: widget.company['company_name']);
    _contactNumberController = TextEditingController(text: widget.company['contact_number']);
    _emailController = TextEditingController(text: widget.company['email']);
    _addressController = TextEditingController(text: widget.company['address']);
  }

  @override
  void dispose() {
    // Liberar los controladores cuando la pantalla se cierre.
    _companyNameController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveCompanyInfo() {
    // Guardar la información modificada.
    setState(() {
      widget.company['company_name'] = _companyNameController.text;
      widget.company['contact_number'] = _contactNumberController.text;
      widget.company['email'] = _emailController.text;
      widget.company['address'] = _addressController.text;
      _isEditing = false; // Después de guardar, deshabilitar la edición.
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Información guardada exitosamente!')),
    );
  }

  void _enableEditing() {
    setState(() {
      _isEditing = true; // Habilitar la edición.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la Compañía'),
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
      ),
      body: Container(
        color: Colors.white, // Fondo blanco para la pantalla
        width: double.infinity, // Asegura que el contenedor ocupe todo el ancho disponible
        height: screenHeight, // Hace que el contenedor ocupe toda la altura disponible
        padding: const EdgeInsets.all(20), // Padding alrededor del contenedor
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Círculo con icono de compañía en la parte superior centrado
              Padding(
                padding: const EdgeInsets.only(bottom: 20), // Espacio inferior
                child: CircleAvatar(
                  radius: 50, // Tamaño del círculo
                  backgroundColor: const Color.fromARGB(255, 25, 142, 150),
                  child: const Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 50, // Tamaño del icono dentro del círculo
                  ),
                ),
              ),
              // Contenedor con la información de la compañía
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco para el contenedor de información
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre de la compañía
                    TextField(
                      controller: _companyNameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre de la Compañía',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color si está en edición
                        ),
                      ),
                      enabled: _isEditing, // Solo editable si _isEditing es true
                    ),
                    const SizedBox(height: 10),
                    // Número de contacto
                    TextField(
                      controller: _contactNumberController,
                      decoration: InputDecoration(
                        labelText: 'Número de Contacto',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color a verde si está en edición
                        ),
                      ),
                      enabled: _isEditing, // Solo editable si _isEditing es true
                    ),
                    const SizedBox(height: 10),
                    // Correo electrónico
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color a verde si está en edición
                        ),
                      ),
                      enabled: _isEditing, // Solo editable si _isEditing es true
                    ),
                    const SizedBox(height: 10),
                    // Dirección
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Dirección',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color a verde si está en edición
                        ),
                      ),
                      enabled: _isEditing, // Solo editable si _isEditing es true
                    ),
                    const SizedBox(height: 20),
                    // Si estamos editando, mostrar el botón "Guardar", si no, mostrar el botón "Editar"
                    _isEditing
                        ? Center(
                            child: ElevatedButton(
                              onPressed: _saveCompanyInfo,
                              child: const Text(
                                'Guardar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.3, vertical: 28), // Ajustar la altura
                              ),
                            ),
                          )
                        : Center(
                            child: ElevatedButton(
                              onPressed: _enableEditing,
                              child: const Text(
                                'Editar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.3, vertical: 28), // Ajustar la altura
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
