import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/ui/widgets/simple_tilt.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

typedef Lang = ({String image, String name, String symbol});

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);
    final space = SizedBox(height: isMobile ? 12.0 : 0.0);

    const langs = <Language>[
      Language(lang: (image: Images.letter_urdu, name: Texts.urdu, symbol: '#')),
      Language(lang: (image: Images.letter_tamil, name: Texts.tamil, symbol: '◊')),
      Language(lang: (image: Images.letter_english, name: Texts.english, symbol: '◊')),
      Language(lang: (image: Images.letter_hindi, name: Texts.hindi, symbol: '#')),
    ];

    return AppCard(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 700.0, minHeight: Utils.cardWidth(context)),
      child: Column(
        mainAxisSize: .min,
        mainAxisAlignment: .spaceBetween,
        children: [
          space,
          const Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                Texts.language_title,
                style: Styles.headlineMedium1,
                textAlign: .center,
              ),
            ),
          ),
          space,
          Wrap(spacing: isMobile ? 18.0 : 36.0, runSpacing: 18.0, children: langs),
          space,
          RichText(
            textAlign: .center,
            text: TextSpan(
              style: Styles.bodyMediumBold.copyWith(color: AppColors.primary, height: 1.8),
              children: const [
                TextSpan(text: '# '),
                TextSpan(text: Texts.speak, style: Styles.bodySmall),
                TextSpan(text: '  ◊ '),
                TextSpan(text: Texts.rws, style: Styles.bodySmall),
              ],
            ),
          ),
          space,
        ],
      ),
    );
  }
}

class Language extends StatelessWidget {
  const Language({super.key, required this.lang});

  final Lang lang;

  @override
  Widget build(BuildContext context) {
    return SimpleTilt(
      shadow: true,
      scale: true,
      child: Container(
        width: 106.0,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.secondary, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Text(lang.symbol, style: Styles.bodyMediumBold.copyWith(color: AppColors.primary)),
            const SizedBox(height: 12.0),
            SvgPicture.asset(
              lang.image,
              height: 28.0,
              colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
            const SizedBox(height: 20.0),
            Text(lang.name, style: Styles.bodyMedium),
          ],
        ),
      ),
    );
  }
}
