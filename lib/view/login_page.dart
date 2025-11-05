import 'package:example/controller/login_controller.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginController = LoginController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  String imagePath = 'assets/images/smily_logo.png';

  final _formKey = GlobalKey<FormState>();

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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  imagePath,
                  height: 300,
                  width: 300,
                ),
              ),
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
                      color: Color(0xFF3671AA),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'E mail',
                  focusNode: emailFocus,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Email';
                    }
                    bool emailValid =
                        RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value);
                    if (!emailValid) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  focusNode: passwordFocus,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final authResponse = await loginController.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (authResponse != null) {
                        Get.offAll(AttendanceView());
                        Get.snackbar(
                          'Success',
                          'Welcome ${authResponse.firstName}',
                          backgroundColor: Colors.green.shade400,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please fill all fields correctly',
                        backgroundColor: Colors.red.shade400,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 60,
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
