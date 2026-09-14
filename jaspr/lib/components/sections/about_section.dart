import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/content_data.dart';

class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'section about-section', [
      h2(classes: 'section-title', [.text('About')]),
      div(classes: 'about-text', [
        for (final paragraph in PortfolioData.aboutParagraphs)
          p(_parseFormattedText(paragraph)),
      ]),
    ]);
  }

  List<Component> _parseFormattedText(String text) {
    final List<Component> components = [];
    final parts = text.split('**');
    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isEmpty) continue;
      if (i % 2 == 1) {
        components.add(strong([.text(parts[i])]));
      } else {
        components.add(.text(parts[i]));
      }
    }
    return components;
  }
}
