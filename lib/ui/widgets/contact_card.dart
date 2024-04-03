import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';
import 'package:timezone/browser.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = Utils.cardWidth(context);
    final itemWidth = (cardWidth - 16.0) / 2;
    final iconWidth = itemWidth - 86.0;

    Widget svg(String path) => Center(child: SvgPicture.asset(path, height: iconWidth));
    Widget card(String icon) => AppCard(width: itemWidth, height: itemWidth, child: svg(icon));

    final now = tz.TZDateTime.now(tz.getLocation('Asia/Kolkata'));
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final hours = hour < 10 ? '0$hour' : '$hour';
    final min = now.minute < 10 ? '0${now.minute}' : '${now.minute}';
    final a = now.hour >= 12 ? 'pm' : 'am';

    final mail = Uri.parse(Texts.mail);
    final linkedin = Uri.parse(Texts.linkedin);
    final github = Uri.parse(Texts.github);
    return SizedBox(
      width: cardWidth,
      height: cardWidth,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AppCard(
            width: itemWidth,
            height: itemWidth,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('RN it\'s', style: Styles.bodySmall),
                const SizedBox(height: 8.0),
                Text('$hours:$min\n$a', style: Styles.headlineMedium.copyWith(fontSize: 28.0, height: 1.0), textAlign: TextAlign.center),
                const SizedBox(height: 8.0),
                const Text('in India', style: Styles.bodySmall),
              ],
            ),
          ),
          GestureDetector(onTap: () => launchUrl(mail), child: card(Images.icon_gmail)),
          GestureDetector(onTap: () => launchUrl(linkedin), child: card(Images.icon_linkedin)),
          GestureDetector(onTap: () => launchUrl(github), child: card(Images.icon_github)),
        ],
      ),
    );
  }
}
