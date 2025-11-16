import 'dart:ui';
import '../helper/network_util.dart';
import '../models/monthly_attendance_model.dart';
import 'package:dio/dio.dart';

class MonthlyAttendanceService {
  static String? _token="37|9jTgk0LUwiLNnti8KEvrmpa0RauHG2V9D2M9DKeQf4eed65e";
  static final Dio _dio=Dio(BaseOptions(
    baseUrl: 'http://89.116.236.10:8000/api/',
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  ));
  static Future<MonthlyAttendanceModel?> fetchMonthlyTotal() async{
    try {
      print('DEBUG: Token in monthly service is: $_token ');
      print('Fetching monthly attendance total');
      final response = await _dio.get('monthlyAttendance',
      options:Options(
        headers: {
          'Content-Type': 'application/json; charset=ytf-8',
          'Accept': 'application/json',
          if(_token != null)'Authorization': 'Bearer $_token',
        },
      ),
    );
      print('Monthly total response received with status: ${response.statusCode} ');
      print('Monthly total response body: ${response.data} ');

      if( response.statusCode== 200){
        final data=response.data['data'];
        return MonthlyAttendanceModel.fromJson(data);
      }else{
        print('Failed to fetch monthly total: ${response.data['message']}');
        return null;
      }
    }on DioException catch(e){
      print('Dio Error fetching monthly total: ${e.message} ');
      print('Dio Error Response: ${e.response?.data} ');
      return null;
    } catch(e){
      print('Error in monthly attendance service: $e');
      return null;
    }
  }
}