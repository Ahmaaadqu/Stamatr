import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stamatr/features/auth/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final horizontalPadding = widthSize < 360
        ? 16.0
        : (widthSize < 420 ? 24.0 : 32.0);
    return Scaffold(
      backgroundColor: Color(0XFF121212),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: 24),
                // Image.asset('assets/images/logo.png'),
                Image.asset('assets/images/onboarding.png'),
                Text(
                  'Your University Exam Archive',
                  style: TextStyle(
                    color: Color(0xFFBDC1CA),
                    fontSize: 19.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Seamlessly access, upload, and\n'
                  'manage past exam papers to\n'
                  'elevate your academic success.',
                  style: TextStyle(color: Color(0xFFBDC1CA)),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("seen_onboarding", true);
                    if (!context.mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF526EE0),
                    foregroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(6),
                    ),
                  ),
                  child: const Text("Get Started"),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
