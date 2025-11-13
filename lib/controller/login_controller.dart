import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../model/auth_response.dart';

class LoginController {
  RxBool isLoading = false.obs;
  final ApiService _api = ApiService();

  Future<AuthResponse?> login(String email, String password) async {
    isLoading.value = true;
    try {
      final result = await _api.login(email, password);
      if (result != null) {
        print('Welcome ${result.firstName}');
        print('Token: ${result.token}');

        // حفظ التوكن في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', result.token ?? '');

        return result;
      } else {
        print('Login failed');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
