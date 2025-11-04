 import 'package:dio/dio.dart';
import '../model/auth_response.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://89.116.236.10:8000/api'));

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
        return AuthResponse.fromMap(response.data['data']);
      }
    } catch (e) {
      print('Login error: $e');
    }
    return null;
  }
}