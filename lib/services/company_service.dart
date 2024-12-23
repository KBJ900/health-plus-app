import 'dart:convert';
import 'package:http/http.dart' as http;

class CompanyService {
  final String _baseUrl = "https://health-back-lingering-wave-8458.fly.dev/api/companies";

  // Obtener la lista de compañías
  Future<List<Map<String, dynamic>>> getCompanies() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((company) => company as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load companies');
    }
  }

  // Editar una compañía
  Future<bool> editCompany(int companyId, Map<String, dynamic> updatedData) async {
    final String url = "$_baseUrl/companyEdit/$companyId";

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(updatedData),
    );

    if (response.statusCode == 200) {
      return true; // Indica que la operación fue exitosa
    } else {
      throw Exception('Failed to edit company: ${response.reasonPhrase}');
    }
  }

Future<bool> createCompany(Map<String, dynamic> companyData) async {
  final String url = "$_baseUrl/company";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(companyData),
    );

    if (response.statusCode == 200) {
      return true; // Indica que la operación fue exitosa
    } else {
      // Aquí imprimimos la respuesta completa para ver qué nos está enviando el servidor
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to create company: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error al hacer la solicitud: $e');
    throw Exception('Failed to create company');
  }
}


}
