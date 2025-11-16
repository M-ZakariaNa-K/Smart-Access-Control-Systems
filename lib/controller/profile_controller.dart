import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/profile_model.dart';
import '../services/profile_service.dart';

class ProfileController extends GetxController {
  final ProfileService _service = ProfileService();

  var isLoading = false.obs;
  var profile = Rxn<ProfileModel>();

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        print("No token found — user might be logged out.");
        return;
      }

      final result = await _service.getProfile(token);
      if (result != null) {
        profile.value = result;
      } else {
        print("No profile data returned from API.");
      }
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    profile.value = null;
  }
}
