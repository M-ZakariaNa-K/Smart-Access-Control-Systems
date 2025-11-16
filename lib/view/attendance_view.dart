import 'package:example/controller/attendance_controller.dart';
import 'package:example/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:example/view/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceView extends StatelessWidget {
  AttendanceView({super.key});
  final AttendanceController controller = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage('assets/images/LogoRobotic.png'),
              height: 60,
              width: 60,
            ),
            Text('Attendance',
                style: TextStyle(
                    color: Color(0xFF3671AA),
                    fontFamily: 'NeoLatina',
                    fontWeight: FontWeight.bold)),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ProfilePage());
                  },
                  child: Icon(
                    Icons.person,
                    color: Color(0XFF4382bb),
                  ),
                ),
                PopupMenuButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Color(0XFF4382bb),
                  ),
                  onSelected: (value) {
                    if (value == 'club') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            title: Text(
                              'Confirmation',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3671AA),
                              ),
                            ),
                            content: Text(
                              'Are you sure you want to logout from club?',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 143, 176, 206),
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF3671AA),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  controller.logoutFromClub();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF3671AA),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'confirm',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else if (value == 'app') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            title: Text(
                              'Confirmation',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3671AA),
                              ),
                            ),
                            content: Text(
                              'Are you sure you want to logout from app?',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 143, 176, 206),
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF3671AA),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  controller.logoutFromApp();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF3671AA),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'confirm',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'app',
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Color(0XFF4382bb),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Logout from App',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF3671AA),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'club',
                      child: Row(
                        children: [
                          Icon(
                            Icons.meeting_room,
                            color: Color(0XFF4382bb),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Logout from Club',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF3671AA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7), BlendMode.srcOver),
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            final data = controller.attendanceData.value;
            if (data == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No attendance data',
                      style: TextStyle(
                        color: Color(0xFF3671AA),
                        fontSize: 20,
                        fontFamily: 'NeoLatina',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        controller.fetchAttendance();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 70, 134, 193),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage('assets/images/att.jpg'),
                    ),
                  ),
                  Obx(() {
                    final monthly = controller.monthlyData.value;
                    if (monthly != null) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        elevation: 0,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attendance Summary',
                                style: TextStyle(
                                  color: Color(0xFF3671AA),
                                  fontSize: 20,
                                  fontFamily: 'NeoLatina',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                monthly.month,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 16),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.schedule,
                                    color: Color(0xFF3671AA),
                                    size: 20,
                                  ),
                                ),
                                title: Text(
                                  'Total Hours',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF3671AA),
                                  ),
                                ),
                                trailing: Text(
                                  '${monthly.totalHours}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3671AA),
                                  ),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.login,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                ),
                                title: Text(
                                  'Last Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF3671AA),
                                  ),
                                ),
                                subtitle: monthly.lastLogin != null
                                    ? Text(
                                        '${monthly.lastLogin!.loginDate} at ${monthly.lastLogin!.loginTime}',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    : Text('No login recorded.'),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                title: Text(
                                  'Last Logout',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF3671AA),
                                  ),
                                ),
                                subtitle: monthly.lastLogout != null
                                    ? Text(
                                        '${monthly.lastLogout!.logoutDate} at ${monthly.lastLogout!.logoutTime}',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    : Text('No logout recorded.'),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'History',
                      style: TextStyle(
                        color: Color(0xFF3671AA),
                        fontSize: 20,
                        fontFamily: 'NeoLatina',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // ✅ تعديل الأقواس هنا فقط
                  RefreshIndicator(
                    onRefresh: () async {
                      await controller.fetchAttendance();
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.entryRecord.length,
                      itemBuilder: (context, index) {
                        final record = data.entryRecord[index];
                        return Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 0.0),
                            leading: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.date_range,
                                color: Color(0XFF4382bb),
                              ),
                            ),
                            title: Text(
                              record.loginDate,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0XFF4382bb),
                              ),
                            ),
                            subtitle: Text(
                              "Checked in: ${record.loginTime}",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 11,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ), // ✅ هون كانت المشكلة بالإغلاق
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
