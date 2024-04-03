import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/about_page.dart';
import 'package:portfolio/ui/pages/work_page.dart';
import 'package:portfolio/ui/widgets/tab_select.dart';
import 'package:portfolio/util/constants.dart';

import 'timeline_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'home';
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabSelect(
          tabHeads: const [Texts.timeline, Texts.about, Texts.work],
          tabViews: const [TimelinePage(), AboutPage(), WorkPage()],
        ),
      ),
    );
  }
}