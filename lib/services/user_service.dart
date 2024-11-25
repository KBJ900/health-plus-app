import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String apiUrl = 'https://health-back-lingering-wave-8458.fly.dev/api/paymentLetters/';

  Future<Map<String, dynamic>> getUserDetails() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener los detalles del usuario');
    }
  }
}
