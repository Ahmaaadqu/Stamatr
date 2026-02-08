import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
