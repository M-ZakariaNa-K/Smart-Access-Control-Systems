import 'package:example/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/view/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

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
            Text(
                'Attendance',
                style: TextStyle(
                    color: Color(0xFF3671AA),
                    fontFamily: 'NeoLatina',
                    fontWeight: FontWeight.bold
                )
            ),
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
                  title: Text('Confirmation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3671AA),
                    ),
                  ),
                  content: Text('Are you sure you want to logout from club?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 143, 176, 206),
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Cancel',
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
  onPressed: () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // حذف التوكن
    Get.offAllNamed('/login'); // رجوع لصفحة تسجيل الدخول
  },


                   style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3671AA) ,
                    foregroundColor: Colors.white, 
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
          else if (value == 'app') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9), 
                    ),
                  title: Text('Confirmation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3671AA),
                    ),
                  ),
                  content: Text('Are you sure you want to logout from app?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 143, 176, 206),
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Cancel',
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
                        Get.offAll(LogInPage());
                   }, 
                   style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3671AA) ,
                    foregroundColor: Colors.white, 
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
      body:Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.srcOver)
        ),
        ),
        child: SafeArea(
        child:
        SingleChildScrollView(
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
               child: Image(
               image: AssetImage('assets/images/att.jpg'),
             ),
                    ),
            Text(
                'Attendance Summary',
              style: TextStyle(
                  color: Color(0xFF3671AA),
                  fontSize: 20,
                  fontFamily: 'NeoLatina',
                  fontWeight: FontWeight.bold,
                  height: 2,
              ),
            ),
            Text('Total hours this month: 160\n Last check-in: 9:00 AM, Last Check-out: 5:00 PM',
           style: TextStyle(
             color: Colors.grey[400],
             fontSize: 15,
             height: 1.5,
           ),
            ),
           Padding(padding: EdgeInsets.only(top: 40),
           child:Text(
             'History',
             style: TextStyle(
               color: Color(0xFF3671AA),
               fontSize: 20,
               fontFamily: 'NeoLatina',
               fontWeight: FontWeight.bold,
             ),
           ),
           ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              leading:   Container(
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
                          'July 26 ,2024',
                        style: TextStyle(
                            fontSize: 14,
                        color: Color(0xFF3671AA),
                        ),
                      ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    ),
                ),
              ),
            ),
            Card(    
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
               contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                leading:   Container(
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
                  'July 25 ,2024',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3671AA),
                  ),
                ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(color: Colors.grey[500],
                  fontSize: 11,
                  ),
                ),
              ),
            ),
            Card( 
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                leading:   Container(
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
                  'July 24 ,2024',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3671AA),
                  ),
                ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(color: Colors.grey[500],
                  fontSize: 11,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              leading:   Container(
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
                          'July 30 ,2024',
                        style: TextStyle(
                            fontSize: 14,
                        color: Color(0xFF3671AA),
                        ),
                      ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    ),
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              leading:   Container(
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
                          'Feb 25 ,2024',
                        style: TextStyle(
                            fontSize: 14,
                        color: Color(0xFF3671AA),
                        ),
                      ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    ),
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              leading:   Container(
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
                          'Feb 25 ,2024',
                        style: TextStyle(
                            fontSize: 14,
                        color: Color(0xFF3671AA),
                        ),
                      ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    ),
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              leading:   Container(
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
                          'Feb 25 ,2024',
                        style: TextStyle(
                            fontSize: 14,
                        color: Color(0xFF3671AA),
                        ),
                      ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    ),
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              leading:   Container(
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
                          'Feb 25 ,2024',
                        style: TextStyle(
                            fontSize: 14,
                        color: Color(0xFF3671AA),
                        ),
                      ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    ),
                ),
              ),
            ),
          ],
        ) ,
        ) 
        ),
      ),
    );
  }
}
