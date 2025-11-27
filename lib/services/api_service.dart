import 'package:dio/dio.dart';
import 'package:example/helper/network_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/auth_response.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl:$.URL));

  Future<AuthResponse?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['data']['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        return AuthResponse.fromMap(response.data['data']);
      }
    } catch (e) {
      print('Login error: $e');
    }
    return null;
  }
}
