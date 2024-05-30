import 'package:advans_app/services/authentification/authentificationService.dart';

class AuthenticationRepository {
  final AuthenticationService authService;

  AuthenticationRepository({required this.authService});

  Future<String?> login(String username, String password) async {
    try {
      // Call the login method of the authentication service
      return await authService.login(username, password);
    } catch (e) {
      // Handle any errors and return null if login fails
      print('Login failed: $e');
      return null;
    }
  }

  Future<void> logout(String token) async {
    try {
      // Call the logout method of the authentication service
      await authService.logout(token);
    } catch (e) {
      // Handle any errors
      print('Logout failed: $e');
    }
  }
}
