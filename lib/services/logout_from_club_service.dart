import 'package:dio/dio.dart';

enum LogoutStatus { success, alreadyLoggedOut, failure }
class LogoutOutFromClubService{
  static String? _token="37|9jTgk0LUwiLNnti8KEvrmpa0RauHG2V9D2M9DKeQf4eed65e";
  static final Dio _dio= Dio(BaseOptions(
    baseUrl: 'http://89.116.236.10:8000/api/',
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  ));
  static Future<LogoutStatus> LogoutFromClub() async{
    try{
      print('Logging out from the club');
      final response=await _dio.post('logoutFromClub',
      options: Options(
        headers: { 'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json',
          if (_token != null) 'Authorization': 'Bearer $_token',
        },
        validateStatus: (status) => true,
      ),
      );
      print('Logout from club response received with status: ${response.statusCode}');
      print('Logout from club response body: ${response.data}');
      if (response.statusCode == 200 ) {
          return LogoutStatus.success;
      }
        else if (response.statusCode == 404 ) {
          return LogoutStatus.alreadyLoggedOut;
        }
        else{
      return LogoutStatus.failure;
      }

    }on DioException catch(e){
      print('Dio Error logging out from club: ${e.message}');
      print('Dio Error Response: ${e.response?.data}');
      return LogoutStatus.failure;
    }
    catch(e){
      print('Error logging out from club: $e');
      return LogoutStatus.failure;
    }
  }
}