import 'package:dio/dio.dart';

import '../helper/network_util.dart';
class LogoutFromAppService {
  static String? _token="37|9jTgk0LUwiLNnti8KEvrmpa0RauHG2V9D2M9DKeQf4eed65e";

  static final Dio _dio=Dio(BaseOptions(
    baseUrl: 'http://89.116.236.10:8000/api/',
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  ));

  static Future<bool> LogoutFromApp() async{
    try{
      print('Loggin out from the app');
      final response= await _dio.post('logoutFromApp',
      options: Options(
          headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json',
          if(_token !=null)'Authorization': 'Bearer $_token',
        },
      ),
    );
      print('Logout from app response received with status: ${response.statusCode} ');
      print('Logout from app response body: ${response.data}');
      if(response.statusCode == 200 ){
        print('Logout successful');
        return true;
      }else{
        print(' failed to logout from app: ${response.data?['message']}');
        return false;
      }
    }on DioException catch(e){
      print('Dio Error logging out from app: ${e.message}');
      print('Dio Error Response: ${e.response?.data} ');
      return false;
    }
    catch(e){
      print('Error logging out from app: $e');
       return false;
    }
  }
}
