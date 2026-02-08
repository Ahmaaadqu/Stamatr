import 'package:flutter/material.dart';

void main() {
  runApp(const Stamatr());
}


class Stamatr extends StatelessWidget {
  const Stamatr({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
