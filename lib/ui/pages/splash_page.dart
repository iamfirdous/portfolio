import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home_page.dart';
import 'package:portfolio/util/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(context, HomePage.route()),
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Image(height: 300.0, image: AssetImage(Images.logo)),
      ),
    );
  }
}