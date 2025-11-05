import 'package:example/alert.dart';
import 'package:get/get.dart';
import '../models/monthly_attendance_model.dart';
import '../models/attendance_records_model.dart';
import '../services/monthly_attendance_service.dart';
import '../services/attendance_records_service.dart';
import '../services/logout_from_app_service.dart';
import '../services/logout_from_club_service.dart';
import '../view/login_page.dart';


class AttendanceController extends GetxController {
  var isLoading = false.obs;
  var attendanceData = Rxn<AttendanceData>();
  var monthlyData = Rxn<MonthlyAttendanceModel>();

  @override
  void onInit() {
    fetchAttendance();
    super.onInit();
  }

  Future<void> fetchAttendance() async {
    try {
      isLoading.value = true;
      final result = await Future.wait([
        AttendanceRecordsService.fetchAttendanceRecords(),
        MonthlyAttendanceService.fetchMonthlyTotal(),
      ]);
      attendanceData.value = result[0] as AttendanceData?;
      monthlyData.value = result[1] as MonthlyAttendanceModel?;
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logoutFromApp() async {
    final success = await LogoutFromAppService.LogoutFromApp();
    if (success) {
      Get.offAll(() => LogInPage());
    } else {
      print('Failed to logout from app.');
      Get.snackbar('Error', 'Failed to logout from app.');
    }
  }

  Future<void> logoutFromClub() async {
    final status = await LogoutOutFromClubService.LogoutFromClub();
    switch (status) {
      case LogoutStatus.success:
        print('Successfully logged out from club.');
        Get.snackbar('Success', 'Logged out from club successfully.');
        break;
      case LogoutStatus.alreadyLoggedOut:
        print('User was already logged out from club.');
        Get.snackbar('Info', 'You are already logged out of the club.');
        break;
      case LogoutStatus.failure:
        print('Failed to logout from club.');
        Get.snackbar('Error', 'Failed to log out from the club.');
        break;
    }
  }
}