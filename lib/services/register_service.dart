// =============================
// 🟦 SECCIÓN: Importaciones y configuración inicial
// =============================
import 'package:http/http.dart' as http; // Paquete para realizar solicitudes HTTP.
import 'dart:convert'; // Paquete para convertir datos entre JSON y Map en Dart.

class RegisterService {
  // URL base del servicio de usuarios móviles.
  static const String baseUrl = "https://health-back-lingering-wave-8458.fly.dev/api/mobileUsers";

  // =============================
  // 🟩 SECCIÓN: Método de Registro
  // =============================
  // Método para registrar un usuario, recibe correo y contraseña como parámetros.
  Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse("$baseUrl/register"); // Construye la URL completa para registro.

    try {
      // =============================
      // 🟨 SECCIÓN: Realiza la solicitud POST
      // =============================
      final response = await http.post(
        url, // URL de la solicitud.
        headers: {
          "Content-Type": "application/json", // Especifica el formato del cuerpo (JSON).
          // Puedes agregar más cabeceras si es necesario, como autorización o user-agent
        },
        body: jsonEncode({
          "email": email, // Asigna el correo recibido al cuerpo de la solicitud.
          "password": password, // Asigna la contraseña recibida al cuerpo de la solicitud.
        }),
      );

      // =============================
      // 🟧 SECCIÓN: Manejo de respuesta HTTP
      // =============================
      if (response.statusCode == 201) {
        // Si el estado es 201 (Creado), decodifica la respuesta JSON a un mapa de datos.
        return jsonDecode(response.body);
      } else {
        // Si ocurre un error, lanza una excepción con el mensaje del error.
        final errorData = jsonDecode(response.body);
        String errorMessage = errorData['message'] ?? 'Error desconocido';
        throw Exception("Error en el registro: $errorMessage");
      }
    } catch (e) {
      // En caso de error, se maneja y vuelve a lanzar para ser capturado externamente
      print("Error en la solicitud: $e");
      rethrow; // Rethrow para que pueda ser manejado en la UI o en el llamador
    }
  }
}
