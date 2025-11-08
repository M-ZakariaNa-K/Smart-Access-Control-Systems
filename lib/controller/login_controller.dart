import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../services/api_service.dart';
import '../model/auth_response.dart';

class LoginController {
  RxBool isLoading = false.obs;
  final ApiService _api = ApiService();

  Future<AuthResponse?> login(String email, String password) async {
    isLoading.value = true;
    try{
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
  catch(e){

  }
  finally{
    isLoading.value = false;
  }
  }
}
