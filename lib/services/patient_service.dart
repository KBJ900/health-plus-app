import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientService {
  // URL base del servicio de usuarios.
  static const String baseUrl = "https://health-back-lingering-wave-8458.fly.dev/api/users";

  // Método para obtener la lista de pacientes.
  Future<List<Map<String, dynamic>>> getPatients() async {
    final url = Uri.parse("$baseUrl/patients"); // Construye la URL.

    try {
      // Realiza la solicitud GET.
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );

      // Verifica el estado de la respuesta.
      if (response.statusCode == 200) {
        // Decodifica la respuesta JSON a una lista de mapas.
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>(); // Convierte la lista a Map<String, dynamic>.
      } else {
        throw Exception("Error al obtener pacientes: ${response.body}");
      }
    } catch (e) {
      rethrow; // Propaga el error.
    }
  }
}
