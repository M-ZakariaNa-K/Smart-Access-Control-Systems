import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    controller.fetchProfile();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'NeoLatina',
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Color(0xFF3671AA),
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF3671AA)),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final profile = controller.profile.value;
        if (profile == null) {
          return const Center(child: Text("ما في بيانات"));
        }

        
        final imagePath = profile.gender == "female"
            ? "assets/images/girly.png"
            : "assets/images/male.jpg";

        // تحديد الإطار حسب الحالة
        final isExit = profile.status?.toLowerCase() == "exit";

        final borderDecoration = isExit
            ? BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 3),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(
                shape: BoxShape.circle,
                gradient: const SweepGradient(
                  colors: [
                    Color(0xFF00FF85),
                    Color(0xFF00B56E),
                    Color(0xFF00FF85),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              );

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 120),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: borderDecoration,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoText("Full Name", profile.fullName ?? "-"),
                    const SizedBox(height: 15),
                    _buildInfoText("Card Code", profile.cardCode ?? "-"),
                    const SizedBox(height: 15),
                    _buildInfoText("Status", profile.status ?? "-"),
                    const SizedBox(height: 15),
                    _buildInfoText("Year", profile.year ?? "-"),
                    const SizedBox(height: 15),
                    _buildInfoText(
                        "Specialization",
                        (profile.specialization == null ||
                                profile.specialization!.isEmpty)
                            ? "-"
                            : profile.specialization),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'NeoLatina',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF3671AA),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color.fromARGB(255, 46, 46, 46),
          ),
        ),
      ],
    );
  }
}
