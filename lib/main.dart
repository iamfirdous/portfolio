import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home_page.dart';
import 'package:portfolio/util/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firdous',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        fontFamily: Fonts.fira,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      home: const HomePage(),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(start: 0.0, end: 800.0, name: MOBILE),
            Breakpoint(start: 801.0, end: double.infinity, name: DESKTOP),
          ],
        );
      },
    );
  }
}
