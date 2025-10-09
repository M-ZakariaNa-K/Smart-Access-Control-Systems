import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendenceView extends StatelessWidget {
  const AttendenceView({super.key});

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
                'Attendence',
                style: TextStyle(
                    color: Color(0xFF3671AA),
                    // fontSize: 33,
                    fontFamily: 'NeoLatina',
                    fontWeight: FontWeight.bold
                )
            ),
           Row(
            children: [
               Icon(
              Icons.person,
              // size: 30,
              color: Color(0XFF4382bb),
            ),
      PopupMenuButton(
        icon: Icon(
          Icons.exit_to_app,
          // size: 30,
          color: Color(0XFF4382bb),
        ),
        onSelected: (value) {
          if (value == 'club') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Confirmation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3671AA),
                    ),
                  ),
                  content: Text('Are you sure you want to logout from club?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF3671AA),
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
                    TextButton(
                      child: Text('Confirm',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3671AA),
                        ),
                      ),
                      onPressed: () {},
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
                  title: Text('Confirmation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3671AA),
                    ),
                  ),
                  content: Text('Are you sure you want to logout from app?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF3671AA),
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
                    TextButton(
                      child: Text('Confirm',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3671AA),
                        ),
                      ),
                      onPressed: ()
                      // العودة لصفجة تسجيل الدخول
                      {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
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
                  size: 25,
                  color: Color(0XFF4382bb),
                ),
                SizedBox(width: 8),
                Text(
                  'Logout from App',
                  style: TextStyle(
                    fontSize: 15,
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
                  size: 25,
                  color: Color(0XFF4382bb),
                ),
                SizedBox(width: 8),
                Text(
                  'Logout from Club',
                  style: TextStyle(
                    fontSize: 15,
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
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.srcOver)
        ),
        ),
        child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
               child: Image(
               image: AssetImage('assets/images/att.jpg'),
             ),
                    ),
            Text(
                'Attendence Summary',
              style: TextStyle(
                  color: Color(0xFF3671AA),
                  fontSize: 27,
                  fontFamily: 'NeoLatina',
                  fontWeight: FontWeight.bold,
                  height: 2,
              ),
            ),
            Text('Total hours this month: 160\n Last check-in: 9:00 AM, Last Check-out: 5:00 PM',
           style: TextStyle(
             color: Colors.grey[400],
             fontSize: 20,
             height: 1.5,
           ),
            ),
           Padding(padding: EdgeInsets.only(top: 60),
           child:Text(
             'History',
             style: TextStyle(
               color: Color(0xFF3671AA),
               fontSize: 30,
               fontFamily: 'NeoLatina',
               fontWeight: FontWeight.bold,

             ),
           ),
           ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: ListTile(
              leading:   Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                        Icons.date_range,
                        size: 40,
                        color: Color(0XFF4382bb),
                      ),
                      ),
                title: Text(
                          'July 26 ,2024',
                        style: TextStyle(
                            fontSize: 20,
                        color: Color(0xFF3671AA),
                        ),
                      ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: ListTile(
                leading:   Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.date_range,
                    size: 40,
                    color: Color(0XFF4382bb),
                  ),
                ),
                title: Text(
                  'July 25 ,2024',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3671AA),
                  ),
                ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: ListTile(
                leading:   Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.date_range,
                    size: 40,
                    color: Color(0XFF4382bb),
                  ),
                ),
                title: Text(
                  'July 24 ,2024',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3671AA),
                  ),
                ),
                subtitle: Text(
                  "Checked in: 9:00 AM",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
