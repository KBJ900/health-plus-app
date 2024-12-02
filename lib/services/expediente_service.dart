import 'dart:convert';
import 'package:http/http.dart' as http;

class ExpedienteService {
  // Ruta base para las solicitudes
  final String baseUrl = 'https://health-back-lingering-wave-8458.fly.dev/api/paymentLetters';

  // Método para obtener todos los expedientes médicos
  Future<List<dynamic>> obtenerExpedientes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, parseamos el cuerpo JSON
      return json.decode(response.body);
    } else {
      // Si hay un error, lanzamos una excepción
      throw Exception('Error al cargar los expedientes');
    }
  }

  // Método para crear un expediente médico
  Future<Map<String, dynamic>> crearExpediente({
    required String letterNumber,
    required int doctorId,
    required int insuranceId,
    required int patientId,
    required String serviceDate,
    required String status,
    required String urlFile, // Ruta o archivo a enviar
  }) async {
    // Preparamos los datos a enviar
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/invoice'),
    );

    // Añadimos los campos al formulario
    request.fields['letter_number'] = letterNumber;
    request.fields['doctor_id'] = doctorId.toString();
    request.fields['insurance_id'] = insuranceId.toString();
    request.fields['patient_id'] = patientId.toString();
    request.fields['service_date'] = serviceDate;
    request.fields['status'] = status;

    // Aquí puedes adjuntar el archivo
    request.files.add(await http.MultipartFile.fromPath(
      'urlFile', // Nombre del campo en el backend
      urlFile,   // Ruta del archivo local
    ));

    // Realizamos la solicitud POST
    final response = await request.send();

    // Verificamos el estado de la respuesta
    if (response.statusCode == 200) {
      // Si la creación fue exitosa, parseamos la respuesta
      final respStr = await response.stream.bytesToString();
      return json.decode(respStr);
    } else {
      throw Exception('Error al crear el expediente');
    }
  }
}
