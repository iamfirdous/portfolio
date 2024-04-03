import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = Utils.cardWidth(context);

    return AppCard(
      width: cardWidth,
      height: cardWidth,
      padding: EdgeInsets.zero,
      bgImage: Images.map_placeholder,
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     const SizedBox(height: 70.0),
      //     const Image(height: 100.0, image: AssetImage(Images.map_marker)),
      //     Padding(
      //       padding: const EdgeInsets.all(24.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             width: 32.0,
      //             height: 32.0,
      //             alignment: Alignment.center,
      //             decoration: const BoxDecoration(
      //               color: AppColors.cardColor,
      //               shape: BoxShape.circle,
      //             ),
      //             child: const Icon(Icons.remove, size: 24.0),
      //           ),
      //           Container(
      //             width: 32.0,
      //             height: 32.0,
      //             alignment: Alignment.center,
      //             decoration: const BoxDecoration(
      //               color: AppColors.cardColor,
      //               shape: BoxShape.circle,
      //             ),
      //             child: const Icon(Icons.add, size: 24.0),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      child: const Center(child: Image(height: 100.0, image: AssetImage(Images.map_marker))),
    );
  }
}
