import 'package:flutter/material.dart';
import '../../../../services/company_service.dart';
import '../../list_pacientes/companies_screen.dart';

class ListCompanies extends StatefulWidget {
  const ListCompanies({Key? key}) : super(key: key);

  @override
  _ListCompaniesState createState() => _ListCompaniesState();
}

class _ListCompaniesState extends State<ListCompanies> {
  final CompanyService _companyService = CompanyService();
  late Future<List<Map<String, dynamic>>> _futureCompanies;
  List<Map<String, dynamic>> _filteredCompanies = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureCompanies = _companyService.getCompanies();
    _searchController.addListener(_filterCompanies);
  }

  void _filterCompanies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCompanies = _filteredCompanies.isEmpty
          ? []
          : _filteredCompanies
              .where((company) =>
                  company['company_name'].toLowerCase().contains(query) ||
                  company['email'].toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenido de la pantalla
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 11, 103, 116), // Fondo verde personalizado
                    borderRadius: BorderRadius.only(
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
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Seguros',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              

              
              // Subtítulo "Lista de Seguros"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 11, 103, 116),
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
                    'Lista de Seguros',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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

              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
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

                    // Filtrar las compañías según la búsqueda
                    final filteredCompanies = _filteredCompanies.isEmpty
                        ? companies
                        : _filteredCompanies;

                    return ListView.builder(
                      itemCount: filteredCompanies.length,
                      itemBuilder: (context, index) {
                        final company = filteredCompanies[index];
                        return GestureDetector(
                          onTap: () {
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
        ],
      ),
    );
  }
}
