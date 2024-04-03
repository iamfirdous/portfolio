import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/widgets/app_button.dart';
import 'package:portfolio/ui/widgets/app_card.dart';
import 'package:portfolio/util/constants.dart';
import 'package:portfolio/util/project_model.dart';
import 'package:portfolio/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Utils.isMobile(context);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: MasonryGridView.count(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: isMobile ? 24.0 : 48.0),
            itemCount: allProjects.length,
            crossAxisCount: isMobile ? 1 : 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            itemBuilder: (context, index) {
              final project = allProjects.reversed.toList()[index];
              final url = Uri.parse(project.link);
              return AppCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: '${Texts.project_no}${project.number} - ', style: Styles.headlineMedium1),
                          TextSpan(text: project.name, style: Styles.bodyLarge),
                        ]
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(text: Texts.role, style: Styles.bodyMediumBold),
                          TextSpan(text: project.role, style: Styles.bodyMedium),
                        ]
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(project.desc, style: Styles.bodyMedium.copyWith(height: 2.0)),
                    const SizedBox(height: 12.0),
                    Flex(
                      direction: isMobile ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final tool in project.tools) ...[
                              SvgPicture.asset(tool, height: 64.0),
                              const SizedBox(width: 8.0),
                            ],
                          ],
                        ),
                        if (project.action.isEmpty)
                          const SizedBox()
                        else ...[
                          const SizedBox(height: 24.0),
                          AppButton(onTap: () => launchUrl(url), text: project.action),
                        ],
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
