// =============================
// 🟩 SECCIÓN: Importaciones
// =============================
import 'package:flutter/material.dart';
import '../../../services/company_service.dart';  // Importa el servicio

// =============================
// 🟩 SECCIÓN: Clase CompanyScreen
// =============================
class CompanyScreen extends StatefulWidget {
  final Map<String, dynamic> company;

  const CompanyScreen({Key? key, required this.company}) : super(key: key);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

// =============================
// 🟩 SECCIÓN: Estado de CompanyScreen (_CompanyScreenState)
// =============================
class _CompanyScreenState extends State<CompanyScreen> {
  late TextEditingController _insuranceIdController;
  late TextEditingController _companyNameController;
  late TextEditingController _contactNumberController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;

  bool _isEditing = false; // Controla si los campos son editables

  @override
  void initState() {
    super.initState();
    _insuranceIdController = TextEditingController(text: widget.company['insurance_id'].toString());
    _companyNameController = TextEditingController(text: widget.company['company_name']);
    _contactNumberController = TextEditingController(text: widget.company['contact_number']);
    _emailController = TextEditingController(text: widget.company['email']);
    _addressController = TextEditingController(text: widget.company['address']);
  }

  @override
  void dispose() {
    _insuranceIdController.dispose();
    _companyNameController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _saveCompanyInfo() async {
    final updatedData = {
      'company_name': _companyNameController.text,
      'contact_number': _contactNumberController.text,
      'email': _emailController.text,
      'address': _addressController.text,
    };

    try {
      final companyService = CompanyService();
      final companyId = widget.company['insurance_id'];
      final success = await companyService.editCompany(companyId, updatedData);

      if (success) {
        setState(() {
          widget.company.addAll(updatedData);
          _isEditing = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Información guardada exitosamente!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar la información: $e')),
      );
    }
  }

  void _enableEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la Compañía'),
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.7,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color.fromARGB(255, 25, 142, 150),
                        child: const Icon(
                          Icons.business,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _insuranceIdController,
                            decoration: InputDecoration(
                              labelText: 'ID del Seguro',
                              labelStyle: TextStyle(
                                color: _isEditing ? Colors.green : Colors.black,
                                fontSize: 16,  // Tamaño de fuente consistente
                              ),
                            ),
                            enabled: false,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _companyNameController,
                            decoration: InputDecoration(
                              labelText: 'Nombre de la Compañía',
                              labelStyle: TextStyle(
                                color: _isEditing ? Colors.green : Colors.black,
                                fontSize: 16,  // Tamaño de fuente consistente
                              ),
                            ),
                            enabled: _isEditing,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _contactNumberController,
                            decoration: InputDecoration(
                              labelText: 'Número de Contacto',
                              labelStyle: TextStyle(
                                color: _isEditing ? Colors.green : Colors.black,
                                fontSize: 16,  // Tamaño de fuente consistente
                              ),
                            ),
                            enabled: _isEditing,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Correo Electrónico',
                              labelStyle: TextStyle(
                                color: _isEditing ? Colors.green : Colors.black,
                                fontSize: 16,  // Tamaño de fuente consistente
                              ),
                            ),
                            enabled: _isEditing,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: 'Dirección',
                              labelStyle: TextStyle(
                                color: _isEditing ? Colors.green : Colors.black,
                                fontSize: 16,  // Tamaño de fuente consistente
                              ),
                            ),
                            enabled: _isEditing,
                          ),
                          const SizedBox(height: 20),

                          _isEditing
                              ? Center(
                                  child: ElevatedButton(
                                    onPressed: _saveCompanyInfo,
                                    child: const Text(
                                      'Guardar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14, // Tamaño consistente
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.3, vertical: 28),
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
                                        fontSize: 16, // Tamaño consistente
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.3, vertical: 28),
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
          ),
        ],
      ),
    );
  }
}
