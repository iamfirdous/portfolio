import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class TabSelect extends StatelessWidget {

  const TabSelect({
    super.key,
    required this.tabHeads,
    required this.tabViews,
    this.initialIndex = 1,
    this.onChange,
    this.isSmall = false,
  })  : assert(tabHeads.length == tabViews.length,
            'tabHeads & tabHeads must have equal length'),
        assert(initialIndex < tabHeads.length, 'initialIndex out of bound');

  final List<String> tabHeads;
  final List<Widget> tabViews;
  final int initialIndex;
  final Function? onChange;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);

    final tabs = Container(
      width: 364.0,
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: TabBar(
        dragStartBehavior: DragStartBehavior.down,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: AppColors.cardColor,
        ),
        indicatorWeight: 0,
        dividerHeight: 0.0,
        splashBorderRadius: BorderRadius.circular(32.0),
        labelStyle: Styles.headlineSmall,
        unselectedLabelColor: AppColors.secondary,
        tabs: tabHeads.map((tab) => SizedBox(height: 36.0, child: Tab(text: tab))).toList(),
        onTap: (index) => onChange != null ? onChange!(index) : null,
      ),
    );

    const name = Text(Texts.name, style: Styles.headlineMedium);
    final contact = InkWell(
      onTap: () => launchUrl(Uri.parse(Texts.mail)),
      borderRadius: BorderRadius.circular(8.0),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Text(Texts.contact, style: Styles.label),
      ),
    );

    return DefaultTabController(
      initialIndex: initialIndex,
      length: tabHeads.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: isMobile ? 12.0 : 48.0),
          if (isMobile) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(children: [name, const SizedBox(height: 12.0), tabs]),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [name, tabs, contact],
              ),
            ),
          ],
          Expanded(child: TabBarView(children: tabViews)),
        ],
      ),
    );
  }
}
