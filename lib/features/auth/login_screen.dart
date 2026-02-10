import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width < 360 ? 16.0 : (width < 420 ? 24.0 : 32.0);
    return Scaffold(
      backgroundColor: Color(0XFF121212),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset('assets/images/logo.png'),
                // الصوره فيها Padding تلقائي
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF526EE0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                    child: const Text("Continue without an account"),
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1.5, color: Colors.white24),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFBDC1CA),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1.5, color: Colors.white24),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                SocialAuthButton(
                  label: 'Continue with Google',
                  assetPath: 'assets/images/Chrome.svg',
                  onTap: () {},
                ),
                SizedBox(height: 16),
                SocialAuthButton(label: "Continue with Facebook",
                    assetPath: 'assets/images/Group.svg', onTap: (){}),
                SizedBox(height: 12,),
                Text("You can use the app without creating an account." , style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.label,
    required this.assetPath,
    required this.onTap,
  });

  final String label;
  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(assetPath, width: 22, height: 22),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
