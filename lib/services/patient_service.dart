import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientService {
  static const String baseUrl = "https://health-back-lingering-wave-8458.fly.dev/api/users";

  Future<List<Map<String, dynamic>>> getPatients() async {
    final url = Uri.parse("$baseUrl/patients");

    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception("Error al obtener pacientes: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> editPatient(int patientId, Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/patients/patientEdit/$patientId");
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return 'Paciente actualizado exitosamente';
      } else {
        throw Exception('Error al actualizar el paciente: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkIfPatientExists(String email, String contactNumber) async {
    try {
      final patients = await getPatients();

      for (var patient in patients) {
        if (patient['email'] == email || patient['contact_number'] == contactNumber) {
          return true; // El paciente ya existe
        }
      }
      return false; // El paciente no existe
    } catch (e) {
      rethrow;
    }
  }

  Future<String> createPatient(Map<String, dynamic> patientData) async {
    final url = Uri.parse("$baseUrl/patients/patient");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(patientData),
      );

      // Verificamos el código de estado HTTP y el contenido de la respuesta
if (response.statusCode == 201 || response.statusCode == 200) {
  return 'Paciente creado exitosamente';
} else {
  throw Exception("Error al crear paciente: ${response.statusCode} - ${response.body}");
}

    } catch (e) {
      // Mejor manejo de errores, mostrando detalles
      throw Exception("Error al crear paciente: $e");
    }
  }
}
