import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/attendance_records_model.dart';
import '../helper/network_util.dart';
import 'package:dio/dio.dart';

class AttendanceRecordsService {
  static String? _token = "";

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: '${$.URL}/',
  ));
  static Future<AttendanceData?> fetchAttendanceRecords() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');

      print('Fetching attendance records');
      final response = await _dio.get('attendance_records',
          options: Options(
            headers: {
              'Content-Type': 'application/json; charset=utf-8',
              'Accept': 'application/json',
              if (_token != null) 'Authorization': 'Bearer $_token',
            },
                  validateStatus: (v) {
              return v != null && v >= 200 && v <= 420;
            }
          ));

      print("response received with status:${response.statusCode}");
      print('Response body:${response.data}');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return AttendanceData.fromJson(data);
      }
      else if (response.statusCode == 401 && _token != null) {
        await prefs.remove('token');
        
        Get.offAllNamed('/login'); 
                        Get.snackbar('Hi', 'Your session has been expired');
        return null;
      } 
       else {
        print(' Server error: ${response.data['message']}');
        return null;
      }
    } on DioException catch (e) {
      print('Dio error:${e.message}');
      print('Dio error response:${e.response?.data}');
      return null;
    } catch (e) {
      print('Error fetching attendance records: $e');
      return null;
    }
  }
}
