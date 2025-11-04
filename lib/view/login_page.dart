import 'package:example/view/attendance_view.dart';
import 'package:example/view/home_view.dart';
import 'package:example/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
class LogInPage extends StatefulWidget {
  LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  String imagePath = 'assets/images/smily_logo.png';
  @override
  void initState() {
    super.initState();

    emailFocus.addListener(() {
      setState(() {
        if (emailFocus.hasFocus) {
          imagePath = 'assets/images/down_logo.png';
        } else if (!passwordFocus.hasFocus) {
          imagePath = 'assets/images/smily_logo.png';
        }
      });
    });
    passwordFocus.addListener(() {
      setState(() {
        if (passwordFocus.hasFocus) {
          imagePath = 'assets/images/hidy_logo.png';
          print("Email focus: ${emailFocus.hasFocus}");
        } else if (!emailFocus.hasFocus) {
          print("Password focus: ${passwordFocus.hasFocus}");
          imagePath = 'assets/images/smily_logo.png';
        }
      });
    });
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        // Container
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5), // تحكم بالـ opacity
              BlendMode.srcOver, // كيف ينمزج اللون مع الصورة
            ),
          ),
          // DecorationImage
        ),
        // backgroundColor: const Color.fromARGB(251, 255, 255, 255),
        child: Column(
          children: [
            Image.asset(imagePath, height: 300, width: 300,fit: BoxFit.cover,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontFamily: 'NeoLatina',
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF3671AA), //
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                textInputType: TextInputType.emailAddress,
                hintText: 'E mail', focusNode: emailFocus),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: 'Password',
                focusNode: passwordFocus,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.offAll(AttendanceView());
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF3671AA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontFamily: 'NeoLatina',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 60,
                  // width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
