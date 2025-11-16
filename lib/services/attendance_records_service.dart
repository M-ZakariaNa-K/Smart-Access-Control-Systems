import '../models/attendance_records_model.dart';
import '../helper/network_util.dart';
import 'package:dio/dio.dart';


class AttendanceRecordsService {
  static String? _token="37|9jTgk0LUwiLNnti8KEvrmpa0RauHG2V9D2M9DKeQf4eed65e";

  static final Dio _dio= Dio(BaseOptions(
    baseUrl: 'http://89.116.236.10:8000/api/',
  ));
  static Future<AttendanceData?> fetchAttendanceRecords() async{
    try{
      print('Fetching attendance records');
      final response = await _dio.get('attendance_records',
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json',
          if(_token!=null)'Authorization': 'Bearer $_token',
        },
      ));
      
      print("response received with status:${response.statusCode}");
      print('Response body:${response.data}');
      if(response.statusCode==200){
         final data =response.data['data'];
         return AttendanceData.fromJson(data);
      } else{
        print(' Server error: ${response.data['message']}');
        return null;
      }
    }on DioException catch(e){
      print('Dio error:${e.message}');
      print('Dio error response:${e.response?.data}');
      return null;
    }catch (e){
      print('Error fetching attendance records: $e');
      return null;
    }
  }
}