import 'package:flutter/material.dart';
import '../../../../services/company_service.dart'; // Importa el servicio de compañías
import '../../list_pacientes/companies_screen.dart'; // Asegúrate de importar la pantalla donde se muestran los detalles de la compañía

class ListCompanies extends StatefulWidget {
  const ListCompanies({Key? key}) : super(key: key);

  @override
  _ListCompaniesState createState() => _ListCompaniesState();
}

class _ListCompaniesState extends State<ListCompanies> {
  final CompanyService _companyService = CompanyService();
  late Future<List<Map<String, dynamic>>> _futureCompanies;

  @override
  void initState() {
    super.initState();
    _futureCompanies = _companyService.getCompanies(); // Llama al servicio para obtener las compañías
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Color de fondo general
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde personalizado
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), // Esquinas inferiores redondeadas
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Sombra ligera
                    blurRadius: 10, // Difuminación de la sombra
                    offset: Offset(0, 5), // Desplazamiento de la sombra
                  ),
                ],
              ),
              padding: EdgeInsets.all(20), // Espaciado interno
              alignment: Alignment.center, // Centrar el contenido
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Compañías de Seguros',
                    style: TextStyle(
                      color: Colors.white, // Texto en blanco para contraste
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10), // Espaciado entre textos
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>( // Construir la lista de compañías
              future: _futureCompanies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No hay compañías disponibles"));
                }

                final companies = snapshot.data!;

                return ListView.builder(
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    final company = companies[index];
                    return GestureDetector(
                      onTap: () {
                        // Navegar a la pantalla de detalles de la compañía
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyScreen(company: company),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0, 2),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color.fromARGB(255, 25, 142, 150),
                              child: const Icon(
                                Icons.business,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  company['company_name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  company['email'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
