import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'http://192.168.1.107:31009';
  final String token;

  ApiClient({
    required this.token,
  });

  Future<dynamic> getData(String path) async {
    final Uri uri = Uri.parse('$baseUrl$path');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final http.Response response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception('Falha ao obter dados: ${response.statusCode}');
    }
  }
}
