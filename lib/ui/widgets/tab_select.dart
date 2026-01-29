import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:portfolio/ui/widgets/simple_tilt.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class TabSelect extends StatelessWidget {
  const TabSelect({
    super.key,
    required this.tabHeads,
    required this.tabViews,
    this.onChange,
    this.isSmall = false,
  }) : assert(tabHeads.length == tabViews.length,
            'tabHeads & tabHeads must have equal length');

  final List<String> tabHeads;
  final List<Widget> tabViews;
  final Function(int)? onChange;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);

    Widget tabs(TabController controller) => SimpleTilt(
          shadow: true,
          scale: true,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400.0),
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(32.0),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 4.0)
              ],
            ),
            child: TiltParallax(
              size: const Offset(5.0, 5.0),
              child: TabBar(
                controller: controller,
                dragStartBehavior: DragStartBehavior.down,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: AppColors.primary,
                ),
                indicatorWeight: 0,
                dividerHeight: 0.0,
                splashBorderRadius: BorderRadius.circular(32.0),
                labelStyle: Styles.headlineSmall.copyWith(color: Colors.white),
                unselectedLabelColor: AppColors.secondary,
                tabs: tabHeads
                    .map((tab) => SizedBox(height: 36.0, child: Tab(text: tab)))
                    .toList(),
              ),
            ),
          ),
        );

    const name =
        SimpleTilt(scale: true, child: Text(Texts.name, style: Styles.headlineMedium));
    final contact = SimpleTilt(
      scale: true,
      radius: 32.0,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(Texts.mail)),
        borderRadius: BorderRadius.circular(8.0),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Text(Texts.contact, style: Styles.label),
        ),
      ),
    );

    return DefaultTabController(
      initialIndex: 1,
      length: tabHeads.length,
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() => onChange != null ? onChange!(controller.index) : null);
        return Column(
          mainAxisSize: .min,
          children: [
            SizedBox(height: isMobile ? 12.0 : 48.0),
            if (isMobile) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [name, const SizedBox(height: 4.0), tabs(controller)],
                ),
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [name, tabs(controller), contact],
                ),
              ),
            ],
            Expanded(child: TabBarView(children: tabViews)),
          ],
        );
      }),
    );
  }
}
