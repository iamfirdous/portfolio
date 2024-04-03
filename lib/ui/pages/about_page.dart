import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/contact_card.dart';
import 'package:portfolio/ui/widgets/language_card.dart';
import 'package:portfolio/ui/widgets/map_card.dart';
import 'package:portfolio/ui/widgets/summary_card.dart';
import 'package:portfolio/util/utils.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);

    Widget flex(Widget card1, Widget card2) {
      return Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          card1,
          const SizedBox.square(dimension: 16.0),
          card2,
        ],
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: isMobile ? 24.0 : 48.0),
      child: Column(
        children: [
          flex(const SummaryCard(), const MapCard()),
          const SizedBox(height: 16.0),
          flex(const ContactCard(), const LanguageCard()),
        ],
      ),
    );
  }
}