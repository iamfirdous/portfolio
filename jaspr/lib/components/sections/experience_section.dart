import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/content_data.dart';

class ExperienceSection extends StatelessComponent {
  const ExperienceSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'experience', classes: 'section experience-section', [
      h2(classes: 'section-title', [.text('Experience')]),
      div(classes: 'timeline', [
        for (final exp in PortfolioData.experiences)
          div(
            classes: 'timeline-item${exp.isCurrent ? ' active' : ''}',
            [
              span(classes: 'timeline-dot', []),
              div(classes: 'timeline-meta', [
                .text(exp.period),
              ]),
              div(classes: 'timeline-heading', [
                div(classes: 'timeline-company-row', [
                  span(classes: 'timeline-company', [.text(exp.company)]),
                  span(classes: 'timeline-location', [.text('· ${exp.location}')]),
                ]),
                span(classes: 'timeline-role', [.text(exp.role)]),
              ]),
              ul(classes: 'timeline-bullets', [
                for (final bullet in exp.highlights)
                  li([.text(bullet)]),
              ]),
              div(classes: 'timeline-tags', [
                for (final tag in exp.tags)
                  span(classes: 'tech-tag', [.text(tag)]),
              ]),
            ],
          ),
      ]),
    ]);
  }
}
