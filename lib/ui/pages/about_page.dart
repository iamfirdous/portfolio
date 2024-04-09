import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/ui/widgets/contact_card.dart';
import 'package:portfolio/ui/widgets/language_card.dart';
import 'package:portfolio/ui/widgets/map_card.dart';
import 'package:portfolio/ui/widgets/slide_in_grid.dart';
import 'package:portfolio/ui/widgets/summary_card.dart';
import 'package:portfolio/util/utils.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);

    Widget flex(Widget card1, Widget card2, int position) {
      return Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideInGrid(position: position == 1 ? 0 : 2, duration: position == 2 ? animationDuration : 600, child: card1),
          const SizedBox.square(dimension: 16.0),
          SlideInGrid(position: position == 1 ? 1 : 3, child: card2),
        ],
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: isMobile ? 24.0 : 48.0),
      child: AnimationLimiter(
        child: Column(
          children: [
            flex(const SummaryCard(), const ContactCard(), 1),
            const SizedBox(height: 16.0),
            flex(const MapCard(), const LanguageCard(), 2),
          ],
        ),
      ),
    );
  }
}