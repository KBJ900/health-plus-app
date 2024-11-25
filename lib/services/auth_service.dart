// =============================
// 🟦 SECCIÓN: Importaciones y configuración inicial
// =============================
import 'package:http/http.dart' as http; // Paquete para realizar solicitudes HTTP.
import 'dart:convert'; // Paquete para convertir datos entre JSON y Map en Dart.

class AuthService {
  // URL base del servicio de usuarios móviles.
  static const String baseUrl = "https://health-back-lingering-wave-8458.fly.dev/api/mobileUsers";

  // =============================
  // 🟩 SECCIÓN: Método de Login
  // =============================
  // Método para iniciar sesión, recibe correo, contraseña y tipo de cuenta como parámetros.
  Future<Map<String, dynamic>> login(String email, String password, String type) async {
    final url = Uri.parse("$baseUrl/login"); // Construye la URL completa para login.

    try {
      // =============================
      // 🟨 SECCIÓN: Realiza la solicitud POST
      // =============================
      final response = await http.post(
        url, // URL de la solicitud.
        headers: {
          "Content-Type": "application/json", // Especifica el formato del cuerpo (JSON).
        },
        body: jsonEncode({
          "email": email,      // Asigna el correo recibido al cuerpo de la solicitud.
          "password": password, // Asigna la contraseña recibida al cuerpo de la solicitud.
          "type": type         // Añade el tipo de usuario al cuerpo de la solicitud.
        }), // Convierte el mapa de datos a formato JSON.
      );

      // =============================
      // 🟧 SECCIÓN: Manejo de respuesta HTTP
      // =============================
      if (response.statusCode == 200) {
        // Si el estado es 200 (OK), decodifica la respuesta JSON a un mapa de datos.
        Map<String, dynamic> data = jsonDecode(response.body);

        // Verifica si la respuesta contiene la propiedad "message" que podría ser útil.
        if (data.containsKey("message")) {
          print("Mensaje de la respuesta: ${data["message"]}");
        }

        return data; // Devuelve la respuesta en formato Map.
      } else {
        // Si el estado no es 200, lanza una excepción con el mensaje de error.
        throw Exception("Error en la autenticación: ${response.body}");
      }
    } catch (e) {
      // En caso de error, lanza la excepción para que pueda ser manejada externamente.
      rethrow;
    }
  }
}
