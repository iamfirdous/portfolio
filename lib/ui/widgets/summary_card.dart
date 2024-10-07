import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/ui/widgets/app_button.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/ui/widgets/simple_tilt.dart';
import 'package:portfolio/ui/widgets/top_snack_bar.dart/downloading_snack_bar.dart';
import 'package:portfolio/ui/widgets/top_snack_bar.dart/top_snack_bar.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);
    final padding = isMobile ? 32.0 : 42.0;
    final art = isMobile ? Images.my_art_mobile : Images.my_art;
    final artHeight = isMobile ? 140.0 : 192.0;
    return AppCard(
      constraints: BoxConstraints(
        maxWidth: 700.0,
        minHeight: isMobile ? 0.0 : Utils.cardWidth(context),
      ),
      padding: EdgeInsets.fromLTRB(padding, 30.0, padding, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            textAlign: TextAlign.justify,
            text: const TextSpan(
              style: Styles.bodyMedium,
              children: [
                TextSpan(text: Texts.im),
                TextSpan(text: Texts.name, style: Styles.headlineMedium2),
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
          const SizedBox(height: 18.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: isMobile ? 0.0 : 32.0),
                child: SimpleTilt(
                  scale: true,
                  child: Image(height: artHeight, image: AssetImage(art)),
                ),
              ),
              SimpleTilt(
                shadow: true,
                scale: true,
                child: AppButton(
                  onTap: () => downloadResume(context),
                  text: Texts.resume,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> downloadResume(BuildContext context) async {
    const snack = DownloadingSnackBar.build(message: Texts.downloading);
    showTopSnackBar(Overlay.of(context), snack, snackBarPosition: SnackBarPosition.bottom);
    final byteData = await rootBundle.load(Images.resume);
    final blob = html.Blob([byteData.buffer.asUint8List()]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download', 'Firdous - Resume - v1.4.pdf')
      ..click();
  }
}