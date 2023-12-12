import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClientLogin {
  final String baseUrl;

  ApiClientLogin(this.baseUrl);

  Future<Map<String, dynamic>> login(String username, String password) async {
    final Uri loginUri = Uri.parse('$baseUrl/api/auth');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'login': username,
      'senha': password,
    };

    final http.Response response = await http.post(
      loginUri,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String token = responseData['token'];

      return responseData;
    } else {
      throw Exception('Falha no login');
    }
  }
}
