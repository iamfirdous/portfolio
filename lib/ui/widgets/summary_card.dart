import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/ui/widgets/app_button.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);
    return AppCard(
      constraints: BoxConstraints(maxWidth: 700.0, minHeight: Utils.cardWidth(context)),
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24.0 : 42.0,
        isMobile ? 10.0 : 16.0,
        isMobile ? 24.0 : 42.0,
        0.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              style: Styles.bodyMedium,
              children: [
                TextSpan(text: Texts.im),
                TextSpan(text: Texts.name, style: Styles.headlineMedium1),
                TextSpan(text: Texts.summary),
                TextSpan(text: Texts.flutter, style: Styles.bodyMediumBold),
                TextSpan(text: Texts.comma),
                TextSpan(text: Texts.android, style: Styles.bodyMediumBold),
                TextSpan(text: Texts.and),
                TextSpan(text: Texts.ionic, style: Styles.bodyMediumBold),
                TextSpan(text: Texts.dot),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 32.0 : 18.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: isMobile ? 16.0 : 32.0),
                child: const Image(height: 180.0, image: AssetImage(Images.my_art)),
              ),
              AppButton(onTap: () => downloadResume(), text: Texts.resume),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> downloadResume() async {
    final byteData = await rootBundle.load(Images.resume);
    final blob = html.Blob([byteData.buffer.asUint8List()]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download', 'Firdous - Resume - v1.4.pdf')
      ..click();
  }
}