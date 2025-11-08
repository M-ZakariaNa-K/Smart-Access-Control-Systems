import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String id;
  final String cardCode;
  final String gender; // "male" أو "female"

  const ProfilePage({
    super.key,
    required this.name,
    required this.id,
    required this.cardCode,
    required this.gender,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = widget.gender == "female"
        ? 'assets/images/female_logo.png'
        : 'assets/images/male_logo.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // هون السحر
      appBar: AppBar(
        backgroundColor: Colors.transparent, // حتى ما يغطي الباترن
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

      body: Container(
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
            const SizedBox(height: 120), // رفع المحتوى شوي لتحت الاب بار
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF3671AA), width: 2),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/girly.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoText("Name", widget.name),
                  const SizedBox(height: 15),
                  _buildInfoText("ID", widget.id),
                  const SizedBox(height: 15),
                  _buildInfoText("Card Code", widget.cardCode),
                ],
              ),
            ),
          ],
        ),
      ),
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
