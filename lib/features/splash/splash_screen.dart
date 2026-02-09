import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stamatr/features/auth/login_screen.dart';
import 'package:stamatr/features/onboarding/onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _goToBoarding();
  }
  Future<void> _goToBoarding()async{
    final prefs =await SharedPreferences.getInstance();
    final isSeen = prefs.getBool("seen_onboarding" ) ?? false ;
    await Future.delayed(const Duration(seconds: 2));
    if(!mounted) return;
    if (isSeen == true){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const LoginScreen()));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const OnboardingScreen()));

    }
  }

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(
                  "Your exam papers, simplified.",
                  style: TextStyle(color: Color(0xFFBDC1CA), fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
