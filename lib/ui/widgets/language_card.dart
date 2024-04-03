import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);
    final space = SizedBox(height: isMobile ? 12.0 : 0.0);

    return AppCard(
      constraints: BoxConstraints(maxWidth: 700.0, minHeight: Utils.cardWidth(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          space,
          const Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                Texts.language_title,
                style: Styles.headlineMedium1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          space,
          Wrap(
            spacing: isMobile ? 18.0 : 36.0,
            runSpacing: 18.0,
            children: const [
              Language(image: Images.letter_urdu, name: Texts.urdu, symbol: '#'),
              Language(image: Images.letter_tamil, name: Texts.tamil, symbol: '◊'),
              Language(image: Images.letter_english, name: Texts.english, symbol: '◊'),
              Language(image: Images.letter_hindi, name: Texts.hindi, symbol: '#'),
            ],
          ),
          space,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('#', style: Styles.bodyMediumBold.copyWith(color: AppColors.primary)),
              const SizedBox(width: 12.0),
              const Text(Texts.speak, style: Styles.bodySmall),
              const SizedBox(width: 24.0),
              Text('◊', style: Styles.bodyMediumBold.copyWith(color: AppColors.primary)),
              const SizedBox(width: 12.0),
              const Text(Texts.rws, style: Styles.bodySmall),
            ],
          ),
          space,
        ],
      ),
    );
  }
}

class Language extends StatelessWidget {
  const Language({super.key, required this.image, required this.name, required this.symbol});

  final String symbol;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Text(symbol, style: Styles.bodyMediumBold.copyWith(color: AppColors.primary)),
          const SizedBox(height: 12.0),
          SvgPicture.asset(image, height: 28.0),
          const SizedBox(height: 20.0),
          Text(name, style: Styles.bodyMedium),
        ],
      ),
    );
  }
}
