import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:example/view/login_page.dart';
import 'package:example/view/attendance_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  // تحديد الصفحة الأولى حسب وجود التوكن
  final initialRoute = (token == null || token.isEmpty)
      ? '/login'
      : '/attendance';

  runApp(MyApp(initialRoute: initialRoute));
}
class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: '/login', page: () =>  LogInPage()),
        GetPage(name: '/attendance', page: () =>  AttendanceView()),
      ],
    );
  }
}
