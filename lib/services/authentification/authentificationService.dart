import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationService {
  final String apiUrl = 'https://example.com/api/auth';

  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // If login is successful, return the authentication token
      final responseBody = jsonDecode(response.body);
      return responseBody['token'];
    } else {
      // If login fails, throw an exception or return null
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<void> logout(String token) async {
    final response = await http.post(
      Uri.parse('$apiUrl/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout: ${response.body}');
    }
  }
}
