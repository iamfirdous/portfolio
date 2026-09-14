import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/content_data.dart';

class AdditionalExperienceSection extends StatelessComponent {
  const AdditionalExperienceSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'additional-experience',
      classes: 'section additional-section',
      [
        h2(classes: 'section-title', [.text('Talks & Awards')]),
        div(classes: 'additional-list', [
          for (final item in PortfolioData.additionalExperience)
            div(
              classes: 'additional-card',
              attributes: {
                if (item.imagePath != null) ...{
                  'data-preview': item.imagePath!,
                  'data-lightbox-src': item.imagePath!,
                  'data-lightbox-caption': item.title,
                },
              },
              [
                // Desktop Anchor Hover Preview (Fixed outside left edge)
                if (item.imagePath != null)
                  div(classes: 'card-hover-preview', [
                    img(
                      src: item.imagePath!,
                      alt: item.title,
                      classes: 'card-hover-preview-img',
                    ),
                    div(classes: 'card-hover-preview-backdrop', []),
                  ]),

                div(classes: 'additional-card-header', [
                  h3(classes: 'additional-card-title', [.text(item.title)]),
                  div(classes: 'additional-card-actions', [
                    if (item.imagePath != null)
                      button(
                        classes: 'mobile-photo-btn',
                        attributes: {
                          'type': 'button',
                          'aria-label': 'View photo: ${item.title}',
                          'title': 'View photo',
                          'data-lightbox-src': item.imagePath!,
                          'data-lightbox-caption': item.title,
                        },
                        [
                          RawText(
                            '<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>',
                          ),
                        ],
                      ),
                    if (item.badge != null)
                      span(classes: 'badge-tag', [.text(item.badge!)]),
                  ]),
                ]),
                div(classes: 'additional-card-meta', [
                  span([.text(item.organization)]),
                  span([.text('·')]),
                  span(classes: 'meta-date', [.text(item.date)]),
                ]),
                p(classes: 'additional-card-desc', [
                  .text(item.description),
                ]),
              ],
            ),
        ]),

        // Education Subsection
        div(classes: 'education-section', [
          h3(classes: 'subheading', [.text('Education')]),
          div(classes: 'education-grid', [
            for (final edu in PortfolioData.education)
              div(classes: 'education-card', [
                span(classes: 'education-degree', [.text(edu.degree)]),
                span(classes: 'education-institution', [.text(edu.institution)]),
                div(classes: 'education-meta', [
                  .text('${edu.period} · ${edu.location}'),
                ]),
              ]),
          ]),
        ]),
      ],
    );
  }
}
