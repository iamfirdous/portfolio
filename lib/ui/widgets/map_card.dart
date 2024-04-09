import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = Utils.cardWidth(context);

    return InkWell(
      onTap: () => launchUrl(Uri.parse(Texts.chennai)),
      borderRadius: BorderRadius.circular(32.0),
      child: AppCard(
        width: cardWidth,
        height: cardWidth,
        padding: EdgeInsets.zero,
        bgImage: Images.map_placeholder,
        child: const Center(child: Image(height: 100.0, image: AssetImage(Images.map_marker))),
      ),
    );
  }
}
