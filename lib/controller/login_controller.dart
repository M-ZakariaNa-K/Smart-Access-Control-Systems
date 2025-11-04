import '../services/api_service.dart';
import '../model/auth_response.dart';

class LoginController {
  final ApiService _api = ApiService();

  Future<AuthResponse?> login(String email, String password) async {
    final result = await _api.login(email, password);
    if (result != null) {
      print('Welcome ${result.firstName}');
      print('Token: ${result.token}');
      return result;
    } else {
      print('Login failed');
      return null;
    }
  }
}
