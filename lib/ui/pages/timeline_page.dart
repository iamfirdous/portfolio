import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/ui/widgets/slide_in_grid.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);
    final image = isMobile ? Images.timeline_mobile : Images.timeline;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 850.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: isMobile ? 24.0 : 48.0),
            child: AnimationLimiter(
              child: SlideInGrid(position: 0, child: Image(image: AssetImage(image))),
            ),
          ),
        ),
      ),
    );
  }
}