import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stamatr/features/homeScreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;
  String? loadingProvider;
  Future<void> _handleLogin(String provider) async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
      loadingProvider = provider;
    });
    try {
      await Future.delayed(Duration(seconds: 2));
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (c) {
      // TODO :SnackBar
    } finally {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        loadingProvider = null;
      });
    }
  }

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
                Opacity(
                  opacity: (isLoading && loadingProvider != "anonymous")
                      ? 0.5
                      : 1.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: (isLoading && loadingProvider != "anonymous")
                          ? null
                          : () => _handleLogin("anonymous"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF526EE0),
                        disabledBackgroundColor: const Color(0xFF526EE0),
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),

                      child: (isLoading && loadingProvider == "anonymous")
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,

                                strokeWidth: 2,
                              ),
                            )
                          : const Text("Continue without an account"),
                    ),
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
                  isLoading: isLoading && loadingProvider == 'google',
                  isDisabled: isLoading && loadingProvider!= 'google',
                  label: 'Continue with Google',
                  assetPath: 'assets/images/Chrome.svg',
                  onTap: () {

                    _handleLogin('google');

                  },
                ),
                SizedBox(height: 16),
                SocialAuthButton(
                  isLoading: isLoading && loadingProvider == 'facebook',
                  isDisabled: isLoading && loadingProvider!= 'facebook',
                  label: "Continue with Facebook",
                  assetPath: 'assets/images/Group.svg',
                  onTap: () {
                    _handleLogin('facebook');
                  },

                ),
                SizedBox(height: 12),
                Text(
                  "You can use the app without creating an account.",
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                ),
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
    required this.isLoading,
    required this.isDisabled,
  });
  final isLoading;
  final isDisabled;
  final String label;
  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1,
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton(
          onPressed: isDisabled ? null : onTap,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: isLoading ? const SizedBox(
            height:20 ,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ) :

          Row(
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
      ),
    );
  }
}
