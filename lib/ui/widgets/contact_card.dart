import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/ui/widgets/slide_in_grid.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';
import 'package:timezone/browser.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

const animationDuration = 900;

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = Utils.cardWidth(context);
    final itemWidth = (cardWidth - 16.0) / 2;

    final now = tz.TZDateTime.now(tz.getLocation('Asia/Kolkata'));
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final hours = hour < 10 ? '0$hour' : '$hour';
    final min = now.minute < 10 ? '0${now.minute}' : '${now.minute}';
    final a = now.hour >= 12 ? 'pm' : 'am';

    return SizedBox(
      width: cardWidth,
      height: cardWidth,
      child: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SlideInGrid(
              position: 0,
              duration: animationDuration,
              child: AppCard(
                width: itemWidth,
                height: itemWidth,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('RN it\'s', style: Styles.bodySmall),
                    const SizedBox(height: 8.0),
                    Text(
                      '$hours:$min\n$a',
                      style: Styles.headlineMedium.copyWith(fontSize: 28.0, height: 1.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    const Text('in India', style: Styles.bodySmall),
                  ],
                ),
              ),
            ),
            ...List.generate(3, (i) => SubCard(i + 1)),
          ],
        ),
      ),
    );
  }
}

class SubCard extends StatelessWidget {
  SubCard(this.position, {super.key});

  final int position;
  final cardData = {
    1: (uri: Uri.parse(Texts.mail), icon: Images.icon_gmail),
    2: (uri: Uri.parse(Texts.linkedin), icon: Images.icon_linkedin),
    3: (uri: Uri.parse(Texts.github), icon: Images.icon_github),
  };

  @override
  Widget build(BuildContext context) {
    final cardWidth = Utils.cardWidth(context);
    final itemWidth = (cardWidth - 16.0) / 2;
    final iconWidth = itemWidth - 86.0;

    final uri = cardData[position]!.uri;
    final icon = cardData[position]!.icon;
    return SlideInGrid(
      position: position,
      duration: animationDuration,
      child: InkWell(
        onTap: () => launchUrl(uri),
        borderRadius: BorderRadius.circular(32.0),
        child: AppCard(
          width: itemWidth,
          height: itemWidth,
          child: Center(child: SvgPicture.asset(icon, height: iconWidth)),
        ),
      ),
    );
  }
}
