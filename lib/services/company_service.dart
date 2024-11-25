import 'dart:convert';
import 'package:http/http.dart' as http;

class CompanyService {
  final String _baseUrl = "https://health-back-lingering-wave-8458.fly.dev/api/companies";

  Future<List<Map<String, dynamic>>> getCompanies() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((company) => company as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load companies');
    }
  }
}
