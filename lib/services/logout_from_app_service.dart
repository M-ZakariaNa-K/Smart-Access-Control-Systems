import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/network_util.dart';

class LogoutFromAppService {
  static String? _token = "";

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: '${$.URL}/',
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  ));

  static Future<bool> LogoutFromApp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');

      print('Loggin out from the app');
      final response = await _dio.post(
        'logoutFromApp',
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'Accept': 'application/json',
            if (_token != null) 'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('token'); // حذف التوكن
        Get.offAllNamed('/login'); // رجوع لصفحة تسجيل الدخول
        print('Logout successful');
        return true;
      } else {
        print(' failed to logout from app: ${response.data?['message']}');
        return false;
      }
    } on DioException catch (e) {
      print('Dio Error logging out from app: ${e.message}');
      print('Dio Error Response: ${e.response?.data} ');
      return false;
    } catch (e) {
      print('Error logging out from app: $e');
      return false;
    }
  }
}
